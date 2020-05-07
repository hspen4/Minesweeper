% main file for minesweeper game, all code is original

clc
clearvars
gameContinue = 1;
fprintf('Welcome to Minesweeper. Expand the Command Window for the best experience.\n');

% loop until user no longer wants to play

while gameContinue == 1

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
    revealed(2:rows + 2,2:columns + 2) = 0; % don't reveal labels in the last row and column
    flagged = zeros(rows + 2, columns + 2);

    % loop until game is won or lost

    while gameState(board,revealed) == "ongoing"

        % display the board

        displayBoard(board,revealed,flagged);
        fprintf('\n');

        % get a move from the user

        [tileRow, tileCol, moveType] = getMove(board,revealed,flagged);

        if moveType == "flag"

            % flag / unflag chosen tile

            flagged(tileRow,tileCol) = ~flagged(tileRow,tileCol);

        else

            % flip chosen tile

            revealed(tileRow,tileCol) = 1;
            
            % expand any connected tiles with no adjacent mines, if this
            % tile has no adjacent mines
            
            revealed = expandBlanks(tileRow,tileCol,board,revealed);

        end
    end

    % game over, clear flags and display revealed board
    
    winLose = gameState(board,revealed);
    flagged(:,:) = 0;
    revealed(1:rows + 1,1:columns + 1) = 1;
    displayBoard(board,revealed,flagged)

    if winLose == "won"

        % print win message

        fprintf('\nYou successfully uncovered all of the non-mine tiles. You win!\n')

    else

        % print lose message

        fprintf('\nYou hit a mine on row %s, column %s. You lose!\n',char(tileRow + 95),char(tileCol + 95))

    end
    
    % ask to play again
    
    replay = input('Play again (yes/no)? ','s');
    
    if any(lower(replay) == ["no","n","nah","nope"])
        
        % end the program
        
        gameContinue = 0;
        
    elseif ~any(lower(replay) == ["yes","y","yep","yeah"])
        
        % invalid response, continue to prompt until yes or no is received
        
        while ~any(lower(replay) == ["yes","y","yep","yeah"])       
            disp('Please enter yes or no.')
            replay = input('Play again (yes/no)? ','s');
            if any(lower(replay) == ["no","n","nah","nope"])
        
                % end the program
        
                gameContinue = 0;
                
            end
        end
    end
end
        
        
    