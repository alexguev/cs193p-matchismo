//
//  Card.m
//  Matchismo
//
//  Created by Alexei Guevara on 13-02-10.
//  Copyright (c) 2013 Alexei Guevara. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)initWithRank:(NSUInteger)rank andSuit:(NSString *)suit {
    self = [super init];
    if (self) {
        self.rank = rank;
        self.suit = suit;
    }
    return self;
}

-(NSString *)contents {
    return [NSString stringWithFormat:@"%@%@", Card.rankStrings[self.rank], self.suit];
}

-(NSInteger)match:(NSArray *)otherCards {
    NSInteger match = 0;
    for (Card *otherCard in otherCards) {
        if (self.suit == otherCard.suit) {
            match += 1;
        } else if (self.rank == otherCard.rank) {
            match += 4;
        } else {
            match = 0;
            break;
        }
    }
    return match;
}

+ (NSArray *)rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank {
    return [self rankStrings].count-1;
}

+ (NSArray *)validSuits {
    return @[@"♥",@"♦",@"♠",@"♣"];
}

@end
