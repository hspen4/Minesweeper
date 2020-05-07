function board = labelBoard(matrix)
    % function that takes a matrix and labels the outer rows and columns
    % with corresponding letters
    
    % expand original matrix by one row or column on each side, taking it
    % as a string array
    
    [rowsOriginal, colsOriginal] = size(matrix);
    board = string(zeros(rowsOriginal + 2,colsOriginal + 2));
    [rows, cols] = size(board);
    board(2:rows - 1,2:cols - 1) = matrix;
    
    % iterate through matrix and add corresponding letters if on the fence
    
    for r = 1:rows
        for c = 1:cols
            if (r == 1 || r == rows) && (c ~= 1 && c ~= cols)
                
                % add corresponding letter to top or bottom row
                
                board(r,c) = char(95 + c);
                
            elseif (c == 1 || c == cols) && (r ~= 1 && r ~= rows)
                
                % add coresponding letter to left or right column
                
                board(r,c) = char(95 + r);
            end
        end
    end
end
    