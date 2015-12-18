//
//  Message.h
//  02-模型中的数值
//
//  Created by apple on 15/1/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

// [<Message 0x7fb7a37834b0> setNilValueForKey]: could not set nil as the value for the key messageId.'
//@property(nonatomic,assign) int messageId;
// 使用NSNumber 防止服务器端返回null，我们kvc赋值的时候 崩溃
//@property(nonatomic,copy) NSNumber *messageId;

@property(nonatomic,copy) NSNumber *id;

@property(nonatomic,copy) NSString *message;

@end
