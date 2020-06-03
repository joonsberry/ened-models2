% Two Player Game of TicTacToe  K. Ossman 1/5/2016

clear; close all;

load TicTacToe;   % Loads the images (3x3 Board, X, and O)

% Show the Blank Board Docked and Fit to Window
figure('WindowStyle','docked');
imshow([Board{1,:};Board{2,:};Board{3,:}],'InitialMagnification','Fit');
% The InitialMagnification Property makes the annoying warning go away!

Array = zeros(3,3);  % Create a 3x3 array full of zeros to track player moves and determine winner
Winner = 0;
Player = 1;

while sum(sum(Array == 0)) > 0  % Game Play Continues as Long as there is an Empty Spot (Zero) in Array    
    switch Player   
        case 1    %Player 1
            fprintf('Player 1 - click on your choice \n');
            [x,y] = ginput(1);
            row = floor(y/123) + 1;  % Each square has 123 rows
            col = floor(x/138) + 1;  % Each square has 138 columns
            
            % Make sure player entered a valid position to enter his/her X
            check = 0;
            while check == 0
                if row > 3 || row < 1 || col >3 || col < 1
                    fprintf('Invalid Choice: Click on the board \n');
                    [x,y] = ginput(1);
                    row = floor(y/123) + 1;
                    col = floor(x/138) + 1;
                elseif Array(row,col) ~= 0
                    fprintf('Already Occupied:  Click on an open square on board \n');
                    [x,y] = ginput(1);
                    row = floor(y/123) + 1;
                    col = floor(x/138) + 1;
                else
                    check = 1;
                end
            end
            
            % Valid Choice, so place the X and display the play        
            Array(row,col) = 1;  % Record a 1 in Array
            Board{row,col} = X;  % Put an X in the game board
            imshow([Board{1,:};Board{2,:};Board{3,:}],'InitialMagnification','fit');
            
            % Did Player 1 Win?
            Diag1 = Array(1,1)+Array(2,2)+Array(3,3);
            Diag2 = Array(1,3)+Array(2,2)+Array(3,1);
            if sum(Array(row,:))==3 || sum(Array(:,col))==3 || Diag1==3 || Diag2 == 3
                Winner = 1;
                break;
            else
                Player = 2;
            end
            
        case 2  % Player 2 takes a turn     
            fprintf('Player 2 - click on your choice \n');
            [x,y] = ginput(1);
            row = floor(y/123) + 1;  % Each square has 123 rows
            col = floor(x/138) + 1;  % Each square has 138 columns
            
            % Make sure player entered a valid position to enter his/her O
            check = 0;
            while check == 0
                if row > 3 || row < 1 || col >3 || col < 1
                    fprintf('Invalid Choice: Click on the board \n');
                    [x,y] = ginput(1);
                    row = floor(y/123) + 1;
                    col = floor(x/138) + 1;
                elseif Array(row,col) ~= 0
                    fprintf('Already Occupied:  Click on an open square on board \n');
                    [x,y] = ginput(1);
                    row = floor(y/123) + 1;
                    col = floor(x/138) + 1;
                else
                    check = 1;
                end
            end
            
            % Valid Choice, so place the O and display the play 
            Array(row,col) = -1;  % Record a -1 in Array
            Board{row,col} = O;
            imshow([Board{1,:};Board{2,:};Board{3,:}],'InitialMagnification','fit');
               
            % Did Player 2 Win?
            Diag1 = Array(1,1)+Array(2,2)+Array(3,3);
            Diag2 = Array(1,3)+Array(2,2)+Array(3,1);
            if sum(Array(row,:))==-3 || sum(Array(:,col))==-3 || Diag1==-3 || Diag2 == -3
                Winner = 2;
                break;
            else
                Player = 1;
            end          
    end      
end

if Winner == 1
    msgbox('Player 1 is the Winner!');
elseif Winner == 2
    msgbox('Player 2 is the Winner!');
else
    msgbox('Cat''s Game:  Nobody Wins!');
end





