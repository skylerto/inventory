require_relative 'bag'
require 'singleton'

class Inventory
  include Singleton
  
  def initialize
    @bag = Bag.new
  end


end
