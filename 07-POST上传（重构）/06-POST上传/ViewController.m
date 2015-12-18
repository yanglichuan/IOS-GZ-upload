//
//  ViewController.m
//  06-POST上传
//
//  Created by apple on 15/1/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableURLRequest+Multipart.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self postUpLoad];
}

- (void)postUpLoad {
    
    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/post/upload.php"];
    
    // 2. post请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url andLoaclFilePath:[[NSBundle mainBundle] pathForResource:@"001.png" ofType:nil] andFileName:@"123456.png"];
    
    
    // 3. 连接
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 反序列化处理
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        NSLog(@"result = %@", result);
    }];
}

@end
