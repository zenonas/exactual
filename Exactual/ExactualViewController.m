//
//  ExactualViewController.m
//  Exactual
//
//  Created by Zinon Kyprianou on 18/11/2012.
//  Copyright (c) 2012 Zinon Kyprianou. All rights reserved.
//

#import "ExactualViewController.h"

@interface ExactualViewController ()


@end

@implementation ExactualViewController
- (IBAction)buttonPressed:(UIButton *)sender {

    NSLog(@"TEST");

}

- (void)viewDidLoad
{
    [super viewDidLoad];
     [displayOne setFont:[UIFont fontWithName:@"SofiaProLight.otf" size:26]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonPressed:(id)sender {
}
@end
