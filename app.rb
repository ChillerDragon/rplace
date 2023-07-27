require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'

require_relative 'config/application'

get "/pixel" do
    content_type :json
    JSON.generate(
        Pixel.all.map do |pixel|
            {
                x: pixel.x,
                y: pixel.y
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
