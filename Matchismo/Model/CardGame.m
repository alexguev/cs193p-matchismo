//
//  CardGame.m
//  Matchismo
//
//  Created by Alexei Guevara on 13-02-04.
//  Copyright (c) 2013 Alexei Guevara. All rights reserved.
//

#import "CardGame.h"
#import "Deck.h"
#import "Card.h"

@interface CardGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic) NSUInteger cardsToMatchCount;
@end

@implementation CardGame

-(NSMutableArray *) cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(id)initWithCardCount:(NSUInteger)cardCount andCardsToMatchCount:(NSUInteger) cardsToMatchCount usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (int i=0; i<=cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
        };
        self.cardsToMatchCount = cardsToMatchCount;
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger) index {
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

-(void)flipCardAtIndex:(NSUInteger) index {
    Card *card = [self cardAtIndex:index];
    if (!card.isUnplayable) {
        if (!card.isFaceup) {
            NSMutableArray *otherCards = [[NSMutableArray alloc] initWithCapacity:2];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceup && !otherCard.isUnplayable) {
                    [otherCards addObject:otherCard];
                    if ([otherCards count] == self.cardsToMatchCount - 1) {
                        NSInteger matchScore = [card match: otherCards];
                        if (matchScore) {
                            card.unplayable = YES;
                            [self set:otherCards unplayableTo:YES];
                            self.score += MATCH_BONUS * matchScore;
                        } else {
                            [self set:otherCards faceUpTo:NO];
                            self.score -= MISMATCH_PENALTY;
                        }
                        break;
                    }
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.faceUp;
    }
}

-(void)set:(NSArray *)cards unplayableTo:(BOOL) unplayable {
    for (Card *card in cards) {
        card.unplayable = unplayable;
    }
}

-(void)set:(NSArray *)cards faceUpTo:(BOOL) faceUp {
    for (Card *card in cards) {
        card.faceUp = faceUp;
    }
}


@end
