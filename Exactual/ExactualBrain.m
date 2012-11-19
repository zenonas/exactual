//
//  ExactualBrain.m
//  Exactual
//
//  Created by Zinon Kyprianou on 18/11/2012.
//  Copyright (c) 2012 Zinon Kyprianou. All rights reserved.
//

#import "ExactualBrain.h"

@interface ExactualBrain()
@property (nonatomic,strong) NSMutableArray *operandQueue;
@property (nonatomic,strong) NSString *operatorSymbol;

@end

@implementation ExactualBrain

@synthesize operandQueue = _operandQueue;
@synthesize operatorSymbol = _operatorSymbol;

- (void)setOperandQueue:(NSMutableArray *)operandQueue
{
    _operandQueue = operandQueue;
}

- (NSMutableArray *)operandQueue
{
    if (_operandQueue == nil) _operandQueue = [[NSMutableArray alloc] init];
    return _operandQueue;
}

- (void)cleanBrain
{
    [self.operandQueue removeAllObjects];
}
-(void)pushOperand:(double)operand;
{
    [self.operandQueue addObject:[NSNumber numberWithDouble:operand]];
    //adds the number pressed in an array
}

-(double)popOperand
{
    NSNumber *operandObject = [self.operandQueue lastObject];
    if (operandObject) [self.operandQueue removeLastObject];
    return [operandObject doubleValue];
    //take the last number pressed
}

-(void)determineOperation:(NSString *)operatorFN
{
    _operatorSymbol = operatorFN;
      
    //i need to add the last operation pressed as a string in operator symbol
}

-(double)performOperation:(double)displayOperand
{
    //perform the operation requested stored in operatorSymbol with the last number in the Queue and the number currently on the display
    double result = 0;

    if ([_operatorSymbol isEqualToString:@"+"]) {
        result = [self popOperand] + displayOperand;
        NSLog(@"Operator passed = %@", _operatorSymbol);
    } else if ([_operatorSymbol isEqualToString:@"-"]) {
        result = [self popOperand] - displayOperand;
    } else if ([_operatorSymbol isEqualToString:@"*"]) {
        result = [self popOperand] * displayOperand;
    } else if ([_operatorSymbol isEqualToString:@"/"]) {
        result = [self popOperand] / displayOperand;
    }
    [self pushOperand:result];
    return result;
}

@end
