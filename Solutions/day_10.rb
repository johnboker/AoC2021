require_relative "solution.rb"

class Day10
  include Solution

  def solve_part_1
    input = get_input(@example ? "input/example-10.txt" : "input/input-10.txt")

    stack = []
    score = 0
    for line in input
      for c in line.chars
        if is_opening_character(c)
          stack.push(c)
        else
          opening_char = stack.pop()
          o = get_opening_character(c)
          if o != opening_char
            score += get_score_1(c)
            break
          end
        end
      end
    end
    puts score
  end

  def solve_part_2
    input = get_input(@example ? "input/example-10.txt" : "input/input-10.txt")

    stack = []
    incomplete_lines = []
    score = 0
    for line in input
      corrupt = false
      for c in line.chars
        if is_opening_character(c)
          stack.push(c)
        else
          opening_char = stack.pop()
          o = get_opening_character(c)
          if o != opening_char
            corrupt = true
            break
          end
        end
      end
      if !corrupt
        incomplete_lines.append(line)
      end
    end

    opening_scores = { "(" => 1, "[" => 2, "{" => 3, "<" => 4 }

    scores = []
    for line in incomplete_lines
      stack = []
      for c in line.chars
        if opening_scores.has_key?(c)
          stack.push(c)
        else
          stack.pop()
        end
      end
      score = 0
      for c in stack.reverse
        score = score * 5 + opening_scores[c]
      end
      scores.append(score)
    end

    puts scores.sort()[scores.length / 2]
  end

  def get_score_1(c)
    chars = { ")" => 3, "]" => 57, "}" => 1197, ">" => 25137 }
    return chars[c]
  end

  def get_opening_character(c)
    chars = { ")" => "(", "]" => "[", "}" => "{", ">" => "<" }
    return chars[c]
  end

  def get_closing_character(c)
    chars = { "(" => ")", "[" => "]", "{" => "}", "<" => ">" }
    return chars[c]
  end

  def is_opening_character(c)
    return ["(", "[", "{", "<"].include?(c)
  end

  def is_closing_character(c)
    return [")", "]", "}", ">"].include?(c)
  end
end
