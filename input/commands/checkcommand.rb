require_relative 'command'
require_relative '../inputbuffer'
require_relative '../../system/inventory'
require_relative '../../output/outputbuffer'


class CheckCommand < Command

  @buffer = InputBuffer.instance
  def initialize(item, amount)
    @amount = amount
    @item = item
  end

  def execute()
    if Inventory.instance.has?(@amount, @item)
      message = "Yes, #{@amount} #{@item} are available"
    else
      message = "No, #{@amount} #{@item} are not available"
    end
    OutputBuffer.instance.insert(message)
   
  end

  def unexecute()
    @buffer.remove(@n)
  end
end
