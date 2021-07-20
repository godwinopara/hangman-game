class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  random_word = DICTIONARY.sample

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_char = []
    @remaining_incorrect_guesses = 5
  end
end
