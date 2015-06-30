class Invoker
  def initialize()
    @queue = []
  end

  def do(x)
    x.execute()
    @queue << x
  end

  def undo()
    x = @queue.pop
    x.unexecute() if x
  end
end

