function size = getSize

    % this function prompts the user for the size of the board for a game,
    % which is either a predefined or custom number of rows and columns,
    % returning their values

    % initialize a variable for the size entered by the user

    size = "";

    % loop until a valid size is entered

    while ~any(size == ["small","medium","large","custom"])

        % get the size as input from the user, converting to lowercase

        size = lower(input('Please enter the board size (small, medium, large, or custom): ', 's'));

        % inform the user if they have not entered a valid size

        if ~any(size == ["small","medium","large","custom"])

            disp('Please enter a valid board size')
            
        end

    end

end