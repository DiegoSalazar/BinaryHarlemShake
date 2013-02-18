module HarlemBits
  class Harlem
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
        @arena.center.switch if delta % 2.0 == 0 || (delta % 2.0) / 2.0 > 0.3
        @arena.random! if delta >= (DURATION / 2) + 1
        @arena.draw
    
        break if delta > DURATION
        sleep 1/FRAME_RATE
      end
    end
  end
end
