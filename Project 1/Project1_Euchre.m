%Creators: Jonathan Kenney, Elizabeth Sheetz
%Models 2 Project 1: Euchre Simulation
clear; close all; clc;
load CardDeck;
rng('shuffle');

Deck = [1:4,33:52]; %gets Euchre cards

ShuffledDeck = Deck(randperm(length(Deck))); %shuffle deck
face_down = [1 1 1 1 1]*55; %initializes a variable for 5 face down cards
hand = 1:5; %index deck for hand, does not assign a hand variable
pickitup = 2; %initializes variable for dealer pickup
%group suits
clubs = [1 33 37 41 45 49]; %trump = 1
spades = [2 34 38 42 46 50]; %trump = 2
hearts = [3 35 39 43 47 51]; %trump = 3
diamonds = [4 36 40 44 48 52]; %trump = 4

suitordered = [clubs spades hearts diamonds]; %suit-ordered version of deck

trump = 0;

caller = 0;

subplot(2,1,1)
imshow([BlueDeck{ShuffledDeck(21)}]); hold on; %shows top card of kitty

for player_firsttime = 1:4
    subplot(2,1,2)
    imshow([BlueDeck{face_down}]); %display 5 face down cards
    menu('Ready to see your hand?','Yes');
    imshow([BlueDeck{ShuffledDeck(hand)}]);
    if pickitup == 2 && player_firsttime ~= 4
        pickitup = menu('Do you want the dealer to pick it up?','Yes','No');
        if pickitup ==1
            caller=player_firsttime;
        end
        menu('Click "Ok" when done.','Ok');
    elseif player_firsttime == 4
        if pickitup == 2
            imshow([BlueDeck{ShuffledDeck(hand)}]);
            pickitup = menu('Dealer, do you want to pick it up?','Yes','No');
            if pickitup ==1
                caller=player_firsttime;
            end
        end
        if pickitup == 1
            imshow([BlueDeck{ShuffledDeck(hand)}]);
            discard = menu('Pick a card to discard.','1','2','3','4','5');
            ShuffledDeck(hand(discard)) = ShuffledDeck(21);
            imshow([BlueDeck{ShuffledDeck(hand)}]);
            subplot(2,1,1)
            imshow([BlueDeck{55}]); hold on;
            menu('Click "Ok" when done.','Ok');
            trump_location = find(suitordered == ShuffledDeck(21));
            if trump_location <= 6
                trump = 1;
            elseif trump_location <= 12
                trump = 2;
            elseif trump_location <= 18
                trump = 3;
            elseif trump_location <= 24
                trump = 4;
            end
            break
        elseif pickitup == 2
            subplot(2,1,1)
            imshow([BlueDeck{55}]); hold on;
            hand = 1:5;
            notrump_location = find(suitordered == ShuffledDeck(21));
            if notrump_location <= 6
                notrump = 1;
            elseif notrump_location <= 12
                notrump = 2;
            elseif notrump_location <= 18
                notrump = 3;
            elseif notrump_location <= 24
                notrump = 4;
            end
            for player_secondtime = 1:4
                subplot(2,1,2)
                imshow([BlueDeck{face_down}]);
                menu('Ready to see your hand?','Yes');
                subplot(2,1,2)
                imshow([BlueDeck{ShuffledDeck(hand)}]);
                if player_secondtime == 4
                    declare = menu('You got stuck with the pick. Declare.','Okay');
                    caller = 4
                else
                    declare = menu('Do you want to delcare trump?','Yes','No');
                    if pickitup ==1
                        caller = player_secondtime;
                    end
                end
                if declare == 1
                    trump = menu('What suit?','Clubs','Spades','Hearts','Diamonds');
                    while trump == notrump
                        trump = menu('You cannot pick the denied suit. Pick again.','Clubs','Spades','Hearts','Diamonds');
                    end
                    break
                end
                menu('Click "Ok" when done.','Ok');
                hand = hand + 5;
            end
        end
    else
        menu('Click "Ok" when done.','Ok');
    end
    hand = hand + 5;
end
close all;

