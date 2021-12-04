require_relative "solution.rb"

class Day04
  include Solution

  def solve_part_1
    input = get_input(@example ? "input/example-04.txt" : "input/input-04.txt")
    boards = create_boards(input)
    calls = input[0].split(",").map { |n| n.to_i }

    win = false
    last_call = -1
    winning_board = nil
    for c in calls
      last_call = c
      for b in boards
        b.number_called(c)
        winning_board = b
        win = b.is_win()
        if win then break end
      end
      if win then break end
    end

    puts winning_board.sum_uncalled() * last_call
  end

  def solve_part_2
    input = get_input(@example ? "input/example-04.txt" : "input/input-04.txt")
    boards = create_boards(input)
    calls = input[0].split(",").map { |n| n.to_i }

    win = false
    last_call = -1
    winning_board = nil

    for c in calls
      last_call = c
      for b in boards
        if !b.win
          b.number_called(c)
          b.is_win()
          winning_board = b
        end
        win = boards.all? { |a| a.win }
        if win then break end
      end
      if win then break end
    end
    puts winning_board.sum_uncalled() * last_call
  end

  def create_boards(lines)
    boards = Array.new { Board }
    for i in (2...(lines.length - 4)).step(6)
      boards.push(Board.new(i, lines))
    end
    return boards
  end

  class Board
    @board
    attr_reader :win

    def initialize(start, lines)
      @win = false
      @board = Array.new { Array.new }
      for i in start...(start + 5)
        @board.push(lines[i].split().map { |n| { :number => n.to_i, :called => false } })
      end
    end

    def print_board()
      for i in 0...5
        for j in 0...5
          print @board[i][j][:number], @board[i][j][:called] ? "* " : " "
        end
        puts ""
      end
    end

    def number_called(n)
      for i in 0...5
        for j in 0...5
          if @board[i][j][:number] == n
            @board[i][j][:called] = true
          end
        end
      end
    end

    def is_win()
      for i in 0...5
        row = get_row(i)
        col = get_col(i)
        @win = col.all? { |n| n[:called] } || row.all? { |n| n[:called] }
        if @win then break end
      end
      return @win
    end

    def get_row(i)
      return @board[i]
    end

    def get_col(i)
      col = Array.new { { :number => 0, :called => false } }
      for r in 0...5
        col.push(@board[r][i])
      end
      return col
    end

    def sum_uncalled()
      n = 0
      for i in 0...5
        for j in 0...5
          if !@board[i][j][:called]
            n = n + @board[i][j][:number]
          end
        end
      end
      return n
    end
  end
end
