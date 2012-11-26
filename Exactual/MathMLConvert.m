//
//  MathMLConvert.m
//  Exactual
//
//  Created by Zinon Kyprianou on 26/11/2012.
//  Copyright (c) 2012 Zinon Kyprianou. All rights reserved.
//

#import "MathMLConvert.h"

@interface MathMLConvert()
@property (nonatomic,strong) NSMutableArray *operandQueue;
@property (nonatomic,strong) NSString *operatorSymbol;

@end

@implementation MathMLConvert

-(NSString *)convertMML:(NSString *)expressionIn
{
    return expressionIn;
}

@end
