require 'byebug'

class PolyTreeNode

  attr_accessor :children
  attr_reader :value, :parent

  def initialize(value = nil)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node = nil)
    # Deletes self from old parent.
    if self.parent
      old_parent = self.parent
      old_parent.children.delete(self)
    end

    # Assigns parent to passed argument.
    @parent = node

    # Add's self to new parents children without repeats.
    if node
      node.children << self unless node.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    raise "I'm the root!" if child_node.parent.nil?

    child_node.parent=()
  end

  def dfs(target_value)
    return self if self.value == target_value
    return nil if self.children.empty?

    search_results = self.children.first.dfs(target_value)

    if search_results.nil?
      search_results = self.children.last.dfs(target_value)
    end

    return search_results unless search_results.nil?
  end

  def bfs(target_value)
    queue = Array.new { [] }
    queue << self
    until queue.empty?
      return queue.first if queue.first.value == target_value
      queue.first.children.each { |child| queue << child }
      queue.shift
    end

    nil
  end

end
