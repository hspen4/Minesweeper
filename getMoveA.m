function [row, column] = getMove()
    % function that gets a tile on a minesweeper board from the user and
    % returns it as its row and column number
    
    % get row
    
    rowLetter = input('Enter the row of the tile: ','s');
    
    % get column
    
    columnLetter = input('Enter the column of the tile: ','s');
    
    % convert row and column letters to corresponding row and column values
    
    row = double(rowLetter) - 95;
    column = double(columnLetter) - 95;
end
    