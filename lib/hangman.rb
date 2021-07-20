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
    if already_attempted(char)
      p "#{char} has already been attempted"
    end

  end
end
