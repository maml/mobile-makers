//
//  MLGame.h
//  Simon Says
//
//  Created by Matthew Loseke on 10/13/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GameEventsDelegate

- (void)scoreDidChange: (int)score;
- (void)levelDidChange: (int)level;
- (void)numberOfLivesDidChange: (int)lives;

@end

@interface MLGame : NSObject

@property (strong, nonatomic) id<GameEventsDelegate> delegate;

- (id)initWithCpuSequence;
- (void)handleCorrectTouch;
- (void)handleIncorrectTouch;

@property (strong, nonatomic) NSMutableArray *cpuSequence;

@property int playerTouchCount;
@property int playerTouchCountForRound;
@property int level;
@property int sequenceLength;
@property int numberOfErrors;
@property int highScore;
@property int score;
@property int lives;

@end
