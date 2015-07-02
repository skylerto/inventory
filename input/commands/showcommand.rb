require_relative 'command'
require_relative '../inputbuffer'
require_relative '../../system/inventory'

class ShowCommand < Command

  @buffer = InputBuffer.instance
  def initialize()
  end

  def execute()
    puts Inventory.instance.print
  end

  def unexecute()
    @buffer.remove(@n)
  end
end
