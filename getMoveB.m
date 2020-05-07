function [row, column] = getMove(board)
    % function that gets a tile on a minesweeper board from the user and
    % returns it as its row and column number
    
    % find max row and column for given board
    
    maxRowLetter = char(size(board,1)) + 94;
    maxColLetter = char(size(board,2)) + 94;
    
    % get row
    
    rowLetter = input('Enter the row of the tile: ','s');
    
    % validate row with while loop
    
    while rowLetter > maxRowLetter || rowLetter < 'a'
        disp('Please enter a valid row')
        rowLetter = input('Enter the row of the tile: ','s');
    end
    
    % get column
    
    columnLetter = input('Enter the column of the tile: ','s');
    
    % validate column with while loop
    
    while columnLetter > maxColLetter || columnLetter < 'a'
        disp('Please enter a valid column')
        columnLetter = input('Enter the column of the tile: ','s');
    end
    
    % convert row and column letters to corresponding row and column values
    
    row = double(rowLetter) - 95;
    column = double(columnLetter) - 95;
end
    