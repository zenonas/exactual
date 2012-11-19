//
//  ExactualViewController.m
//  Exactual
//
//  Created by Zinon Kyprianou on 18/11/2012.
//  Copyright (c) 2012 Zinon Kyprianou. All rights reserved.
//

#import "ExactualViewController.h"
#import "ExactualBrain.h"


@interface ExactualViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic,strong) ExactualBrain *ebrain;
@end

@implementation ExactualViewController

@synthesize displayL1 = _displayL1;
@synthesize displayL2 = _displayL2;
@synthesize displayL3 = _displayL3;
@synthesize displayL4 = _displayL4;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize ebrain = _ebrain;

- (ExactualBrain *)ebrain // if i dont have my brain allocate it!
{
    if(!_ebrain) _ebrain = [[ExactualBrain alloc] init];
    return _ebrain;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)digitPress:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    if ([digit isEqualToString:@"dot"]) {
        digit = @".";
    }
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.displayL1.text = [self.displayL1.text stringByAppendingString:digit];
    } else {
        self.displayL1.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)clearPress:(UIButton *)sender {
    self.displayL1.text = @"0";
    self.displayL2.text = nil;
    self.displayL3.text = nil;
    self.displayL4.text = nil;
    self.userIsInTheMiddleOfEnteringANumber = NO;
    [self.ebrain cleanBrain];
}


- (IBAction)operationPress:(UIButton *)sender {
    [self.ebrain determineOperation:[sender currentTitle]];
    [self.ebrain pushOperand:[self.displayL1.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)equalsPress:(UIButton *)sender {
    double result = [self.ebrain performOperation:[self.displayL1.text doubleValue]];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.displayL1.text= resultString;
    self.userIsInTheMiddleOfEnteringANumber = NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreaeted.
}

@end
