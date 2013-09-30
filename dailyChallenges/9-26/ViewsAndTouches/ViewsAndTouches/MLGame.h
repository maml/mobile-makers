//
//  MLGame.h
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/27/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

/*
 selections     - a mutable array with capacity 2 used to keep track of the two most recent selections
 selectionCount - an int used to determine if a comparison needs to be made, which is whenever selectionCount % 2 == 0
 matchCounter   - an int used to track the number of matches
 missCounter    - an int used to track the number of misses
 images         - an array used to hold pointers to the names of the iamges we want to use in the assetts directory
*/

#import <Foundation/Foundation.h>

@interface MLGame : NSObject

@property (strong, nonatomic) NSMutableArray *imageNames;
@property (strong, nonatomic) NSMutableArray *selections;
@property int selectionCount;
@property int matchCounter;
@property int missCounter;

- (void)reset;

@end
