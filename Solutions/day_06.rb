require_relative "solution.rb"

class Day06
  include Solution

  def solve_part_1
    fish = get_input(@example ? "input/example-06.txt" : "input/input-06.txt")[0]
    .split(",").map { |i| i.to_i }

    for i in 0...80 
      for f in  0...fish.length
        if fish[f] == 0
          fish[f] = 7
          fish.append(8)
        end
        fish[f] -= 1
      end
    end

    puts fish.count
  end

  def solve_part_2
    input = get_input(@example ? "input/example-06.txt" : "input/input-06.txt")[0]
      .split(",").map { |i| i.to_i }

    fish = Array.new(9) { |z| 0 }
    for f in input
      fish[f] = fish[f] + 1
    end

    for i in 0...256
      fish = fish.rotate()
      fish[6] = fish[6] + fish[8]
    end

    puts fish.sum()
  end

end
