require_relative "solution.rb"

class Day02
  include Solution

  def solve_part_1
    input = (File.readlines @example ? "input/example-02.txt" : "input/input-02.txt").map do |line|
      command, value = line.split " "
      [command.to_sym, value.to_i]
    end

    h = 0
    d = 0

    input.each do |command, units|
      case command
      when :forward
        h += units
      when :down
        d += units
      when :up
        d -= units
      end
    end

    v = h * d

    puts v
  end

  def solve_part_2
    input = (File.readlines @example ? "input/example-02.txt" : "input/input-02.txt").map do |line|
      command, value = line.split " "
      [command.to_sym, value.to_i]
    end

    h = 0
    d = 0
    a = 0

    input.each do |command, units|
      case command
      when :forward
        h += units
        d += a * units
      when :down 
        a += units
      when :up 
        a -= units
      end
    end

    v = h * d
    puts v
  end
end
