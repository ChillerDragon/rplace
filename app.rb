require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'

require_relative 'config/application'

get "/pixel" do
    content_type :json
    pixels = []
    # THIS IS HORRIBLY STUPID AND SLOW
    (0..Pixel::MAP_WIDTH).each do |x|
        (0..Pixel::MAP_HEIGHT).each do |y|
            pixel = Pixel.where(x: x, y: y).order("created_at ASC").limit(1).first
            pixels << pixel unless pixel.nil?
        end
    end
    JSON.generate(
        pixels.map do |pixel|
            {
                x: pixel.x,
                y: pixel.y,
                color: pixel.color
            }
        end
    )
end

post "/pixel" do
    content_type :json
    pixel = Pixel.new(x: params[:x], y: params[:y], color: params[:color])
    if pixel.save
        json message: 'OK'
    else
        json errors: pixel.errors.full_messages
    end
end
