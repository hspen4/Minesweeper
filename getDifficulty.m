function difficulty = getDifficulty
    
    % this function prompts the user to enter their chosen difficulty for a
    % game from a list of options, and returns it

    % initialize output variable

    difficulty = "";

    % loop until user enters a valid difficulty

    while ~any(difficulty == ["easy","medium","hard","e","m","h"])

        % prompt user for difficulty, converting to lower case for easier
        % parsing

        difficulty = lower(input('Please enter the difficulty (easy, medium, or hard): ', 's'));

        % inform user if they have not entered a valid difficulty

        if ~any(difficulty == ["easy","medium","hard","e","m","h"])

            disp('Please enter a valid difficulty')
            
        end

    end
    
    % convert single letters to difficulties
    
    if difficulty == "e"
        difficulty = 'easy';
    elseif difficulty == "m"
        difficulty = 'medium';
    elseif difficulty == "h"
        difficulty = 'hard';
    end

end