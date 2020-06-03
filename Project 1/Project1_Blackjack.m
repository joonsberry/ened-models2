%Creators: Jonathan Kenney, Elizabeth Sheetz
%Models 2 Project 1: Blackjack Simulation
clear; close all; clc;
load CardDeck;
rng('shuffle');

Deck = [1:52 1:52 1:52 1:52];

fprintf('Welcome to the casino Backjack table!\n');
fprintf('Each player begins with $1000. Note that surrender losses and blackjack gains are rounded UP.\n');

play_game = 1;
num_players = input('How many players are there (max 8)? ');
money = ones(1,num_players)*1000;
bets = zeros(1,num_players);
points = zeros(1,num_players);
card_points = [11 11 11 11 2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 5 6 6 6 6 7 7 7 7 8 8 8 8 9 9 9 9 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10];
while play_game == 1
    close all;
    ShuffledDeck = Deck(randperm(length(Deck))); %shuffle the deck
    for player = 1:num_players
        fprintf('Seat %i, ',player);
        bets(player) = input('your bet ($5 - $100): ');
        while bets(player) < 5 || bets(player) > 100
            bets(player) = input('Please bet within the range ($5 - $100): ');
        end
    end
    
    hands = zeros(num_players,11);
    
    for player = 1:num_players
        for position = 1:2
            hands(player,position) = ShuffledDeck(position + 2*(player - 1));
        end
    end
    
    dealer_hand = zeros(1,11);
    dealer_hand(1) = ShuffledDeck(num_players*2 + 1);
    dealer_hand(2) = ShuffledDeck(num_players*2 + 2);
    dealer_points = card_points(dealer_hand(1)) + card_points(dealer_hand(2));
    dealer_blackjack = 0;
    if dealer_points == 21
        dealer_blackjack = 1;
    end
    split_hand1 = zeros(num_players,11);
    split_hand2 = zeros(num_players,11);
    split_points1 = zeros(num_players,11);
    split_points2 = zeros(num_players,11);
    side_play = zeros(1,num_players);
    blackjack = zeros(1,num_players);
    figure(1)
    subplot(3,1,1)
    imshow([BlueDeck{[dealer_hand(1) 55]}]); hold on;
    
    
    for player = 1:num_players
        subplot(3,1,2)
        imshow([BlueDeck{[55 55]}]);
        subplot(3,1,3)
        imshow([BlueDeck{[55 55]}]);
        ready = menu('Are you ready?','Yes');
        subplot(3,1,2)
        imshow([BlueDeck{hands(player,1:2)}]);
        points(player) = card_points(hands(player,1)) + card_points(hands(player,2));
        if points(player) == 21
            menu('You got a blackjack!','Ok');
            blackjack(player) = 1;
        else
            side_play(player) = menu('Would you like to do a side play?','No','Insure','Surrender','Split','Double Down');
            while (side_play(player) == 4 && card_points(hands(player,1)) ~= card_points(hands(player,2))) || (side_play(player) == 2 && card_points(dealer_hand(1)) ~= 11)
                if side_play(player) == 4
                    side_play(player) = menu('You cannot split unless the two cards share point values. Would you like a different side play?','No','Insure','Surrender','Split','Double Down');
                end
                if side_play(player) == 2
                    side_play(player) = menu('You cannot insure unless the dealer has a face-up ace. Would you like a different side play?','No','Insure','Surrender','Split','Double Down');
                end
            end
            if side_play(player) == 4 && card_points(hands(player,1)) == card_points(hands(player,2))
                split_hand1(player,1:2) = [hands(player,1) ShuffledDeck(num_players*2 + player + 1)];
                split_hand2(player,1:2) = [hands(player,2) ShuffledDeck(num_players*2 + player + 2)];
                split_points1(player) = card_points(split_hand1(player,1)) + card_points(split_hand1(player,2));
                split_points2(player) = card_points(split_hand2(player,1)) + card_points(split_hand2(player,2));
                subplot(3,1,2)
                imshow([BlueDeck{split_hand1(player,1:2)}]);
                subplot(3,1,3)
                imshow([BlueDeck{split_hand2(player,1:2)}]);
                hit1 = 1;
                hit_num1 = 2;
                num_aces1 = sum(card_points(split_hand1(player,1:hit_num1)) == 11);
                while hit1 == 1
                    if num_aces1 >= 1 && split_points1(player) > 21
                        split_points1(player) = split_points1(player) - 10;
                        num_aces1 = num_aces1 - 1;
                    end
                    if split_points1(player) > 21
                        menu('You have busted on hand 1.','Ok');
                        split_points1(player) = 0;
                        break;
                    end
                    hit_num1 = hit_num1 + 1;
                    hit1 = menu('Would you like to hit or stand for hand 1?','Hit','Stand');
                    if hit1 == 1
                        split_hand1(player,hit_num1) = ShuffledDeck(num_players*2 + randi([1 10])*player);
                        subplot(3,1,2)
                        imshow([BlueDeck{split_hand1(player,1:hit_num1)}]);
                        split_points1(player) = split_points1(player) + card_points(split_hand1(player,hit_num1));
                    end
                end
                hit2 = 1;
                hit_num2 = 2;
                num_aces2 = sum(card_points(split_hand2(player,1:hit_num2)) == 11);
                while hit2 == 1
                    if num_aces2 >= 1 && split_points2(player) > 21
                        split_points2(player) = split_points2(player) - 10;
                    end
                    if split_points2(player) > 21
                        menu('You have busted on hand 2.','Ok');
                        split_points2(player) = 0;
                        break;
                    end
                    hit_num2 = hit_num2 + 1;
                    hit2 = menu('Would you like to hit or stand for hand 2?','Hit','Stand');
                    if hit2 == 1
                        split_hand2(player,hit_num2) = ShuffledDeck(num_players*2 + randi([1 10])*player);
                        subplot(3,1,3)
                        imshow([BlueDeck{split_hand2(player,1:hit_num2)}]);
                        split_points2(player) = split_points2(player) + card_points(split_hand2(player,hit_num2));
                        if card_points(split_hand2(player,hit_num2)) == 11
                            num_aces2 = num_aces2 + 1;
                        end
                    end
                end
                subplot(3,1,3)
                imshow([BlueDeck{[55 55]}]);
            elseif side_play(player) ~= 3
                if card_points(hands(player,1)) == 11 && card_points(hands(player,2)) == 11
                    points(hands(player,2)) = 1;
                end
                hit = 1;
                hit_num = 2;
                num_aces = sum(card_points(hands(player,1:hit_num)) == 11);
                while hit == 1
                    if num_aces >= 1 && points(player) > 21
                        points(player) = points(player) - 10;
                        num_aces = num_aces - 1;
                    end
                    if points(player) > 21
                        menu('You have busted.','Ok');
                        points(player) = 0;
                        break;
                    end
                    hit_num = hit_num + 1;
                    hit = menu('Would you like to hit or stand?','Hit','Stand');
                    if hit == 1
                        hands(player,hit_num) = ShuffledDeck(num_players*2 + randi([1 10])*player);
                        subplot(2,1,2)
                        imshow([BlueDeck{hands(player,1:hit_num)}]);
                        points(player) = points(player) + card_points(hands(player,hit_num));
                        if card_points(hands(player,hit_num)) == 11
                            num_aces = num_aces + 1;
                        end
                    end
                end
                menu('Click Ok when done.','Ok');
            end
        end
    end
    subplot(2,1,1)
    imshow([BlueDeck{dealer_hand(1:2)}]);
    dealer_hit = 1;
    dealer_hit_num = 2;
    dealer_aces = sum(card_points(dealer_hand(1:dealer_hit_num)) == 11);
    while dealer_hit == 1
        if dealer_aces >=1  && dealer_points > 21
            dealer_points = dealer_points - 10;
            dealer_aces = dealer_aces - 1;
        end
        if dealer_points > 21
            menu('The dealer has busted','Ok');
            dealer_points = 0;
            break;
        end
        if dealer_points >= 17
            break
        end
        dealer_hit_num = dealer_hit_num + 1;
        if dealer_points < 16
            dealer_hand(dealer_hit_num) = ShuffledDeck(num_players*2 + randi([1 10])*10);
            subplot(2,1,1)
            imshow([BlueDeck{dealer_hand(1:dealer_hit_num)}]);
            dealer_points = dealer_points + card_points(dealer_hand(dealer_hit_num));
            if card_points(dealer_hand(dealer_hit_num)) == 11
                dealer_aces = dealer_aces + 1;
            end
        end
    end
    
    for player = 1:num_players
        if side_play(player) == 5
            fprintf('Seat %i has doubled down on their bet.\n',player);
            bets(player) = bets(player)*2;
        end
        if dealer_blackjack == 1 && blackjack(player) == 1
            fprintf('It is a push between seat %i and the dealer.\n',player);
        elseif dealer_blackjack == 1
            fprintf('The dealer has won on a blackjack. Seat %i losings: %i dollars.\n',player,bets(player));
            money(player) = money(player) - bets(player);
        elseif blackjack(player) == 1
            fprintf('Seat %i has won on a blackjack. Winnings: %i dollars.\n',player,bets(player));
            money(player) = money(player) + ceil(bets(player)*1.5);
        elseif side_play(player) == 4
            if split_points1(player) > dealer_points
                fprintf('Seat %i has won their first split hand. Winnings: %i dollars.\n',player,bets(player));
                money(player) = money(player) + bets(player);
            elseif split_points1(player) == dealer_points
                fprintf('The first split hand is a push between seat %i and the dealer.\n',player);
            else
                fprintf('Seat %i has lost their first split hand. Losings: %i dollars.\n',player,bets(player));
                money(player) = money(player) - bets(player);
            end
            if split_points2(player) > dealer_points
                fprintf('Seat %i has won their second split hand and gained %i dollars.\n',player,bets(player));
                money(player) = money(player) + bets(player);
            elseif split_points2(player) == dealer_points
                fprintf('The second split hand is a push between seat %i and the dealer.\n',player);
            else
                fprintf('Seat %i has lost their second split hand. Losings: %i dollars.\n',player,bets(player));
                money(player) = money(player) - bets(player);
            end
        elseif side_play(player) == 3
            fprintf('Seat %i has surrendered and loses half their bet. Losings: %i dollars.\n',player,ceil(bets(player)/2));
            money(player) = money(player) - ceil(bets(player)/2);
        else
            if points(player) > dealer_points
                fprintf('Seat %i has beat the dealer. Winnings: %i dollars.\n',player,bets(player));
                money(player) = money(player) + bets(player);
            elseif points(player) == dealer_points
                fprintf('It is a push between seat %i and the dealer.\n',player);
            else
                fprintf('Seat %i has lost to the dealer. Losings: %i dollars.\n',player,bets(player));
                money(player) = money(player) - bets(player);
            end
        end
        if side_play(player) == 2
            if dealer_blackjack == 1
                fprintf('Seat %i has won their insurance. Winnings: %i dollars.\n',player,bets(player));
                money(player) = money(player) + bets(player);
            else
                fprintf('Seat %i has lost their insurance. Losings: %i dollars.\n',player,bets(player));
                money(player) = money(player) - bets(player);
            end
        end
        menu('Click Ok when done.','Ok');
    end
    for player = 1:num_players
        fprintf('Seat %i balance: $%i\n',player,money(player));
    end
    play_game = menu('Play again?','Yes','No');
end
fprintf('Thanks for playing!\n');
close all;