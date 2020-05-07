function [] = displayBoard(board,revealed,flagged)
    % function that takes a string matrix of a minesweeper board, a
    % matrix of revealed tiles, and a matrix of flagged tiles, and displays
    % it
    
    fprintf('\n')
    
    % iterate through the board and display the labels and tiles
    
    [rows, columns] = size(board);
    for r = 1:rows
        for c = 1:columns
            
            % if the tile has been revealed, display it
            
            if revealed(r,c) == 1
                fprintf('%s ',board(r,c))
            elseif flagged(r,c) == 1
                
                % if the tile has been flagged but not revealed, replace it
                % with an F
                
                fprintf('F ')
                
            elseif r ~= 1 && c ~= 1 && r ~= rows && c ~= columns
                
                % otherwise, print period if it is a non-label, unrevealed
                % tile
                
                fprintf('. ')
            end
        end
        
        % print newline
        
        fprintf('\n')
    end
    
    % display legend
    
    fprintf('No Adjacent Bombs = Blank\tAdjacent Bombs = 1-8\n    Flagged = F\t Unrevealed = .\t Bomb = X\n')
    
    % display number of remaining bombs
    
    fprintf('\n\t%d Total Bombs\t\t  %d Tiles Flagged\n',sum(board == "X",'all'),sum(flagged == 1,'all'));
end