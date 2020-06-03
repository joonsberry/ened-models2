% Starter Code for Tic Tac Toe  K. Ossman  1/7/2016
clear; close all; clc;
load('TicTacToe.mat');
%Board = {'-','-','-';'-','-','-';'-','-','-'};  % For Displaying Plays
imshow(Board)
% Complete the following statement to create a 3x3 matrix of zeros:
Array = zeros([3 3]);
Winner = 0;  % Variable Winner indicates the winner of the game 
WinnerString = 'Nobody';
% 0 = No Winner   1 = Player 1 Wins   2 = Player 2 wins
Player = 1;  % Variable Player indicates whose turn it is
while sum(sum(Array == 0)) > 0   % NEED CONDITION HERE TO CHECK FOR EMPTY SPOTS ON BOARD!
    switch Player
        case 1  % Player 1
            play = input('Place X?  Ex. [1,3] is row 1 and column 3:  ');
			% Complete the statements below to extract row and column from vector, play
            row = play(1); 
			col = play(2);
            % Add entry error checking
            if play > [3,3] | play < [1,1]
                play = input('Place a viable X?  Ex. [1,3] is row 1 and column 3:  ');
            end
            % Enter Player's choice in numerical matrix, Array
			Array(play(1),play(2)) = 1;
			% Enter Player's choice in Cell Array Board (Curly Braces) then display Board
			%Board{play(1),play(2)} = 'X';
			% Determine if Player 1 is a winner and proceed accordingly
            diag1 = Array(1,1) + Array(2,2) + Array(3,3);
            diag2 = Array(1,3) + Array(2,2) + Array(3,1);
            disp(Board);
            if sum(Array(row,:)) == 3 || sum(Array(:,col)) == 3 || diag1==3 || diag2==3
                Winner = 1;
                WinnerString = 'Player 1';
                break
            end
            Player = 2;
        case 2  % Player 2
			play2 = input('Place O?  Ex. [1,3] is row 1 and column 3:  ');
			% Complete the statements below to extract row and column from vector, play
            row = play2(1); 
			col = play2(2);
            % Add entry error checking
            if play2 > [3,3] | play2 < [1,1]
                play2 = input('Place a viable X?  Ex. [1,3] is row 1 and column 3:  ');
            end
            % Enter Player's choice in numerical matrix, Array
			Array(play2(1),play2(2)) = -1;
			% Enter Player's choice in Cell Array Board (Curly Braces) then display Board
			%Board{play2(1),play2(2)} = 'O';
			% Determine if Player 1 is a winner and proceed accordingly
            diag1 = Array(1,1) + Array(2,2) + Array(3,3);
            diag2 = Array(1,3) + Array(2,2) + Array(3,1);
            disp(Board);
            if sum(Array(row,:)) == -3 || sum(Array(:,col)) == -3 || diag1==-3 || diag2==-3
                Winner = 2;
                WinnerString = 'Player2';
                break
            end
            Player = 1;
    end
end
% Declare the winner (if any)
fprintf('The winner is %s.\n',WinnerString);



