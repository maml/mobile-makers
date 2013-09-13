//
//  main.c
//  MemorySizeOfAFloat
//
//  Created by Matthew Loseke on 9/13/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    float f = 3.14;
    printf("a float takes up %zu bytes in memory\n", sizeof(f));
}

