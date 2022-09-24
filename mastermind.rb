require 'colorize'

class Mastermind
  def initialize
    @spaces = ['','','','']
    @colors = ['R', 'G', 'B', 'Y', 'W', 'P', 'c']
    @comp_code = @colors.sample(4)
    @winner = false
    puts "\nMASTERMIND\n\n"
  end

  def player_turn
    puts "Colors: #{" R ".on_red} #{' G '.on_green} #{" B ".on_blue} #{" Y ".on_yellow} #{" W ".on_white} #{" P ".on_magenta} #{" C ".on_cyan}"
    puts "Take a guess. Input four colors like this: RGBY\n\n"
    player_input = gets.chomp.upcase.split("")
    turn_check(player_input)
  end

  def turn_check(player_guess)
    right_color = 0
    right_place_and_color = 0
    if player_guess == @comp_code
      @winner = true
      return
    end
    player_guess.each_with_index do |color, index|
      if @comp_code.include?(color) && color == @comp_code[index]
        right_place_and_color += 1
      elsif @comp_code.include?(color)
        right_color += 1
      end
    end

    if right_color == 1
      puts "You guessed 1 color correctly, but it was in the wrong spot!"
    elsif right_color > 1
      puts "You guessed #{right_color} colors correctly, but they were in the wrong spot!"
    end

    if right_place_and_color == 1
      puts "You guessed 1 color and it's position exactly correctly!"
    elsif right_place_and_color > 1
      puts "You guessed #{right_place_and_color} colors and their positions exactly correctly!"
    end

    if right_color == 0 && right_place_and_color == 0
      puts "You didn't guess any colors or their positions correctly. Really unlucky..."
    end
  end

  def game_loop
    i = 1
    until i == 12
      unless @winner
        puts "\nTurn #{i}/12\n\n"
        player_turn
      end
      i += 1
    end
    if !@winner
      puts "You lose!".red
    else
      puts "You win!".green
    end
  end

end

mmind = Mastermind.new
mmind.game_loop