//
//  MLGame.h
//  Simon Says
//
//  Created by Matthew Loseke on 10/13/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLGame : NSObject

- (id)initWithCpuSequence;

@property (strong, nonatomic) NSMutableArray *cpuSequence;

@property int playerTouchCount;
@property int level;
@property int sequenceLength;

@end
