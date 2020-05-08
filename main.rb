require 'colorize'
require_relative 'lib/console_interface'
require_relative 'lib/game'

# Main module
module App
  def self.run
    puts 'Hello!'.green

    # Load random word from file
    word = File.readlines(__dir__ + '/data/words.txt', encoding: 'UTF-8', chomp: true).sample
    game = Game.new(word)
    console_interface = ConsoleInterface.new(game)

    # While the game continues
    until game.over?
      # Display the next state of the game
      console_interface.print_out
      # Ask the next letter
      letter = console_interface.user_input
      # Update game state
      game.play!(letter)
    end

    # Display the final state of the game
    console_interface.print_out
  end
end

App.run
