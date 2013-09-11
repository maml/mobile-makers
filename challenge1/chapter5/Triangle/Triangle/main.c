//
//  main.c
//  Triangle
//
//  Created by Matthew Loseke on 9/11/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#include <stdio.h>

float remainingAngle(float angleA, float angleB)
{
    return 180 - (angleA + angleB);
}

int main(int argc, const char * argv[])
{
    printf("The third angle is %.2f\n", remainingAngle(30.0, 60.0));
    return 0;
}

