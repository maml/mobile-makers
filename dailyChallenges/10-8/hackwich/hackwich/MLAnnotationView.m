//
//  MLAnnotationView.m
//  hackwich
//
//  Created by Matthew Loseke on 10/8/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLAnnotationView.h"

@implementation MLAnnotationView

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
   
    if (self) {
        self.image = [UIImage imageNamed:@"mobilemakers"];
    }
    
    return self;
}

@end
