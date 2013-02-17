//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Alexei Guevara on 13-02-02.
//  Copyright (c) 2013 Alexei Guevara. All rights reserved.
//

#import "CardGameViewController.h"
#import "cardGame.h"

@interface CardGameViewController ()
    @property (nonatomic) NSInteger flipCount;
    @property (strong, nonatomic) CardGame *game;
    @property (strong, nonatomic) Deck *deck;
    @property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtonArray;

@end

@implementation CardGameViewController

-(Deck *)deck {
    if (!_deck) {
        _deck = [[Deck alloc] init];
    }
    return _deck;
}

-(CardGame *)game {
    if (!_game) {
        Deck *deck = [[Deck alloc] init];
        _game = [[CardGame alloc] initWithCardCount:self.cardButtonArray.count
                                          usingDeck: deck];
    }
    return _game;
}

-(void)setCardButtonArray:(NSArray*) cardButtonArray {
    _cardButtonArray = cardButtonArray;
    for (UIButton *cardButton in cardButtonArray) {
        Card *card = [self.deck drawRandomCard];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
    }
    
}

-(void) setFlipCount:(NSInteger)flipCount {
    _flipCount = flipCount;
    //self.flipCountLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flips updated to %d", self.flipCount);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)flipCard:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    
    NSUInteger index = [self.cardButtonArray indexOfObject: sender];
    NSLog(@"Index %d", index);
    
    self.flipCount++;
}

@end
