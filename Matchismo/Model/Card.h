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


- (id)initWithRank:(NSUInteger)rank
           andSuit:(NSString *)suit;

-(NSString *)contents;

+(NSArray *)rankStrings;
+(NSUInteger)maxRank;
+(NSArray *)validSuits;

@end
