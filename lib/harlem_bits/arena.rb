module HarlemBits
  class Arena
    include CliRendering
  
    def initialize(width, height)
      @width, @height, @arena = width.to_i, height.to_i, []
      @height.times do |h|
        @arena << (1..@width).map do |i| 
          Bit.new rand_color
        end
      end
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
end
