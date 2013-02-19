//
//  Card.h
//  Matchismo
//
//  Created by Alexei Guevara on 13-02-10.
//  Copyright (c) 2013 Alexei Guevara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
@property (nonatomic, getter = isFaceup) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;


- (id)initWithRank:(NSUInteger)rank
           andSuit:(NSString *)suit;

-(NSString *)contents;

-(NSInteger)match:(NSArray *)otherCards;

+(NSArray *)rankStrings;
+(NSUInteger)maxRank;
+(NSArray *)validSuits;

@end
