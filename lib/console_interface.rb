class ConsoleInterface
  FIGURES =
      Dir[__dir__ + '/../data/figures/*.txt'].
      sort.
      map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def print_out
    # puts <<~END
    #   Слово: #{word_to_show}
    #   #{figure}
    #   Ошибки (#{@game.errors_made}): #{errors_to_show}
    #   У вас осталось ошибок: #{@game.errors_allowed}

    # END

    puts "Слово: ".light_cyan + word_to_show
    puts figure.yellow
    puts "Ошибки (#{@game.errors_made}): ".light_red + errors_to_show.red.bold
    puts "У вас осталось ошибок: ".light_green + @game.errors_allowed.to_s.green.bold


    if @game.won?
      puts "Поздравляем, вы выиграли!".green.on_black.blink
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово: #{@game.word}".red.on_black.blink
    end
  end

  def figure
    FIGURES[@game.errors_made]
  end

  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
        if letter == nil
          "__".light_cyan
        else
          letter.cyan.underline
        end
      end

    result.join(' ')
  end

  def errors_to_show
    @game.errors.join(', ')
  end

  def get_input
    print "Введите следующую букву: "
    letter = gets[0].upcase
  end
end
