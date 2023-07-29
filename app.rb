require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'

require_relative 'config/application'
require_relative 'src/pixel_state'
require_relative 'src/user_actions'

get "/pixel" do
    content_type :json
    JSON.generate(PixelState.get_all)
end

post "/pixel" do
    place_pixel(params[:x].to_i, params[:y].to_i, params[:color])
end
