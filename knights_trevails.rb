require_relative "skeleton/lib/00_tree_node"

class KnightPathFinder

  attr_reader :pos
  attr_accessor :visited_pos, :move_tree

  def self.valid_moves(pos) #return array of valid moves
    all_moves = []
    possibilties = [[2,-1], [2,1], [-2,-1], [-2,1],
                  [1,-2], [-1,-2], [1,2], [-1,2]]
    possibilties.each do |move|
      x = pos.first + move.first
      y = pos.last + move.last
      all_moves << [x,y] if x.between?(0,7) && y.between?(0,7)
    end

    all_moves
  end

  def initialize(pos)
    @pos = pos
    @visited_pos = [pos]
  end

  def build_move_tree
    @move_tree =
  end

  def new_move_pos(pos)
    new_moves = KnightPathFinder.valid_moves(pos)
    new_moves.reject! { |move| visited_pos.include?(move) }
    visited_pos.concat(new_moves)
    new_moves
  end


end
