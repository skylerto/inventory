require_relative '../buffer'

# Abstract command
class Command
  def execute()
  end

  def unexecute()
  end
end

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

