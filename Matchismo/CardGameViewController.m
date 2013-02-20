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
    @property (strong, nonatomic) UIImage *cardBackImage;

    @property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtonArray;
    @property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
    @property (weak, nonatomic) IBOutlet UISegmentedControl *cardsToMatchCountSegmentedControl;
    @property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;
@end

@implementation CardGameViewController

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.cardBackImage = [UIImage imageNamed:@"cardback.png"];
    }
    return self;
}

-(NSUInteger)cardsToMatchCount {
    if (self.cardsToMatchCountSegmentedControl.selectedSegmentIndex == 1) {
        return 3;
    } else {
        return 2;
    }
}

-(CardGame *)game {
    if (!_game) {
        _game = [[CardGame alloc] initWithCardCount:self.cardButtonArray.count
                               andCardsToMatchCount:[self cardsToMatchCount]
                                          usingDeck:[[Deck alloc] init]];
    }
    return _game;
}

-(void)setCardButtonArray:(NSArray*) cardButtonArray {
    _cardButtonArray = cardButtonArray;
    [self updateUI];
    
}

-(void) setFlipCount:(NSInteger)flipCount {
    _flipCount = flipCount;
    self.flipCountLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

-(IBAction)flipCard:(UIButton *)sender {
    NSUInteger index = [self.cardButtonArray indexOfObject: sender];
    NSLog(@"Index %d", index);
    [self.game flipCardAtIndex:index];
    if (self.flipCount==0) {
        self.cardsToMatchCountSegmentedControl.enabled = NO;
    }
    self.flipCount++;
    [self updateUI];
}

- (IBAction)reset:(id)sender {
    self.game = nil;
    self.flipCount = 0;
    self.cardsToMatchCountSegmentedControl.enabled = YES;
    [self updateUI];
}

- (IBAction)changeCardsToMatchCount:(id)sender {
    self.game = nil;
}

-(void)updateUI {
    for (UIButton *cardButton in self.cardButtonArray) {
        NSUInteger cardButtonIndex = [self.cardButtonArray indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceup;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        [cardButton setImage:(!card.isFaceup ? self.cardBackImage : nil) forState:UIControlStateNormal];
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score %d", self.game.score];
}


@end
