






class Board
  attr_accessor :warrior, :board, :spartan
  def initialize
     @board = [1,2,3,4,5,6,7,8,9]
     @warrior = Array.new
     @spatan = Array.new
  end

  def start
    output = ""
      1.upto(9) do |position|
        output << " #{position} "
        case position
        when 1, 2, 4, 5, 7, 8
          output << "|"
        when 3, 6
          output << "\n-----------\n"
      end
    end
    puts output
    repeat
  end

  def repeat
    puts "choose a spot"
    spot = gets.chomp.to_i
    if @warrior[spot] == nil
      @warrior[spot] = spot
      @board.map! { |x| x == spot ? 'X' : x }.flatten!
        output = ""
          0.upto(8) do |position|
            output << " #{board[position]} "
            case position
            when 0, 1, 3, 4, 6, 7
              output << "|"
            when 2, 5
              output << "\n-----------\n"
            end
        end
        puts output
        # print @board
        check
        repeat
      else
        puts "ERROR"
        repeat
      end
  end

    def check
      if @board == ["X", "X", "X", 4, 5, 6, 7, 8, 9]
        puts "gameover!"
      end
    end
  end


Board.new.start
