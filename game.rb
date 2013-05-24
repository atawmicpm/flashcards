class Game

  def initialize(file)
    @new_deck = Deck.new(file) 
  end

  def start
    @new_deck.create_deck
    @new_deck.shuffle
    welcome
  end

  def welcome
    "Welcome to the FLASHCARD GAME"
  end

  def exit
    exit
  end

  def user_prompt
    "Enter your guess: "
  end

  def show_word
    @card.definition 
  end

  def show_definition
    @card.word
  end

  def get_answer
    @user_answer = gets.chomp 
  end

  def track_fail
    @fails += 1
  end

  def evaluate_answer
    if @user_answer == @card.answer
      @fails = 0
      success_message
    elsif @fails < 3 
      failure_message
      track_fail
    else 
      "You'll get that someday, buddy!"
      show_word
    end

  end

  def success_message 
    "Great job!"
  end

  def failure_message
    "Bummer. Try again?"
  end

end


Game.new("text.txt")


