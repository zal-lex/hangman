# The basic logic of the game
class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  def errors
    @user_guesses - @letters - normalized_letters
  end

  def errors_made
    (normalized_user_guesses - normalized_letters).length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    @letters.map do |letter|
      if @user_guesses.include?(normalize_letter(letter)) ||
         @user_guesses.include?(letter)
        letter
      end
    end
  end

  def lost?
    errors_allowed.zero?
  end

  def normalize_letter(letter)
    case letter
    when 'Ё' then 'Е'
    when 'Й' then 'И'
    else letter
    end
  end

  def normalized_letters
    @letters.map { |letter| normalize_letter(letter) }
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    return unless !over? && !@user_guesses.include?(letter)

    @user_guesses << letter
  end

  def normalized_user_guesses
    @user_guesses.map { |letter| normalize_letter(letter) }.uniq
  end

  def won?
    (normalized_letters - @user_guesses).empty?
  end

  def word
    @letters.join
  end
end
