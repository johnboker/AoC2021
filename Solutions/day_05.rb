require_relative "solution.rb"

class Day05
  include Solution

  def solve_part_1
    input = get_input(@example ? "input/example-05.txt" : "input/input-05.txt")
    lines = input.map { |l| Line.new(l) }.select { |l| l.p1.x == l.p2.x || l.p1.y == l.p2.y }
    solve1(lines)
  end

  def solve_part_2
    input = get_input(@example ? "input/example-05.txt" : "input/input-05.txt")
    lines = input.map { |l| Line.new(l) }
    solve1(lines)
  end

  def solve1(lines)
    points_hash = {}

    lines.each { |line|
      line.get_points.each { |point|
        k = point.to_s
        points_hash[k] = points_hash.key?(k) ? (points_hash[k] + 1) : 1
      }
    }

    puts points_hash.values.count { |p| p > 1 }
  end

  class Line
    attr_accessor :p1
    attr_accessor :p2

    def initialize(line)
      a = line.scan(/(\d+),(\d+) -> (\d+),(\d+)/)[0]
      @p1 = Point.new(a[0].to_i, a[1].to_i)
      @p2 = Point.new(a[2].to_i, a[3].to_i)
    end

    def to_s
      return "#{p1} -> #{p2}"
    end

    def get_points
      points = Array.new()

      x_delta = @p1.x == @p2.x ? 0 : (@p1.x > @p2.x ? -1 : 1)
      y_delta = @p1.y == @p2.y ? 0 : (@p1.y > @p2.y ? -1 : 1)
      len = (x_delta == 0 ? (@p1.y - @p2.y) : (@p1.x - @p2.x)).abs() + 1

      x, y = @p1.x, @p1.y

      len.times {
        points.push(Point.new(x, y))
        x, y = x + x_delta, y + y_delta
      }

      return points
    end
  end

  class Point
    attr_accessor :x
    attr_accessor :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def to_s
      return "#{x},#{y}"
    end
  end
end
