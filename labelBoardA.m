function board = labelBoard(matrix)
    % function that takes a matrix and labels the outer rows and columns
    % with corresponding letters
    
    % expand original matrix by one row or column on each side, taking it
    % as a string array
    
    [rows, cols] = size(matrix);
    board = string(zeros(rows + 2,cols + 2));
    board(2:rows + 1,2:cols + 1) = matrix;
end