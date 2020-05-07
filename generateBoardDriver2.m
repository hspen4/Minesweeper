% driver to test generateBoard for many different instances

% get number of iterations

tests = input('How many tests? ');

% set difficulties

difficulties = ["easy","medium","hard"];

% iterate for chosen number of tests

for i = 1:tests
    rows = randi(500);
    columns = randi(500);
    difficulty = randi(3);
    board = generateBoard(rows,columns,difficulties(difficulty));
    bombs = sum(board == 9,'all');
    
    % set min and max bombs for test
    
    if difficulty == 1
        min = round(0.08 * rows * columns);
        max = round(0.12 * rows * columns);
    elseif difficulty == 2
        min = round(0.12 * rows * columns);
        max = round(0.16 * rows * columns);
    else
        min = round(0.16 * rows * columns);
        max = round(0.20 * rows * columns);
    end
    
    % check if generated board fails paramters
    
    if bombs < min || bombs > max || size(board,1) ~= rows || size(board,2) ~= columns
        fprintf('Error: Expected %dx%d matrix with between %d and %d bombs. Received %dx%d matrix with %d bombs.',rows,columns,min,max,size(board,1),size(board,2),bombs)
        return;
    end
end

% display if no errors arose

disp('No errors.')
