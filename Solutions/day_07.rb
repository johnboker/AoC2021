require_relative "solution.rb"

class Day07
  include Solution

  def solve_part_1
    locations = get_input(@example ? "input/example-07.txt" : "input/input-07.txt")[0]
      .split(",").map { |i| i.to_i }

    min = locations.min()
    max = locations.max()

    min_fuel = -1
    for i in min..max
      fuel = locations.map { |l| fuel_to_move_1(l, i) }.sum()
      min_fuel = fuel if fuel < min_fuel || min_fuel < 0
    end

    puts min_fuel
  end

  def solve_part_2
    locations = get_input(@example ? "input/example-07.txt" : "input/input-07.txt")[0]
      .split(",").map { |i| i.to_i }

    min = locations.min()
    max = locations.max()

    min_fuel = -1
    for i in min..max
      fuel = locations.map { |l| fuel_to_move_2(l, i) }.sum()
      min_fuel = fuel if fuel < min_fuel || min_fuel < 0
    end

    puts min_fuel
  end

  def fuel_to_move_1(from, to)
    return (from - to).abs()
  end

  def fuel_to_move_2(from, to)
    n = (from - to).abs()
    fuel = n * (n + 1) / 2
    return fuel
  end
end
