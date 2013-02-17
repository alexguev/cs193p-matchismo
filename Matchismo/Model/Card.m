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
    return [NSString stringWithFormat:@"%d%@", self.rank, self.suit];
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
