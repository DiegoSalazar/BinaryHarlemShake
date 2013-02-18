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
    t = Thread.new { system "afplay #{AUDIO_FILE}" }
    s = new width || 50, height || 25
    s.start
  # rescue Interrupt
  #   s.kill
  #   t.kill
  # ensure
  #   puts 'fin'
  #   exit 0
  end
end
