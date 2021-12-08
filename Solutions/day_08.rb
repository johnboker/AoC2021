require_relative "solution.rb"

class Day08
  include Solution

  def solve_part_1
    input = get_input(@example ? "input/example-08-2.txt" : "input/input-08.txt")
    sum = 0
    for line in input
      parts = line.split("|")
      outputPatterns = parts[1].split().map { |d|
        case d.length
        when 2
          1
        when 4
          4
        when 3
          7
        when 7
          8
        else
          -1
        end
      }
      sum += outputPatterns.count { |d| d > -1 }
    end
    puts sum
  end

  def solve_part_2
    input = get_input(@example ? "input/example-08-2.txt" : "input/input-08.txt")
    sum = 0
    for line in input
      parts = line.split("|")
      parts[0] = parts[0].split().map { |d| d.chars.sort.join }
      parts[1] = parts[1].split().map { |d| d.chars.sort.join }
      # puts parts[0], ""

      digits = Array.new(10)

      digits[1] = parts[0].filter { |d| d.length == 2 }.first
      digits[4] = parts[0].filter { |d| d.length == 4 }.first
      digits[7] = parts[0].filter { |d| d.length == 3 }.first
      digits[8] = parts[0].filter { |d| d.length == 7 }.first

      # 2,3,5
      l5 = parts[0].filter { |d| d.length == 5 }

      # 0,6,9
      l6 = parts[0].filter { |d| d.length == 6 }

      digits[3] = l5.filter { |d| (digits[1].chars - d.chars).empty? }.first
      l5.delete(digits[3])

      digits[9] = l6.filter { |d| (digits[3].chars - d.chars).empty? }.first
      l6.delete(digits[9])

      digits[0] = l6.filter { |d| (digits[1].chars - d.chars).empty? }.first
      l6.delete(digits[0])

      digits[6] = l6.first

      digits[5] = l5.filter { |d| (d.chars - digits[6].chars).empty? }.first
      l5.delete(digits[5])

      digits[2] = l5.first

      segment = ""
      for d in parts[1]
        a = digits.find_index(d)
        segment = segment + a.to_s
      end
      sum += segment.to_i
    end
    puts sum
  end
end
