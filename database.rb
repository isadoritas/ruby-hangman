require 'yaml'
module DataBase
  
  def save_game
    begin
    puts
    Dir.mkdir('saves') unless Dir.exist?('saves')
    save_file = File.open("saves/#{name_file}.yaml", 'w')
    save_file.puts YAML.dump(self)
    save_file.close
    rescue Errno::EACCES
        display_saving_error
    rescue Errno::ENOENT
        display_error_directory
    rescue => e
        display_error_file
    end
  end
  
  def valid_name?(name)
    !name.empty?
  end

  def name_file
    loop do
        display_name_file
    name = gets.chomp.downcase.gsub(/\s+/, '_')
    if valid_name?(name)
        return name
    else
        display_invalid_name
    end
end
  end
  
def find_saved_games
  @save_files = Dir.glob('saves/*.yaml')
  @save_files
end

def choose_game_to_load
  display_game_files
  puts
  @save_files = find_saved_games
  @save_files.each_with_index do |file, index|
    filename = File.basename(file, '.yaml')
    puts "#{index + 1}. #{filename}"
  end
  choice = gets.chomp.to_i
  @file = @save_files[choice - 1] if choice.between?(1, @save_files.length)
  
end

def load_saved_file
  loaded_game_data = YAML.load_file(@file, permitted_classes: [Game])
  @word = loaded_game_data.word
  @guessed_letters = loaded_game_data.guessed_letters
  @guess_count = loaded_game_data.guess_count
  @hidden_letters = loaded_game_data.hidden_letters
  @letters_array = loaded_game_data.letters_array
end

end

