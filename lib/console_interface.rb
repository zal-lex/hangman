# Preparing and processing data output to the console
class ConsoleInterface
  FIGURES =
    Dir[__dir__ + '/../data/figures/*.txt']
    .sort.map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def print_out
    puts 'Word: '.light_cyan + word_to_show
    puts figure.yellow
    puts "Errors (#{@game.errors_made}): ".light_red + errors_to_show.red.bold
    puts 'The number of remaining attempts: '.light_green + @game.errors_allowed.to_s.green.bold

    if @game.won?
      puts 'Win!'.green.on_black.blink
    elsif @game.lost?
      puts "You lose, hidden word: #{@game.word}".red.on_black.blink
    end
  end

  def figure
    FIGURES[@game.errors_made]
  end

  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
        if letter.nil?
          '__'.light_cyan
        else
          letter.cyan.underline
        end
      end

    result.join(' ')
  end

  def errors_to_show
    @game.errors.join(', ')
  end

  def user_input
    print 'Enter the next letter: '
    gets[0].upcase
  end
end
