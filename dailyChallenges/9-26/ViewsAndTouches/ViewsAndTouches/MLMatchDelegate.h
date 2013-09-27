//
//  MLMatchDelegate.h
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/26/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MLMatchDelegate <NSObject>

- (void)didChooseView: (UIView *)view;
- (void)didTouchView: (UIView *)view;

@end
