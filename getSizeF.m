function [rows, columns] = getSize

    % this function prompts the user for the size of the board for a game,
    % which is either a predefined or custom number of rows and columns,
    % returning their values

    % initialize a variable for the size entered by the user

    size = "";

    % loop until a valid size is entered

    while ~any(size == ["small","medium","large","custom"])

        % get the size as input from the user, converting to lowercase

        size = lower(input('Please enter the board size (small, medium, large, or custom): ', 's'));

        % inform the user if they have not entered a valid size, otherwise
        % allocate rows and columns values to inputted size

        if ~any(size == ["small","medium","large","custom"])

            disp('Please enter a valid board size')
            
        % convert small, medium, and large values to a pre-defined
        % number of rows and columns
            
        elseif size == "small"
                
                % placeholder values
                
                rows = 10;
                columns = 10;
                
        elseif size == "medium"
            
                % placeholder values
                
                rows = 15;
                columns = 15;
                
        elseif size == "large"
            
                % placeholder values
                
                rows = 20;
                columns = 20;
                
        else
            
            % otherwise user chose custom, so ask for rows and columns
            
            rows = input('Please enter the number of rows: ');
            columns = input('Please enter the number of columns: ');
            
        end

    end

end