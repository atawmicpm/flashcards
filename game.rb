require_relative("flashcards.rb")
require_relative("ui.rb")



class Game

  include UI

  def initialize(file)
    @new_deck = Deck.new(file) 
  end

  def start
    @new_deck.create_deck
    @new_deck.shuffle
    welcome
    play
  end

  def play
    @tries = 3
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




