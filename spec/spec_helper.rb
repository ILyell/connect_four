require 'rspec'
require './lib/cell'
require './lib/board'
require './lib/turn'
require './lib/renderer'
require 'pry'

RSpec.configure do |config|
    config.formatter = :documentation
end
