function [row, column, type] = getMove(board)
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
        % otherwise, prompt again
        disp('Please enter a valid move')
        [row, column, type] = getMove(board);
        return;
    end
    
    % find max row and column for given board
    
    maxRowLetter = char(size(board,1)) + 94;
    maxColLetter = char(size(board,2)) + 94;
    
    % get row, converting to lowercase
    
    rowLetter = lower(input('Enter the row of the tile: ','s'));
    
    % validate row with while loop
    
    while length(rowLetter) ~= 1 || rowLetter > maxRowLetter || rowLetter < 'a'
        fprintf('Please enter a valid row (a-%s)\n',maxRowLetter)
        rowLetter = lower(input('Enter the row of the tile: ','s'));
    end
    
    % get column
    
    columnLetter = lower(input('Enter the column of the tile: ','s'));
    
    % validate column with while loop
    
    while length(columnLetter) ~= 1 || columnLetter > maxColLetter || columnLetter < 'a'
        fprintf('Please enter a valid column (a-%s)\n',maxColLetter)
        columnLetter = lower(input('Enter the column of the tile: ','s'));
    end
    
    % convert row and column letters to corresponding row and column values
    
    row = double(rowLetter) - 95;
    column = double(columnLetter) - 95;
end
    