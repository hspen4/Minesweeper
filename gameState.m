function status = gameState(board,revealed)
    % function that checks if the user has won or lost a minesweeper game
    
    [rows, cols] = size(board);
    
    % check if user has lost
    
    for r = 1:rows
        for c = 1:cols
            if board(r,c) == "X" && revealed(r,c) == 1
                % user has revealed bomb, so return to invoking file
                status = "lost";
                return;
            end
        end
    end
    
    % check if user has won
    
    for i = 2:rows-1
        for j = 2:cols-1
            if board(i,j) ~= "X" && revealed(i,j) ~= 1
                % user has an unrevealed non-bomb tile, so they have not
                % won
                status = "ongoing";
                return;
            end
        end
    end
    
    % user has won
    
    status = "won";
    
end
                
                