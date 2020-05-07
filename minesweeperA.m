% main file for minesweeper game, all code is original

clc
clearvars
fprintf('Welcome to Minesweeper. Expand the Command Window for the best experience.\n');

% get size and difficulty of game from user

[rows, columns] = getSize();
difficulty = getDifficulty();

% generate a random board based on size and difficulty

rng('shuffle')
board = generateBoard(rows,columns,difficulty);
board = labelBoard(board);
board = fillBoard(board);

% generate vectors for revealed and flagged tiles

revealed = ones(rows + 2, columns + 2);
revealed(2:rows + 1,2:columns + 1) = 0;
flagged = zeros(rows + 2, columns + 2);

% loop until game is won or lost

while gameState(board,revealed) == "ongoing"
    
    % display the board
    
    displayBoard(board,revealed,flagged);
    
    % get a move from the user
    
    [tileRow, tileCol, moveType] = getMove(board,revealed);
    
    if moveType == "flag"
        
        % flag / unflag chosen tile
        
        flagged(tileRow,tileCol) = ~flagged(tileRow,tileCol);
        
    else
        
        % flip chosen tile
        
        revealed(tileRow,tileCol) = 1;
        
    end
end