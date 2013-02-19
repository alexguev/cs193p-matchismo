//
//  CardGame.h
//  Matchismo
//
//  Created by Alexei Guevara on 13-02-04.
//  Copyright (c) 2013 Alexei Guevara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardGame : NSObject

@property (nonatomic, readonly) NSInteger score;

- (id)initWithCardCount:(NSUInteger)cardCount
   andCardsToMatchCount:(NSUInteger) cardsToMatchCount
              usingDeck:(Deck *)deck;

-(void)flipCardAtIndex:(NSUInteger) index;

-(Card *)cardAtIndex:(NSUInteger) index;

@end
