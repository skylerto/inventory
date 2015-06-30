require_relative 'command'
require_relative '../buffer'
require_relative '../inventory'

class AddCommand < Command
  def initialize(item, amount)
    @item = item
    @amount = amount
  end

  def execute()
    Buffer.instance.insert(@amount, @item)
  end

  def unexecute()
    Buffer.instance.remove(@n)
  end
end
