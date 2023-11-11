require_relative 'database'
require_relative 'game_interface'

class Game
  VALID_LETTERS = ('a'..'z').to_a
  include Interface
  include DataBase

  attr_accessor :letter, :guess_count, :word, :guessed_letters, :hidden_letters, :letters_array

  def initialize
    @hidden_letters = []
    @guessed_letters = []
    @guess_count = 6
    play
  end

  def play
    display_game_option
    game_type = gets.chomp
    if game_type == '1'
      load_game
    elsif game_type == '2'
      new_game
    else
      display_invalid_answer
      play
    end
  end

  def new_game
    @guess_count = 6
    @guessed_letters = []
    generate_word
    create_letter_blank
    display_letter_blank
    puts
    display_save_or_exit
    guess_letter_or_save
  end

  def load_game
    find_saved_games
    choose_game_to_load
    puts
    load_saved_file
    display_letter_blank
    display_guessed_letters
    display_guesses_left
    display_save_or_exit
    guess_letter_or_save
  end

  def generate_word
    file = File.open('words.txt')
    @word = file.readlines.map(&:chomp).select { |word| word.length.between?(5, 12) }.sample
    @letters_array = @word.chars.to_a
  end

  def create_letter_blank
    @hidden_letters = @letters_array.map { |_letter| ' ___ ' }
  end

  def guess_letter_or_save
    @letter = gets.chomp.downcase
    if @letter == 'save'
      save_game
      puts
      display_continue_prompt
      answer = gets.chomp.downcase
      if answer == 'y'
        play
      else
        puts
        display_thanks
        exit
      end
    elsif @letter == 'exit'
      display_thanks
      exit
    else
      check_game
      guess_letter(letter)
    end
  end

  def guess_letter(letter)

    if !VALID_LETTERS.include?(letter)
      display_invalid_answer
      display_letter_blank
      guess_letter_or_save
    elsif @guessed_letters.include?(letter)
      display_already_guessed
      puts
      display_letter_blank
      guess_letter_or_save
    else
      @guessed_letters << letter
      display_guessed_letters
    end
    if @letters_array.include?(letter)
      update_game(letter)
      check_game
      puts
      guess_letter_or_save
    else
      @guess_count -= 1
      check_game
      display_incorrect_answer
      display_guesses_left
      puts
      display_letter_blank
      guess_letter_or_save

    end
  end

  def update_game(letter)
    puts
    letters_place = @letters_array.each_index.select { |index| @letters_array[index] == letter }
    letters_place.each do |index|
      @hidden_letters[index] = ' ' + letter
    end
    display_letter_blank
  end

  def check_game
    if !@hidden_letters.include?(' ___ ')
      display_you_won
      display_play_again
      play_again = gets.chomp
      if play_again == '1'
        play
      elsif play_again == '2'
        display_thanks
        exit
      else
        display_invalid_answer
      end
    elsif @guess_count == 0
      display_you_lost
      display_play_again
      play_again = gets.chomp
      if play_again == '1'
        play
      else
        display_thanks
        exit
      end
    end
  end
end
