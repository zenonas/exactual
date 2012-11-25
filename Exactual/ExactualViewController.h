//
//  ExactualViewController.h
//  Exactual
//
//  Created by Zinon Kyprianou on 18/11/2012.
//  Copyright (c) 2012 Zinon Kyprianou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExactualViewController : UIViewController {
    UIView *leftDrawerController;
    
}

@property (weak, nonatomic) IBOutlet UILabel *displayL1;
@property (weak, nonatomic) IBOutlet UILabel *displayL2;
@property (weak, nonatomic) IBOutlet UILabel *displayL3;
@property (weak, nonatomic) IBOutlet UILabel *displayL4;
@property (weak, nonatomic) IBOutlet UIView *leftDrawer;

@property (nonatomic,retain) UIViewController * leftDrawerController;

@end
