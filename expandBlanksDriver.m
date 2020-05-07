% file driver for testing of expandBlanks function

% test expanding a board from the centre to the outside rows and columns

boardA = string(ones(10));
boardA(2:9,2:9) = " ";
boardA = labelBoard(boardA);
revealedA = ones(12,12);
revealedA(2:11,2:11) = 0;
revealedA(5,5) = 1;
revealedA = expandBlanks(5,5,boardA,revealedA);
displayBoard(boardA,revealedA,zeros(12))
fprintf('All tiles should be revealed\n')

% test a case where a blank should not be expanded

boardB = string(ones(5));
boardB(2,3) = " ";
boardB = labelBoard(boardB);
revealedB = ones(7);
revealedB(2:7,2:7) = 0;
revealedB(3,4) = 1;
revealedB = expandBlanks(3,4,boardB,revealedB);
displayBoard(boardB,revealedB,zeros(7))
fprintf('Tiles around blank at row b, column c should be revealed\n')

% test a case where a blank should expand only once

boardC = string(ones(5));
boardC(2,3:4) = " ";
boardC = labelBoard(boardC);
revealedC = ones(7);
revealedC(2:7,2:7) = 0;
revealedC(3,4) = 1;
revealedC = expandBlanks(3,4,boardC,revealedC);
displayBoard(boardC,revealedC,zeros(7))
fprintf('Blank at row b, column c should reveal blank at row b, column d and all tiles around them\n')
