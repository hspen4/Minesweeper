function [row, column] = getMove(board)
    % function that gets a tile on a minesweeper board from the user and
    % returns it as its row and column number
    
    % find max row and column for given board
    
    maxRowLetter = char(size(board,1)) + 94;
    maxColLetter = char(size(board,2)) + 94;
    
    % get row, converting to lowercase
    
    rowLetter = lower(input('Enter the row of the tile: ','s'));
    
    % validate row with while loop
    
    while length(rowLetter) ~= 1 || rowLetter > maxRowLetter || rowLetter < 'a'
        disp('Please enter a valid row')
        rowLetter = lower(input('Enter the row of the tile: ','s'));
    end
    
    % get column
    
    columnLetter = lower(input('Enter the column of the tile: ','s'));
    
    % validate column with while loop
    
    while length(columnLetter) ~= 1 || columnLetter > maxColLetter || columnLetter < 'a'
        disp('Please enter a valid column')
        columnLetter = lower(input('Enter the column of the tile: ','s'));
    end
    
    % convert row and column letters to corresponding row and column values
    
    row = double(rowLetter) - 95;
    column = double(columnLetter) - 95;
end
    