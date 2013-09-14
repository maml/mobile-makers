//
//  main.c
//  date4MillionSecondsFromNow
//
//  Created by Matthew Loseke on 9/13/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#include <stdio.h>
#include <time.h>

int main(int argc, const char * argv[])
{
    long secondsSince1970 = time(NULL);
    long fourMillionSeconds = 4000000;
    long targetTimeToCalculate = secondsSince1970 + fourMillionSeconds;
    
    struct tm futureTime;
    localtime_r(&targetTimeToCalculate, &futureTime);
    int year = 1900 + futureTime.tm_year;
    
    printf("The date will be %d-%d-%d", futureTime.tm_mon, futureTime.tm_mday, year);
}

