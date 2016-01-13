
class Board
  attr_accessor :markers, :board
  def initialize
     @markers = Array.new(9)
     @board = [1,2,3,4,5,6,7,8,9]
  end

  def assss
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
    @board.map! { |x| x == spot ? 'X' : x }.flatten!
    # @spaces.map! {|x|
    # if (x == spot)
    #   "X"
    # else
    #   x
    # end}
    # puts "#{@spaces}"
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
        repeat
        end
  end


Board.new.assss
