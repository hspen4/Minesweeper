function revealed = expandBlanks(row,col,board,revealed) 
    % function that expands on blank tiles when one is flipped in a minesweeper
	% game
    
    % check if tile is a blank
    
    if board(row,col) == " "
        
        % define rows and columns of adjacent tiles
        
        adjRowTiles = [row - 1, row - 1, row - 1, row, row + 1, row + 1, row + 1, row];
        adjColTiles = [col - 1, col, col + 1, col + 1, col + 1, col, col - 1, col - 1];
        
        % iterate through adjacent tiles
        
        for i = 1:8
            
            % check if current tile is an unrevealed blank and not an edge
            % tile
            
            if board(adjRowTiles(i),adjColTiles(i)) == " " && revealed(adjRowTiles(i),adjColTiles(i)) == 0 && adjRowTiles(i) ~= 1 && adjColTiles(i) ~= 1
                
                % reveal tile and call this function again for its adjacent
                % tiles
                
                revealed(adjRowTiles(i),adjColTiles(i)) = 1;
                expandBlanks(adjRowTiles(i),adjColTiles(i),board,revealed);
            end
        end
    end
        