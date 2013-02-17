//
//  Deck.m
//  Matchismo
//
//  Created by Alexei Guevara on 13-02-10.
//  Copyright (c) 2013 Alexei Guevara. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end

@implementation Deck

-(id)init {
    self = [super init];
    if (self) {
        for (NSString *suit in [Card validSuits]) {
            for (NSUInteger rank=1; rank <= [Card maxRank]; rank++) {
                Card *card = [[Card alloc] initWithRank:rank andSuit:suit];
                [self addCard: card];
            }
        }
    }
    return self;
}

-(NSMutableArray *) cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card {
    [self.cards addObject:card];
}

-(Card *) drawRandomCard {
    Card *randomCard = nil;
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
