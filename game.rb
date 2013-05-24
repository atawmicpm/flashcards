require_relative("flashcards.rb")

module UI

  def welcome
    puts "Welcome to THE FLASHCARD GAME!"
  end

  def user_prompt
    puts "Enter your guess: "
  end

  def show_word
    puts @card.word
  end

  def show_definition
    puts "Definition:\n#{@card.definition}"
  end

  def success_message 
    puts "Great job!"
  end

  def show_remaining_guesses
    if @tries > 1
      puts "Nope! #{@tries} more tries!"
    else
      puts "Nope! #{@tries} more try!"
    end
  end

  def reveal_answer
    puts "It was \"#{@card.word}\". You'll get it someday, buddy!\n\n"
  end

end

class Game

  include UI

  def initialize(file)
    @new_deck = Deck.new(file) 
    @tries = 3
  end

  def start
    @new_deck.create_deck
    @new_deck.shuffle
    welcome
    play
  end

  def play
    @card = @new_deck.get_card
    show_definition
    get_answer
  end

  def exit
    exit
  end

  def get_answer
    user_prompt
    @user_answer = gets.chomp 
    evaluate_answer
  end

  def track_tries
    @tries -= 1
  end

  def evaluate_answer
    if @user_answer == @card.word
      success_message
    else
      unless @tries < 1
        show_remaining_guesses
        track_tries
        get_answer
      end
    end 
    if @tries == 0 
      reveal_answer
    end
    play
  end
end






