require 'rspec'
require './lib/cell'
require './lib/board'
require './lib/turn'
require './lib/renderer'
require 'pry'

require './lib/renderer'
RSpec.configure do |config|
    config.formatter = :documentation
end
