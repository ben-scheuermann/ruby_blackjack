require_relative "card"
require_relative "deck"
require_relative "hand"
require'pry'


class Blackjack
  def initialize
    @setup_game
    @play_game
  end

  def setup_game
    @deck = Deck.new
    @player = Hand.new(@deck.initial_hand("Player"))
    @dealer = Hand.new(@deck.initial_hand("Dealer"))
  end

  def play_game
    is_playing = true
    while is_playing == true do
      # binding.pry
      puts "Your score is #{@player.score}"
      # puts "The dealer's score is #{@dealer.score}"
      if @player.score == 21
        puts "BLACKJACK!! YOU WIN"
        return
      elsif @player.score > 21
        puts "BUST!! YOU LOSE"
        return
      end
      puts "Do you want to hit or stay?? (h/s)"
      input = gets
      if input.chomp == "h"
        is_playing = true
        @player.cards << @deck.deal("Player")
      elsif input.chomp == "s"
        is_playing = false
      else
        puts "Please put in a valid input"
        is_playing = true
      end
      # binding.pry
      if @player.score == 21
        puts "BLACKJACK!! YOU WIN"
        return
      elsif @player.score > 21
        puts "BUST!! YOU LOSE"
        return
      end
    end
    puts "The dealer's score is #{@dealer.score}"
    while @dealer.score < 17
      @dealer.cards << @deck.deal("Dealer")
    end
    if @player.score > @dealer.score
      puts "You won!"
    elsif @dealer.score >= @player.score && @dealer.score <= 21
      puts "The dealer won!"
    else
      puts "The dealer bust!"
    end
  end
end

blackjack = Blackjack.new
blackjack.setup_game
blackjack.play_game
