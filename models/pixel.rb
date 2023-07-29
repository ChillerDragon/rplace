class Pixel < ActiveRecord::Base
    MAP_HEIGHT = 50
    MAP_WIDTH = 50
    COLORS = %w(red green blue white)

    validates :x, presence: true
    validates :y, presence: true
    validates_numericality_of :x, greater_than_or_equal_to: 0, less_than_or_equal_to: MAP_WIDTH
    validates_numericality_of :y, greater_than_or_equal_to: 0, less_than_or_equal_to: MAP_HEIGHT
    validates :color, presence: true, inclusion: {
        in: COLORS,
        message: "%{value} is not a valid color. Valid colors are: #{COLORS.join(', ')}."
    }
end
