//
//  MLGame.m
//  Simon Says
//
//  Created by Matthew Loseke on 10/13/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//
# define LEVELIZER 4
#import "MLGame.h"

@implementation MLGame

@synthesize cpuSequence, playerTouchCount, playerTouchCountForRound, level, sequenceLength, numberOfErrors, highScore, score, delegate, lives;

- (id)initWithCpuSequence
{
    self = [super init];
    
    if (self) {
        // we have the game start at level 1 and set the length of cpuSequence to two times the current level
        level = 1;
        //[self generateSequenceWithLength: level * 2];
        [self generateSequenceWithLength: level * LEVELIZER];
        playerTouchCount, numberOfErrors, highScore, score = 0;
        lives = 3;
    }
    
    return self;
}

- (void)generateSequenceWithLength: (int)length
{
    cpuSequence = [[NSMutableArray alloc] init];

    for (int i = 0; i < length; i++) {
        // since there are no color panels with tag 0 we bump the result up by 1 to ensure the returned value matches a color panel tag
        // also, this range *shouldn't* really be hard-coded, need to refactor to be based on number of color panels.
        int integer = (arc4random() % 6) + 1;
        NSString *integerToString = [NSString stringWithFormat:@"%i", integer];
        [cpuSequence addObject:integerToString];
    }
    
    sequenceLength = cpuSequence.count;
}

- (void)handleCorrectTouch
{
    playerTouchCount++;
    playerTouchCountForRound++;
    [self updateScore];
    
    // need to determine if the round has been won
    // we know it will have been won if the playerTouchCountForRound % sequenceLength is 0 since we only increment playerTouchCountForRound
    // on correct touches and set back to zero on incorrect touches.
   
    if (playerTouchCountForRound % sequenceLength == 0) {
        [self handleRoundWin];
    }
}

- (void)handleIncorrectTouch
{
    /*
     need to determine if the game has been lost
     the game has been lost if numberOfErrors is 3
     if the game has not been lost we start the round over at the current level
    */
    
    if (numberOfErrors == 3) {
        [self handleGameOver];
    } else {
        numberOfErrors++;
        [self restartRoundToCurrentLevel];
    }
}

- (void)handleRoundWin
{
    NSLog(@"Round has been won");
    level++;
    [delegate levelDidChange:level];
}

- (void)handleGameOver
{
    NSLog(@"Game has been lost");
    // need to reset the game
}

- (void)restartRoundToCurrentLevel
{
    [delegate numberOfLivesDidChange:(lives - numberOfErrors)];
    NSLog(@"Game has not been lost yet. Need to restart the round at the current level.");
}

- (void)updateScore
{
    score = round(playerTouchCount * sqrtf(playerTouchCount));
    [delegate scoreDidChange:score];
}

@end
