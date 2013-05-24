require_relative("flashcards.rb")

class Game

  def initialize(file)
    @new_deck = Deck.new(file) 
    @tries = 4
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

  def welcome
    puts "Welcome to the FLASHCARD GAME"
  end

  def exit
    exit
  end

  def user_prompt
    puts "Enter your guess: "
  end

  def show_word
    puts @card.word
  end

  def show_definition
    puts @card.definition 
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
      unless @tries < 2
        failure_message
        track_tries
        puts "YOU HAVE THREE GUESSES. Remaining tries: #{@tries}."
        get_answer
      end
    end 
    if @tries == 1 
      puts "It was #{@card.word}. You'll get it someday, buddy!\n"
    end
    play
  end

  def success_message 
    puts "Great job!"
  end

  def failure_message
    puts "Bummer. Try again?"
  end

end




