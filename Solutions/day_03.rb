require_relative "solution.rb"

class Day03
  include Solution

  def solve_part_1
    input = get_input(@example ? "input/example-03.txt" : "input/input-03.txt")

    count = input.length
    length = input[0].length

    gamma = ""
    epsilon = ""

    for i in 0..length - 1
      ones = input.count { |n| n[i] == "1" }
      zeros = input.count { |n| n[i] == "0" }

      is_zero = zeros > ones

      gamma = gamma + (is_zero ? "0" : "1")
      epsilon = epsilon + (is_zero ? "1" : "0")
    end

    puts gamma.to_i(2) * epsilon.to_i(2)
  end

  def solve_part_2
    input1 = get_input(@example ? "input/example-03.txt" : "input/input-03.txt")
    input2 = input1.dup

    length = input1[0].length
    i = 0
    while input1.length > 1 || input2.length > 1
      if input1.length > 1
        ones1 = input1.count { |n| n[i] == "1" }
        zeros1 = input1.count { |n| n[i] == "0" }

        look = "0"
        if ones1 >= zeros1
          look = "1"
        end
        input1 = input1.filter { |n| n[i] == look }
      end

      if input2.length > 1
        ones2 = input2.count { |n| n[i] == "1" }
        zeros2 = input2.count { |n| n[i] == "0" }

        look = "1"
        if ones2 >= zeros2
          look = "0"
        end

        input2 = input2.filter { |n| n[i] == look }
      end

      i = i + 1
    end

    o2_generator_rating = input1[0].to_i(2)
    c02_scrubber_rating = input2[0].to_i(2)

    puts o2_generator_rating * c02_scrubber_rating
  end
end
