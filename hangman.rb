require './lib/words'



puts "Welcome to Hangman"
puts "Player one, enter your secret word"
@word = Word.new(gets.chomp)
puts "*" * 88
puts "\n\n Player two, you have 7 guesses to get the secret word."
puts @word.shadow

def turn
puts "Letters you've already guessed: #{@word.letter_bank.join("  ")}"
  puts "Enter your guess"
  @word.search(gets.chomp)
  puts @word.shadow
  outcome = @word.outcome
  if outcome == "win"
    puts "You won!"
    exit
  elsif outcome == "lose"
    puts "You lost. Sorry!"
    exit
  else
    puts "you get another turn"
    turn
  end
end
turn



