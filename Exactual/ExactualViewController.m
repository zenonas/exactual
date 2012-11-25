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
@property (nonatomic) BOOL userAlreadyTypedaDot;
@property (nonatomic,strong) ExactualBrain *ebrain;
@property (nonatomic) BOOL hidden;
@end

@implementation ExactualViewController

@synthesize leftDrawer;
@synthesize displayL1 = _displayL1;
@synthesize displayL2 = _displayL2;
@synthesize displayL3 = _displayL3;
@synthesize displayL4 = _displayL4;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize userAlreadyTypedaDot = _userAlreadyTypedaDot;
@synthesize ebrain = _ebrain;


- (ExactualBrain *)ebrain // if i dont have my brain allocate it!
{
    if(!_ebrain) _ebrain = [[ExactualBrain alloc] init];
    return _ebrain;
}

- (void)viewDidLoad
{
  //  leftDrawerController = [self.storyboard //instantiateViewControllerWithIdentifier:@"leftMenu"];
//    [self.view addSubview:leftDrawerController];
    //CGRect leftDrawerFrame = CGRectMake(0, 219, 160 , 329);
//    leftDrawer = [[UIView alloc] initWithFrame:leftDrawerFrame];
  //  leftDrawer.backgroundColor = [[UIColor alloc] initWithRed:154.00 green:155.0 blue:159.0 alpha:1];
//    [self.view addSubview:leftDrawer];
    CGRect leftDrawerFrame = [leftDrawer frame];
    leftDrawerFrame.origin.x = -160;
    [leftDrawer setFrame:leftDrawerFrame];
    
    [super viewDidLoad];
     self.displayL1.font = [UIFont fontWithName:@"SofiaProLight" size:30.0];
     self.displayL2.font = [UIFont fontWithName:@"SofiaProLight" size:30.0];
     self.displayL3.font = [UIFont fontWithName:@"SofiaProLight" size:30.0];
     self.displayL4.font = [UIFont fontWithName:@"SofiaProLight" size:30.0];
        

	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)customButton:(UIButton *)sender {
    
    UIAlertView *custombutAlert = [[UIAlertView alloc] initWithTitle:@"FUTURE FEATURE!" message:@"These are placeholders for future configurable buttons" delegate:nil cancelButtonTitle:@"nvm" otherButtonTitles:nil ];
    [custombutAlert show];
    
}
- (IBAction)expandLeft:(UISwipeGestureRecognizer *)sender {
    
    
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.75];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        CGRect leftDrawerFrame =  [leftDrawer frame];
        leftDrawerFrame.origin.x += 160;
        [leftDrawer setFrame:leftDrawerFrame];
    
        [UIView commitAnimations];


}


-(IBAction)expandMenu:(id)sender
{
    
//    [UIView beginAnimations:nil context:nil];
 //   [UIView setAnimationDuration:0.75];
   // [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
   // CGRect frame=yourMenuView.frame;
//    frame.size.width+=200;
//    yourMenuView.frame=frame;
//     removeFromSuperview];
//    [UIView commitAnimations];
}

- (IBAction)digitPress:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    if ([digit isEqualToString:@"dot"] && !(self.userAlreadyTypedaDot)) {
        digit = @".";
        self.userAlreadyTypedaDot = YES;
    } else if ([digit isEqualToString:@"dot"] && (self.userAlreadyTypedaDot)) digit = @"";
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
    self.userAlreadyTypedaDot = NO;
    [self.ebrain cleanBrain];
}


- (IBAction)operationPress:(UIButton *)sender {
    [self.ebrain determineOperation:[sender currentTitle]];
    [self.ebrain pushOperand:[self.displayL1.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.userAlreadyTypedaDot = NO;
}

- (IBAction)equalsPress:(UIButton *)sender {
    double result = 0;
    if ([self.displayL1.text isEqualToString:@"Ans"]) {
        result = [self.ebrain performOperation:[self.ebrain returnLastAnswer]];
    } else {
        result = [self.ebrain performOperation:[self.displayL1.text doubleValue]];
    }
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.displayL1.text = resultString;
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.userAlreadyTypedaDot = NO;
}

- (IBAction)fnPress:(UIButton *)sender {

    if ([[sender currentTitle] isEqualToString:@"fnPlusminus"]){
        double cNum = [self.displayL1.text doubleValue];
        if (cNum > 0)
            cNum = cNum * -1;
        else
            cNum = fabs(cNum);
        NSString *plusMinusString = [NSString stringWithFormat:@"%g", cNum];
        self.displayL1.text = plusMinusString;
        self.userIsInTheMiddleOfEnteringANumber = NO;
    }
    if ([[sender currentTitle] isEqualToString:@"fnAns"]) {
        self.displayL1.text = @"Ans";
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreaeted.
}

@end
