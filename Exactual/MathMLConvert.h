//
//  MathMLConvert.h
//  Exactual
//
//  Created by Zinon Kyprianou on 26/11/2012.
//  Copyright (c) 2012 Zinon Kyprianou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathMLConvert : NSObject

- (NSString *)convertMML:(NSString *)expressionIn;
- (void)pushKey:(NSString *)keyPushed;

@end
