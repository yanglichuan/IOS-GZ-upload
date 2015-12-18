//
//  ViewController.m
//  04-XML解析(DOM)(知道)
//
//  Created by apple on 15/1/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"
#import "Video.h"

@interface ViewController ()

/**所有数据的容器*/
@property(nonatomic,strong)NSMutableArray *videos;

@end

@implementation ViewController

- (NSMutableArray *)videos
{
    if (_videos == nil) {
        _videos = [NSMutableArray array];
    }
    return _videos;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://192.168.10.9/videos.xml"];
    
    // 2. 请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:1 timeoutInterval:2.0f];
    
    // 3. 连接
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 将XML整个读入内存, 对应的就是GDataXMLDocument对象
        GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:data error:NULL];
        
//        NSLog(@"%@", document.rootElement.children);// document.rootElement.children--》videos
        
        
        for (GDataXMLElement *element in document.rootElement.children) {
            
//            NSLog(@"---->%@", element); // ---> 对应的是video对象
            // 创建video对象
            Video *video = [[Video alloc] init];
    
            // 这个遍历就是取出Video对应的所有属性值
            for (GDataXMLElement *node in element.children) {
//                NSLog(@"＝＝＝>%@ ---> %@", node.name, node.stringValue);
                // 在这里给给对象赋值
                [video setValue:node.stringValue forKeyPath:node.name];
            }
            
            // 跟踪attributes
//            NSLog(@"%@", element.attributes);
            // 遍历element.attributes数组，拿到属性值
            for (GDataXMLNode *att in element.attributes) {
                
//                NSLog(@"att.name = %@ att.stringValue = %@", att.name, att.stringValue);
                
                // kvc
                [video setValue:att.stringValue forKeyPath:att.name];
            }
            
            // 模型添加到数组
            [self.videos addObject:video];
        }
        
        NSLog(@"搞定 %@", self.videos);
        
    }];
}

@end
