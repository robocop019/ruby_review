# 1. Write out the Card and Deck classes to make the program work. The Deck class should hold a list of Card instances.
# 2. Change the program to use multiple choice questions. The Card class should be responsible for checking the answer.
# 3. CHALLENGE: Change the program to allow the user to retry once if they get the wrong answer.
# 4. CHALLENGE: Change the program to keep track of number right/wrong and give a score at the end.
# 5. CHALLENGE: Change the program to give the user the choice at the end of the game to retry the cards they got wrong.
# 6. CHALLENGE: Change the interface with better prompts, ASCII art, etc. Be as creative as you'd like!

class Card
  attr_reader :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def question
    return @question
  end

  def answer
    return @answer
  end
end

class Deck
  attr_reader :remaining_cards

  def initialize(input)
    @remaining_cards = 0
    @deck = []
    input.each do |question, answer|
      @card = Card.new(question, answer)
      @deck << @card
      @remaining_cards += 1
    end
  end

  def draw_card
    @remaining_cards -= 1
    @drawn_card = @deck.sample
    @deck.delete(@drawn_card)
    @drawn_card
  end

  def remaining_cards
    @remaining_cards
  end
end

trivia_data = {
                "What is the capital of Illinois?" => "Springfield",
                "Is Africa a country or a continent?" => "Continent",
                "Tug of war was once an Olympic event. True or false?" => "True",
                "How many people were killed in the 1996 film Scream? (Hint: It’s less than 10.)" =>"7",
                "What year was Forrest Gump released?" => "1994",
                "What is Godzilla's name in Japanese?" => "Gojira",
                "What is the device that kills Godzilla in 'Gojira'? The.." => "Oxygen Destroyer",
                "Who is Godzilla's arch enemy?" => "King Ghidorah",
                "Which creatures pull the carriages that take students from the Hogwarts Express to the Castle? \n \n A. Hippogriffs B. Thestrals C. Centuars D. Manticores \n\n" => "B",
                "What position does Harry play on his Quidditch team?" => "Seeker",
                "What was the name of the card game that Geralt could play in 'The Witcher 3'?" => "Gwent",
                "Who is the raven-haired Sorceress whose fate is linked with Geralt of Rivia? (Full name)" => "Yennefer",
                "In Pokemon Red & Blue, what is the name of HM05?" => "Flash",
                "In the 'Halo' series, what is the name of the race of aliens humans refer to as 'Grunts'?" => "Unggoy",
                "Which video game was recalled for containing a hidden, playable South Park episode?" => "Tiger Woods 99 PGA Tour",
                "According to the 2000 census, in the UK, what is now considered a religion?" => "Jedi Knight",
                "The name 'Chicago' comes from a native Indian word that means what?" => "Place that smells bad",
                "What is the no 1 topping for pizzas in Australia?" => "Eggs",
                "What is a group of unicorns known as? A.." => "Blessing",
                "Reno is farther west than Los Angeles. True or False?" => "True"
              }

deck = Deck.new(trivia_data) # deck is an instance of the Deck class
puts "Welcome to Random Trivia! Type 'exit' to end.\n\n"
correct = 0
incorrect = 0
while deck.remaining_cards > 0
  card = deck.draw_card # card is an instance of the Card class
  print "#{card.question}  "

  user_answer = gets.chomp
  if user_answer.downcase == "exit"
    puts "\nThanks for playing!\n\n"
    # puts "You got #{correct} answers right and #{incorrect} answers wrong.\n\n"
    break
  elsif user_answer.downcase == card.answer.downcase
    puts ""
    puts "Correct!"
    puts ""
    correct += 1
  else
    puts ""
    puts "Incorrect! The correct answer was #{card.answer.capitalize}."
    puts ""
    incorrect += 1
  end
end

puts "You got #{correct} answers right and #{incorrect} answers wrong.\n\n"