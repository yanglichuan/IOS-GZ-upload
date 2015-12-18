//
//  ViewController.m
//  03-Log的技巧
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


    NSArray *array = @[@"张三", @"lisi", @"123"];
    
    NSLog(@"%@", array);
    
//    for (NSString *str in array) {
//        NSLog(@"%@", str);
//    }
}


@end
