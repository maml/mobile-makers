//
//  ViewController.m
//  Palindrome
//
//  Created by Don Bora on 4/28/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITextField *inputTextField;
    __weak IBOutlet UILabel *resultLabel;
    
    int result;
}
- (IBAction)check:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showIsPalindrone
{
    resultLabel.text = @"IS a palindrone!";
}

-(void)showIsNotPalindrone
{
    resultLabel.text = @"IS NOT a palindrone!";
}


-(const char*)getCharacterArray
{
    return [inputTextField.text UTF8String];
}


-(void)showResult
{
    resultLabel.text = [NSString stringWithFormat:@"%i", result];
}


-(void)checkForPalindrome
{
    const char* arrayOfCharacters = [self getCharacterArray];
    BOOL isPalindrome = NO;
    
    int numberOfCharacters = strlen(arrayOfCharacters);
    
    // Insert code in here to check the characters of the array for palindronishness
    for (int i = 0; i < (numberOfCharacters - i); i++) {        
        if (arrayOfCharacters[i] == arrayOfCharacters[(numberOfCharacters - 1) - i]) {
            isPalindrome = YES;
        } else {
            isPalindrome = NO;
            break;
        }
    }
    
    
    if (isPalindrome) {
        [self showIsPalindrone];
    }
    else{
        [self showIsNotPalindrone];
    }    
}


-(void)sumIntegers
{
    const char* arrayOfCharacters = [self getCharacterArray];
    
    int numberOfCharacters = strlen(arrayOfCharacters);

    // clear out result so it doesn't hold previous value
    result = 0;

    for (int i = 0; i < numberOfCharacters; i++) {
            
        if (arrayOfCharacters[i] != ',')
        {
            result += atoi(&arrayOfCharacters[i]);
            
        }
        
    }
    
    [self showResult];
}

- (IBAction)check:(id)sender
{
    //[self checkForPalindrome];
    
    // Uncomment the following line of code and comment out the previous line of code to run summation
    [self sumIntegers];
}
@end
