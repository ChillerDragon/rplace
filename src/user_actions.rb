def place_pixel(x, y, color)
    content_type :json
    pixel = Pixel.new(x:, y:, color:)
    if pixel.save
        PixelState.set(x, y, color)
        json message: 'OK'
    else
        json errors: pixel.errors.full_messages
    end
end