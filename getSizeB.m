function size = getSize
    
    % this function prompts the user for the size of the board for a game and
    % returns it as a variable

    % get the size as input from the user, converting to lowercase

    size = lower(input('Please enter the board size (small, medium, or large): ', 's'));

    % inform the user if they have not entered a valid size

    if ~any(size == ["small","medium","large"])

        disp('Please enter a valid board size')

    end

end