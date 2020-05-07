function board = generateBoard(rows, columns, difficulty)
    % function that creates a minesweeper board and returns it as a matrix
    
    % initialize board size for given arguments
    
    board = zeros(rows,columns);
    
    % reset rng
    
    rng('shuffle');
    
    % set bomb frequency for given difficulty
    
    if difficulty == "hard"
        
        bombFrequency = (rand / 25) + 0.16; % placeholder value between 0.16 and 0.2 
        
    elseif difficulty == "easy"
        
        bombFrequency = (rand / 25) + 0.08; % placeholder value between 0.08 and 0.12
        
    else
        
        % else difficulty must be medium
        
        bombFrequency = (rand / 25) + 0.12; % placeholder value between 0.12 and 0.16
        
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
    
end
        
        