function [rows, columns] = getSize

    % this function prompts the user for the size of the board for a game,
    % which is either a predefined or custom number of rows and columns,
    % returning their values

    % initialize a variable for the size entered by the user

    size = "";

    % loop until a valid size is entered

    while ~any(size == ["small","s","medium","m","large","l","custom","c"])

        % get the size as input from the user, converting to lowercase

        size = lower(input('Please enter the board size (small, medium, large, or custom): ', 's'));
        
        % process the user's inputted size
        
        switch size
            
            % convert small, medium, and large values to a pre-defined
            % number of rows and columns

            case {"small","s"}

                % placeholder values

                rows = 10;
                columns = 10;

            case {"medium","m"}

                % placeholder values

                rows = 15;
                columns = 15;

            case {"large","l"}

                % placeholder values

                rows = 20;
                columns = 20;
                
            % prompt user for their choice of rows and columns
                    
            case {"custom","c"}
            
                rows = input('Please enter the number of rows (5-25): ');
                
                % re-prompt if user did not enter a valid number of
                % rows (placeholder values)
                
                while rows < 5 || rows > 25
                    
                    disp('Please enter a valid number of rows')
                    rows = input('Please enter the number of rows (5-25): ');
                    
                end
                
                columns = input('Please enter the number of columns (5-25): ');
                
                % re-prompt if user did not enter a valid number of
                % columns (placeholder values)
                
                while columns < 5 || columns > 25
                    
                    disp('Please enter a valid number of columns')
                    columns = input('Please enter the number of columns (5-25): ');
                    
                end
                
            % else prompt again for a valid size
                
            otherwise
                
                disp('Please enter a valid board size')
                
        end

    end

end