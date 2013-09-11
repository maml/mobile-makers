//
//  main.c
//  BackwardsCount
//
//  Created by Matthew Loseke on 9/11/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int i;
    for (i = 99; i > -1; i -= 3){
        printf("The current number is %d\n", i);
        if (i % 5 == 0) {
            printf("Found one!\n");
        }
    }
}