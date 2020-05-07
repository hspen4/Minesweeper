function board = generateBoard(rows, columns, difficulty)
    % function that creates a minesweeper board and returns it as a matrix
    
    % initialize board size for given arguments
    
    board = zeros(rows,columns);
    
    % reset rng
    
    rng('shuffle');
    
    % set bomb frequency for given difficulty
    
    if difficulty == "hard"
        
        bombFrequency = 0.16;
        
    elseif difficulty == "easy"
        
        bombFrequency = 0.08;
        
    else
        
        % else difficulty must be medium
        
        bombFrequency = 0.12;
        
    end
    
    % multiply bomb frequency by total number of tiles to find number of
    % bombs for given board
    
    bombs = round(rows * columns * bombFrequency);
    
    % get vector of random bomb locations within board based on frequency
    
    numTiles = [1:(rows * columns)];
    bombLocations = zeros(1,bombs);
    
    for i = 1:bombs
        
        % assign a random position as a bomb, then remove it from the
        % vector so it isn't picked again
        
        currentPos = randi(length(numTiles));
        bombLocations(i) = numTiles(currentPos);
        numTiles(currentPos) = [];
        
    end
    
    % iterate through board and assign corresponding tiles as bombs
    
    for r = 1:rows
        for c = 1:columns
            
            % check if current position is in locations vector
            
            if any(bombLocations == (c + (columns * (r - 1))))
                
                % if so, mark as bomb
                
                board(r,c) = 9;
                
            end
        end
    end
    
end