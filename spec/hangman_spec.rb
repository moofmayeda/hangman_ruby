require 'rspec'
require 'words'

describe "Word" do
  describe "initialize" do
    it "initializes a word with a word string" do
      test_word = Word.new("oxen")
      test_word.should be_an_instance_of Word
    end
  end

  describe "word" do
    it "returns word" do
      test_word = Word.new("oxen")
      expect(test_word.word).to eq("oxen")
    end
  end

  describe "search" do
    it "searches word for a letter and returns the letter if found" do
      test_word = Word.new("oxen")
      expect(test_word.search("e")).to eq [2]
    end
  end

  describe "shadow" do
    it "displays *s representing each letter in the word that is not yet found" do
      test_word = Word.new("oxen")
      expect(test_word.shadow).to eq "****"
    end

    it "replaces the appropriate star with th letter" do
      test_word = Word.new("oxen")
      test_word.search("e")
      expect(test_word.shadow).to eq "**e*"
    end

    it "replaces the appropriate star with a letter when multiple letters have been found" do
      test_word = Word.new("cheese")
      test_word.search("e")
      test_word.search("c")
      expect(test_word.shadow).to eq "c*ee*e"
    end

  describe "outcome"
    it "checks to see if the user has won or lost" do
      test_word = Word.new("cheese")
      test_word.shadow
      test_word.search("e")
      test_word.shadow
      test_word.search("c")
      test_word.shadow
      test_word.search("h")
      test_word.shadow
      test_word.search("s")
      test_word.shadow
      expect(test_word.outcome).to eq "win"
    end

    it "checks to see if 7 turns were taken" do
      test_word = Word.new("cheese")
      test_word.shadow
      7.times do test_word.search("p")
      test_word.shadow
      end
      expect(test_word.outcome).to eq "lose"
    end

    it "checks to see if the game should continue" do
      test_word = Word.new("cheese")
      test_word.shadow
      test_word.search("e")
      test_word.shadow
      test_word.search("c")
      test_word.shadow
      expect(test_word.outcome).to eq "continue"
    end
  end

  describe "letter_bank" do
    it "lists failed guesses" do
      test_word = Word.new("cheese")
      test_word.shadow
      test_word.search("d")
      test_word.shadow
      test_word.search("k")
      test_word.shadow
      expect(test_word.letter_bank).to eq ["d","k"]
    end
  end
end
