function revealed = expandBlanks(row,col,board,revealed) 
    % function that expands on blank tiles when one is flipped in a minesweeper
	% game
    
    % check if tile is a blank
    
    if board(row,col) == " "
        
        % initialize array to track all tiles that need to be checked, and
        % another for those that were checked and were revealed
        
        tileChecks = [row,col];
        successfulTileChecks = [row,col];
        
        % track number of checks
        
        currentCheck = 1;
        
        % loop until all possible tile options have been checked
        
        while currentCheck <= (length(tileChecks) / 2)
            
            % check if current tile being checked has no adjacent mines
            
            thisTile = [tileChecks(currentCheck * 2 - 1), tileChecks(currentCheck * 2)];
            
            if board(thisTile(1),thisTile(2)) == " "
                
                % set tile as revealed and add it to the vector of
                % successful checks
                
                revealed(thisTile(1),thisTile(2)) = 1;
                successfulTileChecks = [successfulTileChecks, thisTile(1), thisTile(2)];
                
                % define adjacent tiles to also be checked
                
                adjTiles = [thisTile(1) - 1,thisTile(2) - 1,thisTile(1) - 1,thisTile(2),...
                    thisTile(1) - 1,thisTile(2) + 1,thisTile(1),thisTile(2) + 1,...
                    thisTile(1) + 1,thisTile(2) + 1,thisTile(1) + 1,thisTile(2),...
                    thisTile(1) + 1,thisTile(2) - 1,thisTile(1),thisTile(2) - 1];
                
                % add tiles to vector of tiles to be checked if they are
                % not already there and are valid tiles
                
                for i = 1:length(adjTiles) / 2
                    
                    thisAdjTile = [adjTiles(i * 2 - 1), adjTiles(i * 2)];
                    discardTile = 0;
                    
                    % check that current tile does not already exist in
                    % current vector of tiles to be checked
                    
                    for j = 1:length(tileChecks) / 2
                        if thisAdjTile(1) == tileChecks(j * 2 - 1) && thisAdjTile(2) == tileChecks(j * 2)
                            
                            % tile is already on list of tiles to be
                            % checked
                            
                            discardTile = 1;
                            break;
                        end
                    end
                    
                    % if tile is not already going to be checked, check
                    % that it is a valid tile
                    
                    if ~discardTile && thisAdjTile(1) > 1 && thisAdjTile(1) < size(board,1) &&...
                            thisAdjTile(2) > 1 && thisAdjTile(2) < size(board,2)
                        
                        % tile is valid, so add it to vector of tiles to be
                        % checked
                        
                        tileChecks = [tileChecks, thisAdjTile];
                        
                    end
                end
            end
            
            % increment tile check count
                    
            currentCheck = currentCheck + 1;
        end
        
        % with all blanks revealed, reveal all tiles on the edge of these
        % blanks
        
        for k = 1:length(successfulTileChecks) / 2
            
            % get adjacent tiles to each blank that was revealed
            
            thisTile = [successfulTileChecks(k * 2 - 1), successfulTileChecks(k * 2)];
            adjTiles = [thisTile(1) - 1,thisTile(2) - 1,thisTile(1) - 1,thisTile(2),...
                thisTile(1) - 1,thisTile(2) + 1,thisTile(1),thisTile(2) + 1,...
                thisTile(1) + 1,thisTile(2) + 1,thisTile(1) + 1,thisTile(2),...
                thisTile(1) + 1,thisTile(2) - 1,thisTile(1),thisTile(2) - 1];
            
            % iterate through adjacent tiles and reveal them
            
            for m = 1:length(adjTiles) / 2
                
                % define tile
                
                thisAdjTile = [adjTiles(m * 2 - 1), adjTiles(m * 2)];
        
                % check that tile is valid
                
                if thisAdjTile(1) > 1 && thisAdjTile(1) < size(board,1) && thisAdjTile(2) > 1 &&...
                    thisAdjTile(2) < size(board,2)
                
                    % tile is valid, so reveal it
                    
                    revealed(thisAdjTile(1),thisAdjTile(2)) = 1;
                end
            end
        end
    end
end
        