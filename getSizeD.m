function size = getSize

    % this function prompts the user for the size of the board for a game and
    % returns it as a variable

    % initialize the size variable

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