class Word
  def initialize(word)
    @word = word.split("")
    @found_letters = []
    @guesses = 0
    @letter_bank = []
  end

  def word
    @word.join
  end

  def search(letter)
    if !@word.join.include? letter
     @guesses += 1
    end
    @letter_bank << letter
    @found_letters.concat(@word.each_index.select {|index| @word[index] == letter })
  end

  def shadow
    @result = "*" * @word.length
    @found_letters.each {|index| @result[index] = @word[index]}
    @result
  end

  def outcome
    if @guesses == 7
      "lose"
    elsif @result == @word.join('')
      "win"
    else
      "continue"
    end
  end

  def letter_bank
    @letter_bank
  end
end
