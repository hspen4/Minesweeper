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
end
    