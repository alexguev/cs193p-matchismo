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

- (id)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck;    

@end
