% driver script for testing of generateBoard function

% should get a 10x10 board with between 8 and 12 bombs

boardA = generateBoard(10,10,"easy");
disp(boardA)
[rowsA, columnsA] = size(boardA);
bombsA = sum(boardA == 9,'all');

% should get a 30x20 board with between 72 and 96 bombs

boardB = generateBoard(30,20,"medium");
disp(boardB)
[rowsB, columnsB] = size(boardB);
bombsB = sum(boardB == 9,'all');

% should get an 8x50 board with between 64 and 80 bombs

boardC = generateBoard(8,50,"hard");
disp(boardC)
[rowsC, columnsC] = size(boardC);
bombsC = sum(boardC == 9,'all');


fprintf('Expected a 10x10 board with between 8 and 12 bombs. Got a %dx%d board with %d bombs.\n',rowsA,columnsA,bombsA)
fprintf('Expected a 30x20 board with between 72 and 96 bombs. Got a %dx%d board with %d bombs.\n',rowsB,columnsB,bombsB)
fprintf('Expected a 8x50 board with between 64 and 80 bombs. Got a %dx%d board with %d bombs.\n',rowsC,columnsC,bombsC)