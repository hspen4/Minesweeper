function [row, column, type] = getMove(board,revealed)
    % function that gets a tile on a minesweeper board from the user and
    % returns it as its row and column number, either flagging it or
    % revealing it
    
    % ask to flag or reveal
    
    type = input('Would you like to flag or reveal a tile? ','s');
    
    % return the type that the user chose, case-insensitive
    
    if any(lower(type) == ["f","flag","m","mark"])
        type = 'flag';
    elseif any(lower(type) == ["reveal","r","show","s","flip"])
        type = 'reveal';
    else
        % otherwise, re-prompt by calling function again
        disp('Please enter a valid move')
        [row, column, type] = getMove(board);
        return;
    end
    
    % find max row and column for given board
    
    maxRowLetter = char(size(board,1)) + 94;
    maxColLetter = char(size(board,2)) + 94;
    
    % loop until a valid unrevealed tile is entered
    
    unrevealedTile = 0;
    
    while ~unrevealedTile
    
        % get row, converting to lowercase

        rowLetter = lower(input('Enter the row of the tile (c to cancel): ','s'));

        % if cancelled, re-prompt

        if any(lower(rowLetter) == ["c","cancel"])
            [row, column, type] = getMove(board);
            return;
        end

        % validate row with while loop

        while length(rowLetter) ~= 1 || rowLetter > maxRowLetter || rowLetter < 'a'
            fprintf('Please enter a valid row (a-%s)\n',maxRowLetter)
            rowLetter = lower(input('Enter the row of the tile (c to cancel): ','s'));
            if any(lower(rowLetter) == ["c","cancel"])
                [row, column, type] = getMove(board);
                return;
            end
        end

        % get column

        columnLetter = lower(input('Enter the column of the tile (c to cancel): ','s'));

        % if cancelled, re-prompt

        if any(lower(columnLetter) == ["c","cancel"])
            [row, column, type] = getMove(board);
            return;
        end

        % validate column with while loop

        while length(columnLetter) ~= 1 || columnLetter > maxColLetter || columnLetter < 'a'
            fprintf('Please enter a valid column (a-%s)\n',maxColLetter)
            columnLetter = lower(input('Enter the column of the tile: ','s'));
            if any(lower(rowLetter) == ["c","cancel"])
                [row, column, type] = getMove(board);
                return;
            end
        end

        % convert row and column letters to corresponding row and column values

        row = double(rowLetter) - 95;
        column = double(columnLetter) - 95;
        
        % check that tile is unrevealed
        
        if revealed(row,column) == 0
            unrevealedTile = 1;
        else
            disp('Please enter an unrevealed tile')
        end
    end
end
    