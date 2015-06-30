require_relative 'invokers'

# Buffer Invoker
# => Invokes the actions and logs the command outputs to the console.
class BufferInvoker < Invoker

    # SUPER: Carries out the action, adds the actions to the undo queue.
    # SUPER: => x: an action to execute.
    # Outputs buffer.
    def do(x)
        super(x)
        puts(Buffer.instance.string())
    end

    # SUPER: Grabs the first element from the undo queue and 'unexecute's it
    # Outputs buffer.
    def undo()
        super()
        puts(Buffer.instance.string())
    end
end
