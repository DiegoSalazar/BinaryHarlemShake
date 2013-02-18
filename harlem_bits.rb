require 'pp'
require 'colored'
COLORS = Colored.methods - [:extra, :colors, :colorize, :color] - Object.methods

class Bit
  def initialize(color, state = false)
    @color, @state = color, state
  end
  
  def switch
    @state = !@state 
  end
  
  def off
    @state = false
  end
  
  def to_s
    @state ? '1'.send(@color) : '0'
  end
  alias_method :inspect, :to_s
end

class Arena
  def initialize(width, height)
    @width, @height, @arena = width.to_i, height.to_i, []
    @height.times do |h|
      @arena << (0..@width).map { |i| Bit.new COLORS[rand(COLORS.size-1)] }
    end
  end
  
  def draw
    CliRenderer.new(@arena).draw
  end
  
  def center
    @arena[@height/2][@width/2]
  end
  
  def clear
    @arena.each { |row| row.each { |bit| bit.off } }
  end
  
  def random!
    random.map { |bit| bit.switch }
  end
  
  def random
    found = []
    @arena.each do |row|
      row.each do |bit|
        found << bit if rand(@width) < @width/3
      end
    end
    found
  end
end

class CliRenderer
  def initialize(arena)
    @arena = arena
  end
  
  def draw
    puts with_enough_breaks_to_page_down
  end
  
  private
  
  def with_enough_breaks_to_page_down
    "#{"\n" * 50}#{with_space_below}"
  end
  
  def with_space_below
    "#{rows_with_newlines}#{"\n" * 5}"
  end
  
  def rows_with_newlines
    @arena.map { |row| with_leading_space row }.join("\n")
  end
  
  def with_leading_space(row)
    "#{' '*10}#{row.join(' ')}"
  end
end

class Harlem
  DURATION = 30
  FRAME_RATE = 30.0
  AUDIO_FILE = 'HarlemShake.mp3'
  
  def self.shake(width, height)
    t = Thread.new { system "afplay #{AUDIO_FILE}" }
    s = new width || 30, height || 15
    s.start
  rescue Interrupt
    t.kill
    s.kill
  ensure
    puts 'fin'
  end
  
  def initialize(width, height)
    @arena = Arena.new width, height
    @alive = true
  end
  
  def kill
    @alive = false
  end
  
  def start
    start_t = Time.now.to_f
    last_t = Time.now.to_i
    frame = 0
    switched = false
    
    while @alive
      cur_t = Time.now.to_f
      delta = cur_t - start_t
      
      @arena.clear      
      @arena.center.switch if (delta % 2.0) / 2 > 0.5
      @arena.random! if delta >= (DURATION/2)+1
      @arena.draw
      
      break if delta > DURATION
      sleep 1/FRAME_RATE
    end
  end
end

Harlem.shake ARGV[0], ARGV[1] if $0 == __FILE__
