require "sinatra/activerecord/rake"
require_relative 'config/application'

task :console do
    require 'rubygems'
    require 'pry'

    Pry.start
end

namespace :db do
    task :load_config do
        require "./app"
    end
end