require_relative "solution.rb"

class Day11
  include Solution

  def solve_part_1
    input = get_input(@example ? "input/example-11.txt" : "input/input-11.txt")

    grid = []
    for line in input
      grid.append(line.chars.map { |c| c.to_s.to_i })
    end

    total_flashes = 0
    for step in 1..100
      flashes, grid = process_step(grid)
      total_flashes += flashes
    end

    puts "", total_flashes, ""
  end

  def solve_part_2
    input = get_input(@example ? "input/example-11.txt" : "input/input-11.txt")
    grid = []
    for line in input
      grid.append(line.chars.map { |c| c.to_s.to_i })
    end

    total_flashes = 0

    all_flashed_step = -1

    for step in 1..100000000
      flashes, grid = process_step(grid)

      if flashes == 100
        all_flashed_step = step
        break
      end
      total_flashes += flashes
    end

    puts "", all_flashed_step, ""
  end

  def process_step(current_grid)
    for r in 0...current_grid.length
      for c in 0...current_grid[0].length
        current_grid[r][c] += 1
      end
    end

    next_grid = copy(current_grid)

    flashed = []

    loop do
      flash = 0
      for r in 0...current_grid.length
        for c in 0...current_grid[0].length
          key = "#{r}_#{c}"
          if current_grid[r][c] > 9 && !flashed.include?(key)
            flashed.append(key)
            flash += 1
            flash(next_grid, r, c)
          end
        end
      end
      current_grid = next_grid
      break if flash == 0
    end

    for r in 0...current_grid.length
      for c in 0...current_grid[0].length
        if current_grid[r][c] > 9
          current_grid[r][c] = 0
        end
      end
    end

    return flashed.count, current_grid
  end

  def flash(grid, r, c)
    if c - 1 >= 0
      grid[r][c - 1] += 1
    end

    if c + 1 < grid[0].length
      grid[r][c + 1] += 1
    end

    if r - 1 >= 0
      grid[r - 1][c] += 1
    end

    if r + 1 < grid.length
      grid[r + 1][c] += 1
    end

    if c - 1 >= 0 && r - 1 >= 0
      grid[r - 1][c - 1] += 1
    end

    if c + 1 < grid[0].length && r - 1 >= 0
      grid[r - 1][c + 1] += 1
    end

    if c - 1 >= 0 && r + 1 < grid.length
      grid[r + 1][c - 1] += 1
    end

    if c + 1 < grid[0].length && r + 1 < grid.length
      grid[r + 1][c + 1] += 1
    end
  end

  def copy(grid)
    new_grid = []
    for r in 0...grid.length
      new_grid.append(grid[r].dup())
    end
    return new_grid
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
