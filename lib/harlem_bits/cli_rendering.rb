module HarlemBits
  module CliRendering
    require 'colored'
    COLORS = Colored.methods - [:extra, :colors, :colorize, :color] - Object.methods
  
    def draw
      puts with_enough_breaks_to_page_down
    end
  
    private
  
    def rand_color
      COLORS[rand(COLORS.size-1)]
    end
  
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
end
