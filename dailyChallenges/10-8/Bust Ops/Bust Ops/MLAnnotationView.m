//
//  MLAnnotationView.m
//  Bust Ops
//
//  Created by Matthew Loseke on 10/8/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLAnnotationView.h"

@interface MLAnnotationView ()
{
    id observer;
}
@end

@implementation MLAnnotationView

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];

    if (self) {
        // sets the image initially
        self.image = [UIImage imageNamed:@"cloud"];
        // subscribe to 'change image' notifications so we know when to change the image.
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        observer = [nc addObserverForName:@"change image" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
            [self changeImage];
        }];
    }
    
    return self;
}

- (void)changeImage
{
    self.image = [UIImage imageNamed:@"rain"];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

@end
