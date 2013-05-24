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
    @deck.shuffle!
  end

  def get_card
    @card += 1
    @deck[@card]
  end

end

class Card
  attr_reader :definition, :word

  def initialize(card)
    @definition = card[0]
    @word = card[1]
  end
end

flashcards = Deck.new("flashcard_samples.txt")
flashcards.create_deck
flashcards.shuffle
current_card = flashcards.get_card
puts current_card.question
puts
puts current_card.answer


