require_relative 'command'
require_relative '../inputbuffer'
require_relative '../../system/inventory'
require_relative '../../output/outputbuffer'


class ShowCommand < Command

  @buffer = InputBuffer.instance
  def initialize()
  end

  def execute()
    OutputBuffer.instance.insert(Inventory.instance.print)
  end

  def unexecute()
    @buffer.remove(@n)
  end
end
