module HarlemBits
  class Bit
    def initialize(color, on = false)
      @color, @on = color, on
    end
  
    def switch
      @on = !@on 
    end
  
    def off
      @on = false
    end
  
    def to_s
      @on ? ('1'.send(@color) rescue '1') : '0'
    end
    alias_method :inspect, :to_s
  end
end
