require 'colorize'

class MastermindHumanPlayer
  def initialize
    @colors = ['R', 'G', 'B', 'Y', 'W', 'P', 'C']
    @comp_code = new_code
    @winner = false
    puts "\nMASTERMIND\n\n"
  end

  def new_code
    @comp_code = @colors.sample(4)
  end

  def player_turn
    puts "Colors: #{" R ".black.on_red} #{" G ".black.on_green} #{" B ".black.on_blue} #{" Y ".black.on_yellow} #{" W ".black.on_white} #{" P ".black.on_magenta} #{" C ".black.on_cyan}"
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
      puts "\n\nYou guessed 1 color correctly, but it was in the wrong spot!"
    elsif right_color > 1
      puts "\n\nYou guessed #{right_color} colors correctly, but they were in the wrong spot!"
    end

    if right_place_and_color == 1
      puts "You guessed 1 color and it's position exactly correctly!"
    elsif right_place_and_color > 1
      puts "You guessed #{right_place_and_color} colors and their positions exactly correctly!"
    end

    if right_color == 0 && right_place_and_color == 0
      puts "\n\nYou didn't guess any colors or their positions correctly. Really unlucky..."
    end
  end

  def game_loop
    i = 1
    until i == 13
      unless @winner
        puts "\nTurn #{i}/12\n\n"
        player_turn
      end
      i += 1
    end
    if !@winner
      puts "\n\nYou lose!\nBetter luck next time!".red
      puts "Do you want to play again? [y/n]"
      yes_no = gets.chomp
      new_game(yes_no)
    else
      puts "\n\nYou win!\nCongrats! You cracked the code!".green
      puts "Do you want to play again? [y/n]"
      yes_no = gets.chomp
      new_game(yes_no)
    end
  end

  def new_game(input)
    input.downcase
    if input == 'y'
      @winner = false
      new_code
      game_loop
    else
      return
    end
  end

end

class MastermindCompPlayer < MastermindHumanPlayer
  def initialize
    puts "MASTERMIND\n\n"
    puts "Make a code and the computer will try to guess it in 12 turns. If it doesn't, you win!"
    puts "Colors: #{" R ".black.on_red} #{" G ".black.on_green} #{" B ".black.on_blue} #{" Y ".black.on_yellow} #{" W ".black.on_white} #{" P ".black.on_magenta} #{" C ".black.on_cyan}"
    puts "Enter a 4 letter code of the letters above like this: RGBY"
    @player_code = gets.chomp.upcase.split('')
    @winner = false
    @colors = ['R', 'G', 'B', 'Y', 'W', 'P', 'C']
  end

  def comp_guess
    @colors.sample(4)
  end

  def game_loop
    i = 1
    while i <= 12
      unless @winner
        puts "Turn #{i}/12"
        turn_check(comp_guess)
      end
      i+=1
    end
  end

end