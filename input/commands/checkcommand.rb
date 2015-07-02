require_relative 'command'
require_relative '../inputbuffer'
require_relative '../../system/inventory'

class CheckCommand < Command

  @buffer = InputBuffer.instance
  def initialize(item, amount)
    @amount = amount
    @item = item
  end

  def execute()
    puts Inventory.instance.has?(@amount, @item)
  end

  def unexecute()
    @buffer.remove(@n)
  end
end
