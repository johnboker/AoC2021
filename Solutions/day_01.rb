require_relative "solution.rb"

class Day01
  include Solution

  def solve_part_1
    input = File.readlines @example ? "input/example-01.txt" : "input/input-01.txt"
    cnt = 0
    for i in 1..input.length
      if input[i].to_i > input[i - 1].to_i
        cnt = cnt + 1
      end
    end
    puts cnt

    # alternate version
    #puts input.map(&:to_i).each_cons(2).count { |a, b| b > a }
  end

  def solve_part_2
    input = File.readlines @example ? "input/example-01.txt" : "input/input-01.txt"
    cnt = 0
    for i in 0..input.length - 3
      window1 = input[i].to_i + input[i + 1].to_i + input[i + 2].to_i
      window2 = input[i + 1].to_i + input[i + 2].to_i + input[i + 3].to_i
      if window1 < window2
        cnt = cnt + 1
      end
    end
    puts cnt

    # alternate version
    #puts input.map(&:to_i).each_cons(3).map(&:sum).each_cons(2).count { |a, b| b > a }
  end
end
