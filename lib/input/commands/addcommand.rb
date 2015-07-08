require_relative 'command'
require_relative '../inputbuffer'
require_relative '../../system/inventory'


class AddCommand < Command

  @buffer = InputBuffer.instance
  def initialize(item, amount)
    @item = item
    @amount = amount
  end

  def execute()
    Inventory.instance.add(@amount, @item)
    InputBuffer.instance.insert(@amount, @item)
  end

  def unexecute()
    Inventory.instance.remove(@amount, @item)
    InputBuffer.instance.remove(@amount, @item)
  end
end
