function difficulty = getDifficulty
    
    % this function prompts the user to enter their chosen difficulty for a
    % game from a list of options, and returns it

    % initialize output variable

    difficulty = "";

    % loop until user enters a valid difficulty

    while ~any(lower(difficulty) == ["easy","medium","hard"])

        % prompt user for difficulty

        difficulty = input('Please enter the difficulty (easy, medium, or hard): ', 's');

        % inform user if they have not entered a valid difficulty

        if ~any(lower(difficulty) == ["easy","medium","hard"])

            disp('Please enter a valid difficulty')

        end

    end

end