class PolyTreeNode

  attr_accessor :parent, :children
  attr_reader :value

  def initialize(value = nil)
    @value, @parent, @children = value, nil, []
  end


  def parent(node)
    @parent = node
  end


end
