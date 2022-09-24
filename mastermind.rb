class Mastermind
  def initialize
    @spaces = ['','','','']
    @colors = ['R', 'G', 'B', 'Y', 'W', 'O', 'P', 'T']
    @COMP_CODE = @colors.sample(4)
  end

  def player_turn
    puts "Colors: #{@colors}"
    puts "Take a guess. Input four colors like this: RGBY"
    player_input = gets.chomp.upcase.split("")
    turn_check(player_input)
  end

  def turn_check(player_guess)
    right_color = 0
    right_place_and_color = 0
    player_guess.each_with_index do |color, index|
      if @COMP_CODE.include?(color) && color == @COMP_CODE[index]
        right_place_and_color += 1
      elsif @COMP_CODE.include?(color)
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



end

mmind = Mastermind.new
mmind.player_turn