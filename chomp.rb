require "move"
require "board"

def negamax(b, d)
  rx = 0
  cx = 0
  (0..b.rows-1).each do |r|
    (0..b.cols-1).each do |c|
      if b[r, c] && (r > 0 || c > 0)
        rx = r
        cx = c
        bp = b.clone
        bp.move Move.new(r, c)
        next if negamax(bp, d + 1)
        if d == 0
          m = Move.new(r, c)
          b.move m
          puts "> #{m} :-)"
        end
        return true
      end
    end
  end

  if d == 0
    m = Move.new(rx, cx)
    b.move m
    print "> #{m}"
    if rx == 0 && cx == 0
      puts " :-("
    else
      puts " :-P"
    end
  end

  return false
end

b = Board.new
puts b
print "? "

while (s = gets)
  exit unless s
  s.chomp!

  m = Move.from_s s
  b.move m
  puts b
  puts(":-D") || exit if b.empty?

  negamax(b, 0)
  puts b

  exit if b.empty?
  print "? "
end
