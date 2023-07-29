require_relative '../config/application'

class PixelState
    @@db_loaded = false
    @@pixels = []

    def self.load_from_db
        @@pixels = []
        puts "loading pixel state from history"
        start = Time.now
        # THIS IS HORRIBLY STUPID AND SLOW
        (0..Pixel::MAP_WIDTH).each do |x|
            (0..Pixel::MAP_HEIGHT).each do |y|
                pixel = Pixel.where(x: x, y: y).order("created_at ASC").limit(1).first
                pixel ||= Pixel.new(x:, y:, color: 'white')
                @@pixels << pixel.color
            end
        end
        puts "finished loading pixel state from history (took #{Time.now - start})"
        @@db_loaded = true
    end

    def self.get_all
        unless @@db_loaded
            self.load_from_db
        end
        @@pixels
    end

    def self.get(x, y)
        @@pixels[x + y * Pixel::MAP_WIDTH]
    end

    def self.set(x, y, color)
        @@pixels[x + y * Pixel::MAP_WIDTH] = color
    end
end
