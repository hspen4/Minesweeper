function board = fillBoard(matrix)
    % function that fills a given minesweeper board with numbers
    % corresponding to adjacent bombs, assuming the outer rows and columns
    % are already populated with letter labels
    
    board = matrix;
    [rows, cols] = size(board);
    
    % iterate through contents of board, and convert bombs to 'X' character
    
    for i = 1:rows
        for j = 1:cols
            if board(i,j) == "9"
                board(i,j) = "X";
            end
        end
    end
    
    % iterate through board and populate inner elements with the number of
    % adjacent bombs, if they are non-bombs
    
    for r = 2:rows - 1
        for c = 2:cols - 1
            
            % find number of adjacent bombs if this tile is not a bomb
            
            if board(r,c) ~= "X"
                
                adjTiles = [board(r - 1, c - 1:c + 1), board(r, c - 1), board(r, c + 1), board(r + 1, c - 1:c + 1)];
                adjBombs = sum(adjTiles == "X");

                % set tile value to number of adjacent bombs if there are
                % any
                
                    if adjBombs > 0
                        board(r,c) = string(adjBombs);
                    else
                        % replace with space
                        board(r,c) = " ";
                    end
            end
        end
    end            
end
    