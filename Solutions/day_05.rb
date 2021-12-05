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
    for line in lines
      points = line.get_points

      for p in points
        k = p.to_s
        a = points_hash.key?(k)
        if !a
          points_hash[k] = 1
        else
          points_hash[k] = points_hash[k] + 1
        end
      end
    end

    count = points_hash.values.count { |p| p > 1 }

    puts count
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

      if @p1.x == @p2.x
        x = @p1.x
        start_y = @p1.y
        end_y = @p2.y
        if start_y > end_y
          start_y, end_y = end_y, start_y
        end
        for y in start_y..end_y
          points.push(Point.new(x, y))
        end
      elsif @p1.y == @p2.y
        y = @p1.y
        start_x = @p1.x
        end_x = @p2.x
        if start_x > end_x
          start_x, end_x = end_x, start_x
        end
        for x in start_x..end_x
          points.push(Point.new(x, y))
        end
      else
        start_x = @p1.x
        start_y = @p1.y

        end_x = @p2.x
        end_y = @p2.y

        x_delta = 1
        if start_x > end_x
          x_delta = -1
        end

        y_delta = 1
        if start_y > end_y
          y_delta = -1
        end

        x = start_x
        y = start_y

        for d in 0..(start_x - end_x).abs()
          points.push(Point.new(x, y))
          y = y + y_delta
          x = x + x_delta
        end
      end

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

    def ==(other)
      @x == other.x &&
      @y == other.y
    end
  end
end
