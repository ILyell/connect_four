require 'rspec'
require './lib/cell'
require './lib/board'
require 'pry'
require './lib/renderer'
RSpec.configure do |config|
    config.formatter = :documentation
end
