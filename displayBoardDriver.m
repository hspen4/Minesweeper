% driver file for testing of displayBoard function

% test random 10x10 easy board

boardEasy = fillBoard(labelBoard(generateBoard(10,10,"easy")));
revealedEasy = ones(12,12);
revealedEasy(4:8,4:8) = 0; % hide section
flaggedEasy = zeros(12,12);
displayBoard(boardEasy,revealedEasy,flaggedEasy)
fprintf('\nShould be periods between row c to g and column c to g\n\n')

% test random 5x20 medium board

boardMedium = fillBoard(labelBoard(generateBoard(5,20,"medium")));
revealedMedium = ones(7,22);
revealedMedium(3,2:21) = 0; % hide row
flaggedMedium = zeros(7,22);
displayBoard(boardMedium,revealedMedium,flaggedMedium)
fprintf('\nShould be periods in row b\n\n')

% test random 25x8 hard board

boardHard = fillBoard(labelBoard(generateBoard(25,8,"hard")));
revealedHard = ones(27,10);
revealedHard(2:26,2:9) = 0; % hide all
flaggedHard = zeros(27,10);
flaggedHard(2:26,5) = 1; % flag column
displayBoard(boardHard,revealedHard,flaggedHard)
fprintf('\nShould be periods, with column d flagged\n\n')
