//
//  ExactualBrain.h
//  Exactual
//
//  Created by Zinon Kyprianou on 18/11/2012.
//  Copyright (c) 2012 Zinon Kyprianou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExactualBrain : NSObject

- (double)performOperation:(double)displayOperand;
- (double)returnLastAnswer;
- (void)determineOperation:(NSString *)operatorFN;
- (void)pushOperand:(double)operand;
- (void)cleanBrain;

@end
