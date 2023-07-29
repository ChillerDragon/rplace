require_relative '../config/application'

class PixelState
    @@db_loaded = false
    @@pixels = []
    @@img = nil

    def self.load_from_db
        @@pixels = []
        puts "loading pixel state from history"
        start = Time.now
        if @@img.nil?
            @@img = Image.new(PlacePixel::MAP_WIDTH, PlacePixel::MAP_HEIGHT)
            @@img.background_color = 'white'
            @@img.format = 'png'
        end
        d = Draw.new
        # THIS IS HORRIBLY STUPID AND SLOW
        (0..PlacePixel::MAP_WIDTH).each do |x|
            (0..PlacePixel::MAP_HEIGHT).each do |y|
                pixel = PlacePixel.where(x: x, y: y).order("created_at ASC").limit(1).first
                pixel ||= PlacePixel.new(x:, y:, color: 'white')
                @@pixels << pixel.color
                d.fill(pixel.color)
                d.point(x, y)
            end
        end
        d.draw(@@img)
        puts "finished loading pixel state from history (took #{Time.now - start})"
        @@db_loaded = true
    end

    def self.get_all
        unless @@db_loaded
            self.load_from_db
        end
        @@pixels
    end

    def self.get_img
        if @@img.nil?
            self.load_from_db
        end
        @@img.to_blob
    end

    def self.get(x, y)
        unless @@db_loaded
            self.load_from_db
        end
        @@pixels[x + y * PlacePixel::MAP_WIDTH]
    end

    def self.set(x, y, color)
        unless @@db_loaded
            self.load_from_db
        end
        @@pixels[x + y * PlacePixel::MAP_WIDTH] = color
        d = Draw.new
        d.fill(color)
        d.point(x, y)
        d.draw(@@img)
    end
end
