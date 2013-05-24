require 'csv'

class Deck
  def initialize(filename)
    @file = filename
    @deck = []
    @card = -1
  end

  def create_deck
    deck = CSV.open(@file, col_sep:"\n", row_sep:"\n\n", quote_char:"~")
    deck.each {|card| @deck << Card.new(card)}
  end

  def shuffle
    @deck = @deck.shuffle!
  end

  def get_card
    @card += 1
    @deck[@card]
  end

end

class Card
  attr_reader :question, :answer

  def initialize(card)
    @question = card[0]
    @answer = card[1]
  end
end

flashcards = Deck.new("flashcard_samples.txt")
flashcards.create_deck
flashcards.shuffle
current_card = flashcards.get_card
p current_card.question
puts
p current_card.answer


