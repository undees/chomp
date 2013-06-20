Move = Struct.new :row, :col

class Move
  def self.from_s(s)
    Move.new *(s.split(//).map(&:to_i).map { |i| i - 1 })
  end

  def to_s
    "#{row + 1}#{col + 1}"
  end
end
