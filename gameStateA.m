function status = gameState(board,revealed)
    % function that checks if the user has won or lost a minesweeper game
    
    [rows, cols] = size(board);
    
    % check if user has lost
    
    for r = 1:rows
        for c = 1:cols
            if board(r,c) == "X" && revealed(r,c) == 1
                % user has revealed bomb, so return to invoking file
                status = "loss";
                return;
            end
        end
    end
end
                
                