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
        
        % process the user's inputted size
        
        switch size
            
            % convert small, medium, and large values to a pre-defined
            % number of rows and columns

            case "small"

                % placeholder values

                rows = 10;
                columns = 10;

            case "medium"

                % placeholder values

                rows = 15;
                columns = 15;

            case "large"

                % placeholder values

                rows = 20;
                columns = 20;
                
            % prompt user for their choice of rows and columns
                    
            case "custom"
            
                rows = input('Please enter the number of rows: ');
                columns = input('Please enter the number of columns: ');
                
            % else prompt again for a valid size
                
            otherwise
                
                disp('Please enter a valid board size')
                
        end

    end

end