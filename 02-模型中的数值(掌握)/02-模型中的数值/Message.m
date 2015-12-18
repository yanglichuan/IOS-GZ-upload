//
//  Message.m
//  02-模型中的数值
//
//  Created by apple on 15/1/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "Message.h"

@implementation Message

//重写
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> {messageId: %@, message: %@}", self.class, self, _id, _message];
}

@end
