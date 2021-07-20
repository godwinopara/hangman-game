class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end
  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |ele, idx| indices << idx if char == ele}
    indices
  end

  def fill_indices(char, indices_arr)
  indices_arr.each { |idx| @guess_word[idx] = char}
  end


  def try_guess(char)
    get_indices = get_matching_indices(char)
    is_attempted = already_attempted?(char)
    fill_indices(char, get_indices)

    if get_indices.empty?
      @remaining_incorrect_guesses -= 1

    end
    if is_attempted
      p "#{char} has already been attempted"
      return false
    elsif !is_attempted
      @attempted_chars << char
      return true
    end

  end

  def ask_user_for_guess
    p "Enter a char: "
    user_input = gets.chomp
    user_guess = try_guess(user_input)
    return user_guess
  end

  def win?
    if @guess_word == @secret_word
      p "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end
    false
  end 
end
