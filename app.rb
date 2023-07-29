require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'sinatra/contrib'
require 'rmagick'

include Magick

require_relative 'config/application'
require_relative 'src/pixel_state'
require_relative 'src/user_actions'

get "/pixel" do
  respond_to do |f|
    f.json {
      JSON.generate(PixelState.get_all)
    }
    f.png {
      PixelState.get_img
    }
  end
end

post "/pixel" do
    place_pixel(params[:x].to_i, params[:y].to_i, params[:color])
end
