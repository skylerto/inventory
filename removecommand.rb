require_relative 'command'
require_relative '../buffer'

class RemoveCommand < Command
  def initialize(item, amount)
    @item = item
    @amount = amount
  end

  def execute()
    Buffer.instance.remove(@item)
  end

  def unexecute()
    Buffer.instance.insert(@item, @amount)
  end
end
