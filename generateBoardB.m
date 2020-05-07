function board = generateBoard(rows, columns, difficulty)
    % function that creates a minesweeper board and returns it as a matrix
    
    % initialize board size and bombs for given arguments
    
    board = zeros(rows,columns);
    bombFrequency = 0;
    
    % reset rng
    
    rng('shuffle');
    
    % set bomb frequency for given difficulty
    
    if difficulty == "hard"
        
        bombFrequency = (rand / 20) + 0.3; % placeholder value between 0.3 and 0.35 
        
    elseif difficulty == "easy"
        
        bombFrequency = (rand / 20) + 0.1; % placeholder value between 0.1 and 0.15
        
    else
        
        % else difficulty must be medium
        
        bombFrequency = (rand / 20) + 0.2; % placeholder value between 0.2 and 0.25
        
    end
end
        
        