//
//  MLmyView.h
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/26/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLMatchDelegate.h"

@interface MLmyView : UIView

@property (strong, nonatomic) id<MLMatchDelegate> delegate;

@end
