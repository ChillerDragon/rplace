class Pixel < ActiveRecord::Base
    COLORS = %w(red green blue)

    validates :x, presence: true
    validates :y, presence: true
    validates_numericality_of :x, greater_than_or_equal_to: 0, less_than_or_equal_to: 100
    validates_numericality_of :y, greater_than_or_equal_to: 0, less_than_or_equal_to: 100
    validates :color, presence: true, inclusion: {
        in: COLORS,
        message: "%{value} is not a valid color. Valid colors are: #{COLORS.join(', ')}."
    }
end
