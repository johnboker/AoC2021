require_relative "solution.rb"

class Day09
  include Solution

  def solve_part_1
    input = get_input(@example ? "input/example-09.txt" : "input/input-09.txt")
    grid = []
    for line in input
      row = []
      grid.append(row)
      for c in line.chars
        row.append(c.to_s.to_i)
      end
    end

    risk = 0
    for r in 0...grid.length
      for c in 0...grid[0].length
        p = grid[r][c]
        if is_low_point(grid, r, c)
          risk = risk + p + 1
        end
      end
    end

    puts risk
  end

  def solve_part_2
    input = get_input(@example ? "input/example-09.txt" : "input/input-09.txt")

    grid = []
    for line in input
      row = []
      grid.append(row)
      for c in line.chars
        row.append(c.to_s.to_i)
      end
    end

    risk = 0
    basin_sizes = []
    for r in 0...grid.length
      for c in 0...grid[0].length
        basin_sizes.append(basin_size(grid, r, c))
      end
    end

    puts basin_sizes.sort.last(3).inject(:*)
  end

  def basin_size(grid, r, c)
    if r < 0 || c < 0 || r >= grid.length || c >= grid[0].length || grid[r][c] == 9
      return 0
    end

    grid[r][c] = 9
    return 1 +
             basin_size(grid, r - 1, c) +
             basin_size(grid, r + 1, c) +
             basin_size(grid, r, c - 1) +
             basin_size(grid, r, c + 1)
  end

  def lowest_adjacent(grid, r, c)
    adjacent_points = []

    if c - 1 >= 0
      adjacent_points.append(grid[r][c - 1])
    end

    if c + 1 < grid[0].length
      adjacent_points.append(grid[r][c + 1])
    end

    if r - 1 >= 0
      adjacent_points.append(grid[r - 1][c])
    end

    if r + 1 < grid.length
      adjacent_points.append(grid[r + 1][c])
    end

    return adjacent_points.min
  end

  def is_low_point(grid, r, c)
    adjacent_points = []

    if c - 1 >= 0
      adjacent_points.append(grid[r][c - 1])
    end

    if c + 1 < grid[0].length
      adjacent_points.append(grid[r][c + 1])
    end

    if r - 1 >= 0
      adjacent_points.append(grid[r - 1][c])
    end

    if r + 1 < grid.length
      adjacent_points.append(grid[r + 1][c])
    end

    return adjacent_points.all? { |p| p > grid[r][c] }
  end

  def display(grid)
    for r in 0...grid.length
      for c in 0...grid[0].length
        print grid[r][c]
      end
      puts ""
    end
  end
end
