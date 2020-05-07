% main file for minesweeper game, all code is original

clc
clearvars
fprintf('Welcome to Minesweeper. Expand the Command Window for the best experience.\n');

% get size and difficulty of game from user

[rows, columns] = getSize();
difficulty = getDifficulty();
fprintf('\n');

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
    fprintf('\n');
    
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

% game over, clear flags and display revealed board

flagged(:,:) = 0;
displayBoard(board,revealed,flagged);

if gameState(board,revealed) == "won"
    
    % print win message
    
    fprintf('\nYou successfully uncovered all of the non-mine tiles. You win!\n')
    
else
    
    % print lose message
    
    fprintf('\nYou hit a mine on row %s, column %s. You lose!\n',char(tileRow + 95),char(tileCol + 95))
    
end
    
    
    