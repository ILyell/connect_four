require 'rspec'
require './lib/cell'
require './lib/board'
require './lib/turn'
require './lib/renderer'
require './lib/game_start'
require './lib/game_over'
require './lib/player'
require 'pry'

require './lib/renderer'
RSpec.configure do |config|
    config.formatter = :documentation
end

