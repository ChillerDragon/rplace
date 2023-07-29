require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'

require_relative 'config/application'
require_relative 'src/pixel_state'

get "/pixel" do
    content_type :json
    JSON.generate(PixelState.get_all)
end

post "/pixel" do
    content_type :json
    x = params[:x].to_i
    y = params[:y].to_i
    color = params[:color]
    pixel = Pixel.new(x:, y:, color:)
    if pixel.save
        PixelState.set(x, y, color)
        json message: 'OK'
    else
        json errors: pixel.errors.full_messages
    end
end
