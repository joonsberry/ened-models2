% BeatTheDealer  K. Ossman
% One Card Dealt to Player and Dealer.  Highest Card wins.
% Game tracks number of player wins and dealer wins to declare an overall winner

load CardDeck;
Deck = RedDeck;  % Deck is a cell array of card images
DeckValues = [14 2:13 14 2:13 14 2:13 14 2:13];

player_wins = 0;
dealer_wins = 0;
play_again = 1; 
ShuffledDeck = randperm(52);  % Shuffle the deck
card_select = 1;  % Card number to be chosen from deck - start at first card 

while play_again == 1
    
    if card_select > 52
    ShuffledDeck = randperm(52);   %Re-shuffle the deck then start at first card
    card_select = 1;
    end
    
    player_card = ShuffledDeck(card_select);
    player_value = DeckValues(player_card);
    card_select = card_select + 1;
   
    dealer_card = ShuffledDeck(card_select);
    dealer_value = DeckValues(dealer_card);
    card_select = card_select + 1;
    
    subplot(1,2,1);imshow([Deck{player_card}]);title('Player Card')
    subplot(1,2,2);imshow([Deck{dealer_card}]);title('Dealer Card')
    
    if player_value > dealer_value
        player_wins = player_wins + 1;
        disp('Player Wins!');
    elseif dealer_value > player_value
        dealer_wins = dealer_wins + 1;
        disp('Dealer Wins!');
    else
        disp('Draw!');
    end
    
    play_again = menu('Play Again?','Yes','No');
    
end

if player_wins > dealer_wins
    msgbox('PLAYER WINS THE GAME!')
elseif dealer_wins > player_wins
    msgbox('DEALER WINS THE GAME!')
else
    msgbox('TIE GAME');
end

fprintf('Number of Dealer Wins:  %d \n',dealer_wins);
fprintf('Number of Player Wins:  %d \n',player_wins);
    


