require 'harlem_bits/bit'
require 'harlem_bits/cli_rendering'
require 'harlem_bits/arena'
require 'harlem_bits/harlem'
require 'harlem_bits/version'

module HarlemBits
  DURATION = 30
  FRAME_RATE = 30.0
  AUDIO_FILE = 'resources/HarlemShake.mp3'

  def self.shake(width, height)
    if OS.osx?
      t = Thread.new { system "afplay #{AUDIO_FILE}" }
    elsif OS.linux?
      t = Thread.new { system "mpg123 #{AUDIO_FILE}" }
    else
      # Playing songs from windows command line? Can it be done? Has science gone too far?
      t = Thread.new { puts "Pretend that there's music, pal." }
    end
    s = Harlem.new width || 50, height || 25
    s.start
  rescue Interrupt
    s.kill
    t.kill
  ensure
    puts 'fin'
    exit 0
  end
end
