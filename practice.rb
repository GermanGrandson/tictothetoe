


def gameover
puts "GAMEOVER! Would you like to play again? (Y)es or (N)o?"
# choice = gets.chomp
# case choice
# when
end



class Board
  attr_accessor :warrior, :board, :spartan
  def initialize
     @board = [1,2,3,4,5,6,7,8,9]
     @warrior = Array.new(9)
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
    # print @warrior
    if @warrior[spot-1] == nil
      @warrior[spot-1] = spot
      @board.map! { |x| x == spot ? 'O' : x }.flatten!
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
        win_logic
        print @warrior
        print @board
        repeat
      else
        puts "ERROR"
        repeat
      end
  end

    def win_logic
      case @board.values_at(0,1,2)
      when ["X", "X", "X"] , ["O", "O", "O"]
        puts "gameover!"
      end
        case @board.values_at(3,4,5)
        when ["X", "X", "X"] , ["O", "O", "O"]
          puts "gameover!"
        end
          case @board.values_at(6,7,8)
          when ["X", "X", "X"] , ["O", "O", "O"]
            puts "gameover!"
          end
            case @board.values_at(0,4,8)
            when ["X", "X", "X"] , ["O", "O", "O"]
              puts "gameover!"
            end
            case @board.values_at(2,4,6)
            when ["X", "X", "X"] , ["O", "O", "O"]
              puts "gameover!"
            end
              case @board.values_at(0,3,6)
              when ["X", "X", "X"] , ["O", "O", "O"]
                puts "gameover!"
              end
                case @board.values_at(1,4,7)
                when ["X", "X", "X"] , ["O", "O", "O"]
                  puts "gameover!"
                end
                  case @board.values_at(2,5,8)
                  when ["X", "X", "X"] , ["O", "O", "O"]
                    puts "gameover!"
                  end

  end

end


Board.new.start
