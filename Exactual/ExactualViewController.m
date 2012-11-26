//
//  ExactualViewController.m
//  Exactual
//
//  Created by Zinon Kyprianou on 18/11/2012.
//  Copyright (c) 2012 Zinon Kyprianou. All rights reserved.
//

#import "ExactualViewController.h"
#import "ExactualBrain.h"
#import "MathMLConvert.h"


@interface ExactualViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic) BOOL userAlreadyTypedaDot;
@property (nonatomic,strong) ExactualBrain *ebrain;
@property (nonatomic) BOOL hidden;
@property (nonatomic) BOOL leftDrawerOpen;
@property (nonatomic) BOOL rightDrawerOpen;
@end

@implementation ExactualViewController

@synthesize leftDrawerOpen = _leftDrawerOpen;
@synthesize rightDrawerOpen = _rightDrawerOpen;

@synthesize leftDrawer;
@synthesize rightDrawer;

@synthesize displayL1 = _displayL1;
@synthesize displayWeb;

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
    /* Custom subview code
     
    leftDrawerController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftMenu"];
    [self.view addSubview:leftDrawerController];
    CGRect leftDrawerFrame = CGRectMake(0, 219, 160 , 329);
    leftDrawer = [[UIView alloc] initWithFrame:leftDrawerFrame];
    leftDrawer.backgroundColor = [[UIColor alloc] initWithRed:154.00 green:155.0 blue:159.0 alpha:1];
    [self.view addSubview:leftDrawer];
    
     */
/*
    NSString *customMathML = @"<html><head><<math xmlns=\"http://www.w3.org/1998/Math/MathML\" display=\"block\"><mrow><mi>x</mi><mo>=</mo><mfrac><mrow><mo>&#x2212;</mo><mi>b</mi><mo>&#xB1;</mo><msqrt><mrow><msup><mi>b</mi><mn>2</mn></msup><mo>&#x2212;</mo><mn>4</mn><mi>a</mi><mi>c</mi></mrow></msqrt></mrow><mrow><mn>2</mn><mi>a</mi></mrow></mfrac></mrow></math>";
 
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSURL *fileURL = [NSURL fileURLWithPath:[documentsDirectory stringByAppendingPathComponent:@"/"]];*/
    NSString *startDisplayHtml = @"<html><head><script type=\"text/javascript\" src=\"ASCIIMathML.js\"></script></head><body><p>amath $";
    NSString *expressionToDisplay = @"\\frac{sqrt(2)}{2}";
    NSString *trailHtml = @"$ endamath</p></body></html>";
    NSString *customMathML = [startDisplayHtml stringByAppendingString:expressionToDisplay];
    customMathML = [customMathML stringByAppendingString:trailHtml];
    NSLog(@"%@",customMathML);
    [self.displayWeb loadHTMLString:customMathML baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];

 //   NSString *indexPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html" inDirectory:@"ASCIIMathML/"];

    
   // [displayWeb loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:indexPath]]];
    //[displayWeb loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"] isDirectory:NO ]]];
    
    _leftDrawerOpen = NO;
    _rightDrawerOpen = NO;
    UISwipeGestureRecognizer *swipeFromLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(fromLeftSwipeHandler)];
    swipeFromLeft.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeFromLeft];
    
    UISwipeGestureRecognizer *swipeFromRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(fromRightSwipeHandler)];
    swipeFromRight.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeFromRight];
    
    CGRect leftDrawerFrame = [leftDrawer frame];
    leftDrawerFrame.origin.x = -160;
    [leftDrawer setFrame:leftDrawerFrame];
    
    [super viewDidLoad];
     self.displayL1.font = [UIFont fontWithName:@"SofiaProLight" size:30.0];

        

	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)customButton:(UIButton *)sender {
    
    UIAlertView *custombutAlert = [[UIAlertView alloc] initWithTitle:@"FUTURE FEATURE!" message:@"These are placeholders for future configurable buttons" delegate:nil cancelButtonTitle:@"nvm" otherButtonTitles:nil ];
    [custombutAlert show];
    
}

- (void)fromLeftSwipeHandler
{
    
    
    if((_leftDrawerOpen == NO) && (_rightDrawerOpen == NO)){

        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.75];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        CGRect leftDrawerFrame =  [leftDrawer frame];
        leftDrawerFrame.origin.x += 160;
        [leftDrawer setFrame:leftDrawerFrame];
    
        [UIView commitAnimations];
        
        _leftDrawerOpen = YES;
        return;

    }
    if ((_rightDrawerOpen == YES) && (_leftDrawerOpen == NO)){
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.75];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        CGRect rightDrawerFrame =  [rightDrawer frame];
        rightDrawerFrame.origin.x += 160;
        [rightDrawer setFrame:rightDrawerFrame];
        
        [UIView commitAnimations];

        _rightDrawerOpen = NO;
        return;
    }

}


- (void)fromRightSwipeHandler
{
    
    
    if((_leftDrawerOpen == YES) && (_rightDrawerOpen == NO)){
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.75];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        CGRect leftDrawerFrame =  [leftDrawer frame];
        leftDrawerFrame.origin.x -= 160;
        [leftDrawer setFrame:leftDrawerFrame];
        
        [UIView commitAnimations];
        
        _leftDrawerOpen = NO;
        return;
        
    }
    if ((_rightDrawerOpen == NO) && (_leftDrawerOpen == NO)){
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.75];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        CGRect rightDrawerFrame =  [rightDrawer frame];
        rightDrawerFrame.origin.x -= 160;
        [rightDrawer setFrame:rightDrawerFrame];
        
        [UIView commitAnimations];
        _rightDrawerOpen = YES;
        return;
    }
    
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
    if ([digit isEqualToString:@"0"] && (self.userIsInTheMiddleOfEnteringANumber == NO))
        return; // protect against trailing 0s
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
    // I need to clear the webview still
    
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
    NSString *resultString = [NSString stringWithFormat:@"%.20f", result];
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
        NSString *plusMinusString = [NSString stringWithFormat:@"%.12f", cNum];
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
