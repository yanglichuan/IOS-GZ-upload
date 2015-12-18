//
//  ViewController.m
//  02-模型中的数值
//
//  Created by apple on 15/1/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
    
    NSURLRequest *reque = [NSURLRequest requestWithURL:url cachePolicy:1 timeoutInterval:5.0f];
    
    [NSURLConnection sendAsynchronousRequest:reque queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSLog(@"%@", [NSThread currentThread]);
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        NSLog(@"%@", result);
        
        
        //  创建模型
        Message *mes = [[Message alloc] init];
        
        [mes setValuesForKeysWithDictionary:result];
        
        NSLog(@"mes = %@", mes);
        
    }];
    
}

@end
