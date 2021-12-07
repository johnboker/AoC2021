require "benchmark"

module Solution
  @example

  def initialize(example)
    @example = example
  end

  def solve_part_1
    raise "Not implemented"
  end

  def solve_part_2
    raise "Not implemented"
  end

  def solve
    puts "*** #{self.class.name} ***"
    puts "\nPart 1\n\n"

    time1 = Benchmark.measure {
      self.solve_part_1
    }
    puts "Time: #{time1}"
    puts "\nPart 2\n\n"

    time2 = Benchmark.measure {
      self.solve_part_2
    }

    puts "Time: #{time2}"
    puts "\n"
  end

  def get_input(filename)
    lines = File.readlines(filename, chomp: true, mode: "r:bom|utf-8")
    return lines
  end
end
