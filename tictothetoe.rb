#*****PLAYER CLASS CREATES PLAYER *********
class Player
  attr_accessor :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
#*******************************************

#*****BOARD CLASS CREATES BOARD AND LOGIC*******
class Board
  attr_accessor :warrior, :board, :end
  def initialize
     @board = [1,2,3,4,5,6,7,8,9]
     @warrior = Array.new(9)
     @end = false
  end

#*******CREATES FIRST BOARD**********************
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
    puts "\n"
    puts output
  end
#*******************************************

#********METHOD CHECK IF A SPOT IS TAKEN*********
  def taken(playa)
      if @warrior[@spot-1] == nil
        @warrior[@spot-1] = @spot
      else
        puts "Spot's Taken! LOSE YOUR TURN" #IF YOU CHOSE A SPOT THAT'S ALREADY TAKEN YOU LOSE YOUR TURN!
        return
        repeat(playa)
      end
  end
#*******************************************

#***************CHOSE SPOT AND CREATES BOARD AFTER CHOSING A SPOT*************
  def repeat(playa)
        puts "\n"
        puts "choose a spot #{playa.name}"
        @spot = gets.chomp.to_i
        taken(playa)
              @board.map! { |x| x == @spot ? "#{playa.symbol}" : x }.flatten!
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
                puts "\n"
                puts output
                win_logic
    end
#**************************************************************


#*********CHOSE SPOT FOR COMPUTER AND CREATES BOARD*************
    def crepeat(playa)
          @spot = rand(1..9)
          taken(playa)
                puts "#{playa.name} chose #{@spot}"
                @board.map! { |x| x == @spot ? "#{playa.symbol}" : x }.flatten!
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
                  puts "\n"
                  puts output
                  win_logic
      end
#*******************************************************

#*************OUTCOME TO WIN***************************
  def win_logic
      case @board.values_at(0,1,2)
      when ["X", "X", "X"] , ["O", "O", "O"]
        @end = true
      end
        case @board.values_at(3,4,5)
        when ["X", "X", "X"] , ["O", "O", "O"]
            @end = true
        end
          case @board.values_at(6,7,8)
          when ["X", "X", "X"] , ["O", "O", "O"]
              @end = true
          end
            case @board.values_at(0,4,8)
            when ["X", "X", "X"] , ["O", "O", "O"]
                @end = true
            end
            case @board.values_at(2,4,6)
            when ["X", "X", "X"] , ["O", "O", "O"]
                @end = true
            end
              case @board.values_at(0,3,6)
              when ["X", "X", "X"] , ["O", "O", "O"]
                  @end = true
              end
                case @board.values_at(1,4,7)
                when ["X", "X", "X"] , ["O", "O", "O"]
                    @end = true
                end
                  case @board.values_at(2,5,8)
                  when ["X", "X", "X"] , ["O", "O", "O"]
                      @end = true
                  end
    end
#*****************************************************

#************GAMEOVER MESSAGE AND START OVER***********
    def gameover(winner)
          if @end == true
        puts "\n\n"
        puts "GAMEOVER! #{winner.name} has won!"
        puts "Would you like to play again? (Y)es or (N)o?"
        ace = gets.chomp.downcase
              case ace
              when "y", "yes"
                welcome
              end
          end
    end
#*****************************************************
end #END OF CLASS
#*****************************************************

#***PAUSE METHOD***
def sleepy
  sleep(2)
end
#******************

#******WELCOME METHOD********
def welcome
  puts <<-B


  Welcome to Tic-To-The-Toe 5000 Version Beta 1

  .##.....##..#######..##.....##..#######.
  ..##...##..##.....##..##...##..##.....##
  ...##.##...##.....##...##.##...##.....##
  ....###....##.....##....###....##.....##
  ...##.##...##.....##...##.##...##.....##
  ..##...##..##.....##..##...##..##.....##
  .##.....##..#######..##.....##..#######.


  B
  spartan
end
#*************************************

#********GET PLAYERS NAME****************
def spartan
    puts "What is your name?"
    pname = gets.chomp.capitalize
    player1 = Player.new(pname, "X")
    kangaroo(player1)
end
#****************************************

#*********GAME LOGIC*********************
def kangaroo(player1)
    puts "\n"
    puts "Will you be playing against a (H)uman or (C)omputer?"
    option = gets.chomp.downcase
        case option
        when "h", "human"
              players = Array.new
              puts "\n"
              puts "What is the name of the 2nd Player?"
              sname = gets.chomp.capitalize
              player2 = Player.new(sname, "O")
              players.push(player1)
              players.push(player2)
              game = Board.new
              game.start
              while(!game.end)
                  players.each do |playa|
                    game.repeat(playa)
                    game.gameover(playa)
                      break if game.end
                      end
                  end
        when "c", "computer"
              puts "\n"
              puts "Generating who goes first.."
              sleepy
              turn = rand(1..2)
                  if turn == 1
                    puts "Computer goes first!"
                  else
                    puts "#{player1.name} goes first!"
                  end
              cname = "Computer"
              computer = Player.new(cname, "O")
              game = Board.new
              game.start
              while(!game.end)
                  if turn == 1
                    game.crepeat(computer)
                    game.gameover(computer)
                    sleepy
                    game.repeat(player1)
                    game.gameover(player1)
                  else turn == 2
                    game.repeat(player1)
                    game.gameover(player1)
                    sleepy
                    game.crepeat(computer)
                    game.gameover(computer)
                  end
                      break if game.end
                      end
          else
            error
            kangaroo(player1)
        end
end
#****************************************

def error
puts "Not an option! Choose again."
end



welcome
