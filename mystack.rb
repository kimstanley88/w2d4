class MyStack
  attr_accessor :store
  def initialize(store = [])
    @store = store
  end
  def pop
    @store.pop
  end
  def push(item)
    el = Hash.new
    el[:value] = item
    self.peek[:max] < item ? el[:max] = item : el[:max] = self.peek[:max]

    self.peek[:min] > item ? el[:min] = item : el[:min] = self.peek[:min]

    @store << el
  end
  def peek
    @store[-1]
  end
  def size
    @store.count
  end
  def empty?
    @store.empty?
  end
end

class StackQueue

  def initialize
    @in_stack, @out_stack = MyStack.new, MyStack.new
  end

  def enqueue(element)
    @in_stack.push(element)
  end

  def dequeue
    flip_in_to_out if @out_stack.empty?
    @out_stack.pop
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  private

  def flip_in_to_out
    until @in_stack.empty?
      @out_stack.push(@in_stack.pop)
    end
  end
end
