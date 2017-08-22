require 'byebug'
require_relative "./player.rb"
class Game
  attr_reader :players, :fragment

  def initialize(dictionary, fragment, size = 3, *players)
    @dictionary = File.readlines(dictionary).map(&:chomp)
    @fragment = fragment
    @size = size
    @players = players
    @losses = Hash.new(0)

  end

  def current_player
    players.first
  end

  def previous_player
    players.last
  end

  def next_player!
    players.rotate!
  end

  def play

  end

  def record
    hash = Hash.new("")
    ghost = "GHOST"
    @losses.each do |key, value|
      next if value == 0
      hash[key] = ghost[0..(value - 1)]
    end
    hash
  end

  def take_turn(player)
    char = player.guess
    temp = fragment + char
    if valid_play?(temp)
      @fragment = temp
    else
      @losses[player] += 1
      puts "You're score is: #{record[player]}"
    end
  end

  def valid_play?(string)
    if @dictionary.index(string)
      puts "You spelled a word, you lose! A new fragment will be created"
      get_fragment(size)
      return false
    else
      result = @dictionary.select { |word| word.start_with?(string) }
      if result.empty?
        puts "No words can be created with this string."
        return false
      end
    end
    true
  end

  def run
    until game_over
      play_round
    end
  end

  def play_round
    take_turn(current_player)
    next_player!
  end

  def game_over
    @losses.each do |_key, val|
      if val == 5
        puts "GAME OVA!"
        return true
      end
    end
    false
  end

  def get_fragment(size)
    result = @dictionary.select do |val|
      val.length == size + 1
    end

    @fragment = result.sample[0..size - 1]
    puts "The new fragement is #{@fragment}!"
  end
end
