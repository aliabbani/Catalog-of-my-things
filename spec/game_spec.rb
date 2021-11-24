require_relative '../game'
require 'date'

describe Game do
  before :each do
    @game = Game.new(Date.new(2015, 0o1, 0o2), 'Yes', Date.new(2018, 0o1, 0o2))
    @second_game = Game.new(Date.new(2008, 0o1, 0o2), 'Yes', Date.new(2018, 0o1, 0o2))
  end

  describe '#new' do
    it 'has an instance' do
      expect(@game).to be_an_instance_of Game
    end
  end

  describe 'Test methods' do
    it 'can be archived game 1' do
      expect(@game.send(:can_be_archived?)).to be false
    end

    it 'can be archived game 2' do
      expect(@second_game.send(:can_be_archived?)).to be true
    end

    it 'tests the private method directly' do
      expect(@second_game.send(:can_be_archived?)).to be true
    end
  end
end
