% driver file to test gameState function

% test won game

boardA = fillBoard(labelBoard(["","";"","X"]));
revealedA = [1,1,1,1;1,1,1,1;1,1,0,1;1,1,1,1];
gameStateA = gameState(boardA,revealedA);
fprintf('Expected that game is won. Got that game is %s.\n',gameStateA);

% test lost game

boardB = fillBoard(labelBoard(["X","","","";"X","","X",""]));
revealedB = [1,1,1,1,1,1;1,0,0,1,1,1;1,1,0,0,1,1;1,1,1,1,1,1];
gameStateB = gameState(boardB,revealedB);
fprintf('Expected that game is lost. Got that game is %s.\n',gameStateB);

% test ongoing game

boardC = fillBoard(labelBoard(["","X","","X","";"","","","","";"","","X","X",""]));
revealedC = [1,1,1,1,1,1,1;1,1,0,0,0,1,1;1,1,0,1,1,0,1;1,0,0,0,0,1,1;1,1,1,1,1,1,1];
gameStateC = gameState(boardC,revealedC);
fprintf('Expected that game is ongoing. Got that game is %s.\n',gameStateC);