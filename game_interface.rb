module Interface
    def display_game_option
        puts <<~INTERFACE
        Welcome to Hangman!
        -------------------
        Choose a game option:
        \e[34m[1]\e[0m Load a game
        \e[34m[2]\e[0m Start a new game

        INTERFACE
    end

    def display_name_file
        puts <<~INTERFACE
        How would you like to name this file? \e[31m(no spaces)\e[0m
        INTERFACE
        end
    
    def display_invalid_name
        puts <<~INTERFACE
        \e[34mInvalid name. Please try again\e[0m
        INTERFACE
        end
    
    def display_game_files
        puts <<~INTERFACE
        Choose a game to load:
        INTERFACE
          end

    def display_saving_error
        puts <<~INTERFACE
        \e[34mPermission denied when trying to save the game. Please check your file permissions.\e[0m
        INTERFACE
        end

    def display_error_directory
        puts <<~INTERFACE
        \e[34mThe specified directory does not exist. Please check the directory path.\e[0m
        INTERFACE
        end


    def display_error_file
        puts <<~INTERFACE
        \e[34mAn error occurred while saving the game: #{e.message}\e[0m
        INTERFACE
        end

    def display_invalid_answer
        puts <<~INTERFACE
        \e[31mInvalid option. Please try again\e[0m
        INTERFACE
    end

    def display_word_lenght
        puts <<~INTERFACE
        The secret word is \e[34m#{@word.length}\e[0m letters long
        INTERFACE
    end

    def display_letter_blank
        puts <<~INTERFACE
        \e[34m#{@hidden_letters.join}\e[0m
        INTERFACE
        end

    def display_guessed_letters
        puts
        puts <<~INTERFACE
        Guessed: \e[31m#{@guessed_letters.join(' - ')}\e[0m
        INTERFACE
        end

    def display_guesses_left
        puts <<~INTERFACE
        You have \e[31m#{@guess_count}\e[0m guesses left
        INTERFACE
        end
    
    def display_save_or_exit
        puts <<~INTERFACE
        Guess a letter! You can also type \e[31m'save'\e[0m or \e[31m'exit'\e[0m to leave the game.
        INTERFACE
        end

    def display_continue_prompt
        puts <<~INTERFACE
        Do you want to continue playing? \e[31m(y/n)\e[0m
        INTERFACE
        end

    def display_thanks
        puts <<~INTERFACE
        \e[34mThanks for playing!\e[0m
        INTERFACE
        end
    
    def display_play_again
        puts <<~INTERFACE
        Would you like to play again?
        \e[34m[1]\e[0m Yes
        \e[34m[2]\e[0m No
        INTERFACE
        end

    def display_you_won
        puts <<~INTERFACE
        \e[32mCongratulations!\e[0m The secret word is \e[32m#{@word.upcase}\e[0m.
        INTERFACE
    end

    def display_you_lost
        puts <<~INTERFACE
        \e[34mYou failed!\e[0m The secret word was \e[34m#{@word.upcase}\e[0m.
        INTERFACE
        end

    def display_incorrect_answer
        puts <<~INTERFACE
        \e[34mIncorrect\e[0m. There is no letter \e[34m#{letter}\e[0m in this word
        INTERFACE
        end

        def display_already_guessed
            puts <<~INTERFACE
            \e[34mYou already guessed the letter #{letter}\e[0m
                INTERFACE
            end


end