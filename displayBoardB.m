function [] = displayBoard(board,revealed)
    % function that takes a string matrix of a minesweeper board, and a
    % matrix of revealed tiles, and displays it
    
    % iterate through the board and display the labels and tiles
    
    [rows, columns] = size(board);
    for r = 1:rows
        for c = 1:columns
            
            % if the tile has been revealed, display it
            
            if revealed(r,c) == 1
                fprintf('%s ',board(r,c))
            end
        end
        
        % print newline
        
        fprintf('\n')
    end
end