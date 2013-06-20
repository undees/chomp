class Board
  attr_accessor :rows, :cols

  def initialize(rows = 3, cols = 4, squares = nil)
    @rows = rows
    @cols = cols
    @squares = squares || ([true] * (rows * cols))
  end

  def clone
    Board.new(@rows, @cols, @squares.clone)
  end

  def [](row, col)
    @squares[row * @cols + col]
  end

  def []=(row, col, val)
    @squares[row * @cols + col] = val
  end

  def empty?
    !@squares.any?
  end

  def to_s
    @squares.each_slice(@cols).map do |row|
      row.map { |cell| cell ? 'o' : '.' }.join
    end.join("\n").sub(/^o/, '*')
  end

  def move(m)
    m.row.upto(@rows - 1) do |row|
      m.col.upto(@cols - 1) do |col|
        self[row, col] = false
      end
    end
  end
end
