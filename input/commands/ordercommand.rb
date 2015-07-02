require_relative 'command'
require_relative '../inputbuffer'
require_relative '../../system/inventory'

class OrderCommand < Command

  @buffer = InputBuffer.instance
  def initialize(order)
    @order = order
  end

  def execute()
    Inventory.instance.remove_all(@order)
  end

  def unexecute()
    @buffer.remove(@n)
  end
end
