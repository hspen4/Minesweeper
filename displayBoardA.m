function [] = displayBoard(board)
    % function that takes a string matrix of a minesweeper board and
    % displays it
    
    % iterate through the board and display the labels and tiles
    
    [rows, columns] = size(board);
    for r = 1:rows
        for c = 1:columns
            fprintf('%s ',board(r,c))
        end
        
        % print newline
        
        fprintf('\n')
    end
end