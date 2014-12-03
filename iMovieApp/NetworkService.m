//
//  NetworkService.m
//  iMovieApp
//
//  Created by choushayne on 14/12/3.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import "NetworkService.h"
#import "JSONKit.h"

@implementation NetworkService

//测试数据解析
+ (id)testData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    NSLog(@"path: %@", path);
    
    NSData *data = [NSData dataWithContentsOfFile:path];
//    NSString *version = [[UIDevice currentDevice] systemVersion];
    
//    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    id result = [data objectFromJSONData];  //使用jsonKit框架提供的解析方法，替代上面原生方法
    
    return result;
}

//北美票房数据解析
+ (id)northUSA{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NorthUSA" ofType:@"json"];
    NSLog(@"path: %@", path);
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    //    NSString *version = [[UIDevice currentDevice] systemVersion];
    
    //    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    id result = [data objectFromJSONData];  //使用jsonKit框架提供的解析方法，替代上面原生方法
    
    return result;
}

@end
