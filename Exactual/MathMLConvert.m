//
//  MathMLConvert.m
//  Exactual
//
//  Created by Zinon Kyprianou on 26/11/2012.
//  Copyright (c) 2012 Zinon Kyprianou. All rights reserved.
//

/*
 
 VALID KEYPRESSES
 
 0 - 9
 ( ) sin(x) cos(x) tan(x) log(x) log2(x) log10(x) ln(x)
 % all operator symbols
 at / create a fraction
 
 x! pi
 sqrt
 
 
 
 */

#import "MathMLConvert.h"

@interface MathMLConvert()
@property (nonatomic,strong) NSString *expressionBuilder;

@end

@implementation MathMLConvert

-(NSString *)stackToExpression:(NSMutableArray *)programStack
{
    
    
}

-(NSString *)convertMML:(NSString *)expressionIn
{
 
    return expressionIn;
}

@end
