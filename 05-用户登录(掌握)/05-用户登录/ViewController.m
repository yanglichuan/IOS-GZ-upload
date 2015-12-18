//
//  ViewController.m
//  05-用户登录
//
//  Created by apple on 15/1/20.
//  Copyright (c) 2015年 apple. All rights reserved.
/**
 GET和POST比较
 - url 
 GET:
     http://127.0.0.1/login.php?username=%@&password=%@
     1. http://127.0.0.1主机地址
     2. login.php是服务器负责登录的脚本（php，java）
     3. ? 后面的就是参数，是给服务器传递的参数
     参数的格式
     变量名＝值
     username＝@"zhangsan"
     4. & 如果是多个参数，通过这个进行连接。
    注意点： url不能包含中文或者空格及特殊符号， 如果有需要转义
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 
 POST: 
    只是一个单纯的资源路径(没有任何参数，因为参数都在数据体里)
 
 - request
    GET - 什么都不需要指定，因为默认的HTTPMethod 就是“GET”
    POST - 
        1. 需要指定HTTPMethod 是POST
        2. 指定了数据体的二进制.
        POST出现中文，也不需要转义，（系统帮我们实现了）
    *** POST的参数和GET在URL里的参数，格式是一样的。 只是没有 ？
 
 
 - Connection
    都一样
 
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  
    [self postLogin];
    
}
/**POST*/
- (void)postLogin
{
    
    // 1. url
    NSString *urlString = @"http://127.0.0.1/login.php";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 2. 可变的请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:1 timeoutInterval:2.0f];
    
    // 2.1 指定http的访问方法，服务器短才知道如何访问
    request.HTTPMethod = @"POST";
    
    // 2.2 指定数据体，数据体的内容可以从firebug里面直接拷贝
    // username=zhangsan&password=zhang
    NSString *username = @"张三";
    NSString *pwd = @"zhang";
    NSString *bobyStr = [NSString stringWithFormat:@"username=%@&password=%@", username, pwd];
    
    // 2.2.1 跟服务器的交互，全部传递的二进制
    request.HTTPBody = [bobyStr dataUsingEncoding:NSUTF8StringEncoding];
    
    // 3. 连接
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 反序列化
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        NSLog(@"%@", result);
    }];

}

- (void)getLogin
{
    /**
     GET
     http://127.0.0.1/login.php?username=%@&password=%@
     1. http://127.0.0.1主机地址
     2. login.php是服务器负责登录的脚本（php，java）
     3. ? 后面的就是参数，是给服务器传递的参数
     参数的格式
     变量名＝值
     username＝@"zhangsan"
     4. & 如果是多个参数，通过这个进行连接。
     */
    
    // 1. url
    NSString *username = @"张三";
    NSString *pwd = @"zhang";
    
    NSString *urlString = [NSString stringWithFormat:@"http://192.168.10.9/login.php?username=%@&password=%@",username, pwd];
    
    // url里面不能包含中文空格特殊符号
    // 如果有，需要百分号转义
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    // 2. 请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:1 timeoutInterval:2.0f];
    
    // 3. 连接
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 反序列化
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        NSLog(@"%@", result);
    }];
    

}

@end
