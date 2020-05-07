function [row, column, type] = getMove(board,revealed,flagged)
    % function that gets a tile on a minesweeper board from the user and
    % returns it as its row and column number, either flagging it or
    % revealing it
    
    % ask to flag or reveal
    
    type = input('Would you like to flag/unflag or reveal a tile? ','s');
    
    % return the type that the user chose, case-insensitive
    
    if any(lower(type) == ["f","flag","m","mark","unflag","uf","flag/unflag","f/u","flagunflag"])
        type = 'flag';
    elseif any(lower(type) == ["reveal","r","show","s","flip"])
        type = 'reveal';
    else
        % otherwise, re-prompt by calling function again
        disp('Please enter a valid action')
        [row, column, type] = getMove(board,revealed,flagged);
        return;
    end
    
    % find max row and column for given 
    
    maxRowLetter = char(size(board,1)) + 94;
    maxColLetter = char(size(board,2)) + 94;
    
    % loop until a valid tile is entered
    
    validTile = 0;
    
    while ~validTile
    
        % get row, converting to lowercase

        rowLetter = lower(input('Enter the row of the tile (''cancel'' to cancel): ','s'));

        % if cancelled, re-prompt

        if lower(rowLetter) == "cancel"
            [row, column, type] = getMove(board,revealed,flagged);
            return;
        end

        % validate row with while loop

        while length(rowLetter) ~= 1 || rowLetter > maxRowLetter || rowLetter < 'a'
            fprintf('Please enter a valid row (a-%s)\n',maxRowLetter)
            rowLetter = lower(input('Enter the row of the tile (''cancel'' to cancel): ','s'));
            if lower(rowLetter) == "cancel"
                [row, column, type] = getMove(board,revealed,flagged);
                return;
            end
        end

        % get column

        columnLetter = lower(input('Enter the column of the tile (''cancel'' to cancel): ','s'));

        % if cancelled, re-prompt

        if lower(columnLetter) == "cancel"
            [row, column, type] = getMove(board,revealed,flagged);
            return;
        end

        % validate column with while loop

        while length(columnLetter) ~= 1 || columnLetter > maxColLetter || columnLetter < 'a'
            fprintf('Please enter a valid column (a-%s)\n',maxColLetter)
            columnLetter = lower(input('Enter the column of the tile (''cancel'' to cancel): ','s'));
            if lower(columnLetter) == "cancel"
                [row, column, type] = getMove(board,revealed,flagged);
                return;
            end
        end

        % convert row and column letters to corresponding row and column values

        row = double(rowLetter) - 95;
        column = double(columnLetter) - 95;
        
        % check that tile is unrevealed and, if being revealed, is
        % unflagged
        
        if revealed(row,column) == 0 && (flagged(row,column) == 0 || type == "flag")
            validTile = 1;
        elseif revealed(row,column) == 1
            disp('Please enter an unrevealed tile')
        elseif flagged(row,column) == 1
            disp('Please enter an unflagged tile')
        end
    end
end
    