//
//  NSString+Reverse.m
//  Categories
//
//  Created by Matthew Loseke on 10/9/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "NSString+Reverse.h"

@implementation NSString (Reverse)

- (NSString *)reversedString
{
    NSString * text = self;
    
    NSMutableArray *reversedChars = [NSMutableArray new];
    
    for (int i = (text.length - 1); i >= 0; i--) {
        NSRange range = NSMakeRange(i, 1);
        NSString *letter = [text substringWithRange:range];
        [reversedChars addObject:letter];
    }
    
    NSString *reversedString = [reversedChars componentsJoinedByString:@""];
    return reversedString;
}

@end
