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
@end

@implementation CardGame

-(NSMutableArray *) cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (int i=0; i<=cardCount; cardCount++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
        };
    }
    return self;
}

@end
