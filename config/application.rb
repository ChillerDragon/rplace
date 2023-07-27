require 'active_record'
require 'sqlite3'
require 'yaml'

config_path = File.join(__dir__, "database.yml")
ActiveRecord::Base.configurations = YAML.load_file(config_path)
ActiveRecord::Base.establish_connection(:development)

logger = Logger.new(STDOUT)
logger.formatter = proc do |severity, datetime, progname, msg|
   "#{msg}\n"
end
ActiveRecord::Base.logger = logger

Dir["#{__dir__}/../models/*.rb"].each {|file| require file }