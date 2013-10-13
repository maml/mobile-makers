//
//  MLColorPanelView.h
//  Simon Says
//
//  Created by Matthew Loseke on 10/10/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorPanelDelegate

- (void)didTouchColorPanelView: (int)tagNumber;

@end

@interface MLColorPanelView : UIView

@property (strong, nonatomic) id<ColorPanelDelegate> delegate;
@property (strong, nonatomic) UIColor *color;

- (void)animateToClearAndBack;

@end