hands = zeros(4,5);
trumpMatrix = [41 42 1 49 45 37 33; 42 41 2 50 46 38 34; 43 44 3 51 47 39 35; 44 43 4 52 48 40 36];
if trump == 1
    offleadMatrix = [1 49 45 41 37 33; 2 50 46 0 38 34; 3 51 47 43 39 35; 4 52 48 44 40 36];
elseif trump == 2
    offleadMatrix = [1 49 45 0 37 33; 2 50 46 42 38 34; 3 51 47 43 39 35; 4 52 48 44 40 36];
elseif trump == 3
    offleadMatrix = [1 49 45 41 37 33; 2 50 46 42 38 34; 3 51 47 43 39 35; 4 52 48 0 40 36];
else
    offleadMatrix = [1 49 45 41 37 33; 2 50 46 42 38 34; 3 51 47 0 39 35; 4 52 48 44 40 36];
end
for player = 1:4
    for position = 1:5
        hands(player, position) = ShuffledDeck((player - 1)*5 + position);
    end
end

playTurn = 1;
playChoice = [0 0 0 0];
check = [0 0 0 0 0];
winOrder = zeros(1,13);
team1Tricks = 0;
team2Tricks = 0;
winner = zeros(1,5);
choice = [0 0 0 0];
field = [55 55 55 55];
figure(1)
subplot(2,1,1)
imshow([BlueDeck{field}]);
subplot(2,1,2)
imshow([BlueDeck{face_down}]); %display 5 face down cards

for trick = 1:5
    for play = 1:4
        subplot(2,1,2)
        menu('Ready to see your hand?','Yes');
        imshow([BlueDeck{hands(playTurn,:)}]);
        choice(play) = menu('What card would you like to play?','1','2','3','4','5');
        playChoice(playTurn) = hands(playTurn, choice(play));       
        if play == 1
            if sum(trumpMatrix(trump,:) == playChoice(play)) == 1
                follow = trump;
                playedSuit = trump;
                followCards = trumpMatrix(follow,:);
            else
                follow = find(sum((offleadMatrix)' == playChoice(play)));
                playedSuit = follow;
                followCards = offleadMatrix(follow,:);
            end
        end
        if play ~= 1
            if sum(trumpMatrix(trump,:) == playChoice(play)) == 1
                playedSuit = trump;
            else
                playedSuit = find(sum((offleadMatrix)' == playChoice(play)));
            end
        end
        for handPosition = 1:5
            check(handPosition) = sum(followCards == hands(playTurn,handPosition));
        end
        while playedSuit ~= follow && sum(check) > 0
            choice = menu('Follow Suit','1','2','3','4','5');
            playChoice(playTurn) = hands(playTurn,choice);
            if sum(sum((offleadMatrix)' == playChoice(play))) == 1
                playedSuit = find(sum((offleadMatrix)' == playChoice(play)));
            else
                playedSuit = trump;
            end
        end
        if playTurn < 4
            playTurn = playTurn + 1;
        else
            playTurn = 1;
        end
        field(play) = playChoice(playTurn);
        hands(playTurn, choice(play)) = 55;
        imshow([BlueDeck{hands(playTurn,:)}]);
        subplot(2,1,1)
        imshow([BlueDeck{field}]);
        menu('Click "Ok" when done.','Ok');
    end
    winOrder(1:7) = trumpMatrix(trump,:);
    winOrder(8:13) = offleadMatrix(follow,:);
    winCheck = 1;
    while winCheck < 14
        for k = 1:4
            if playChoice(playTurn) == winOrder(winCheck)
                winner(trick) = playTurn;
                menu('The trick has been won. Click "Ok".','Ok');
                fprintf('Winner: %i\n',winner(trick));
                winCheck = 13;
            else
                if playTurn < 4
                    playTurn = playTurn + 1;
                else
                    playTurn = 1;
                end
            end
        end
        winCheck = winCheck + 1;        
    end
    if winner(trick) == 1 || winner(trick) == 3
        team1Tricks = team1Tricks + 1;
    else
        team2Tricks = team2Tricks + 1;
    end
    if team1Tricks + team2Tricks == 4 && (team1Tricks == 3 || team2Tricks == 3)
        break
    end
end

fprintf('It may have worked.\n');
close all;