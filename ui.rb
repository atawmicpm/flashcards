module UI
  def welcome
    puts <<-WELCOME
Welcome to THE FLASHCARD GAME!
We're going to TEST YOUR KNOWLEDGE!!!
(Hint: like a computer progam, case matters!)

    WELCOME
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
