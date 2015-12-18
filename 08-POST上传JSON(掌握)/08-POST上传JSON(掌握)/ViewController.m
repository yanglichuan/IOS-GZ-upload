//
//  ViewController.m
//  08-POST上传JSON(掌握)
//
//  Created by apple on 15/1/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/post/postjson.php"];
    
    // 2. POST请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:1 timeoutInterval:2.0f];
    
    // 2.1 设置hTTP方法
    request.HTTPMethod = @"POST";
    
    // 2.2 上传json类型数据 (本质就是一个字符串，特殊的字符串)
    // 序列化，将NSArray/NSDictionary转成 特殊数据类型 的二进制数据
    // 反序列化, 将服务器返回的二进制转成NSArray/NSDictionary
    
    NSDictionary *dict1 = @{@"name" : @"xiaofang", @"age" : @"18"};
    NSDictionary *dict2 = @{@"name" : @"xiaosan", @"age" : @(108)};
    NSArray *arrray = @[dict1, dict2];
    
/**
 - Top level object is an NSArray or NSDictionary
    顶级节点是字典或者数组
 - All objects are NSString, NSNumber, NSArray, NSDictionary, or NSNull
    所有的对象是 NSString, NSNumber, NSArray, NSDictionary, or NSNull
 - All dictionary keys are NSStrings
    所有字典的key 是 NSString
 - NSNumbers are not NaN or infinity
   NSNumbers必须指定，不能是无穷大
 
 + (BOOL)isValidJSONObject:(id)obj;
 用来检验给定的对象是否能够被序列化
 */
    
    id obj = @"123eiufhjasdio";
    
    // 检验给定的对象是否能够被序列化
    if (![NSJSONSerialization isValidJSONObject:arrray]) {
        NSLog(@"格式不正确，不能被序列化");
        return;
    }
    
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:arrray options:0 error:NULL];
    
    
    // 3. 连接
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 返回的二进制数据
        id result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"result = %@", result);
        
    }];
}

- (void)test
{
    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/post/postjson.php"];
    
    // 2. POST请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:1 timeoutInterval:2.0f];
    
    // 2.1 设置hTTP方法
    request.HTTPMethod = @"POST";
    
    // 2.2 上传json类型数据 (本质就是一个字符串，特殊的字符串)
    NSString *str = @"{\"username\" : \"xiaofang\",\"age\" : \"18\"}";
    
    request.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    
    // 3. 连接
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 返回的二进制数据
        id result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"result = %@", result);
        
    }];
}

@end
