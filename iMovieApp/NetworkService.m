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

+ (id)parserData:(NSString *)name{  //定义了name之后，即可将下方各数据中的path省略，直接在return中引入name参数，解除冗余
    NSString *resoucePath = [[NSBundle mainBundle] resourcePath];   //获取包路径
    NSString *path = [resoucePath stringByAppendingPathComponent:name]; //定义一个name替代原有路径path，name为json文件名,此时即可将原方法中的path参数换为name
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    id result = [data objectFromJSONData];  //使用jsonKit框架提供的解析方法，替代上面原生方法
    
    return result;
}//私有方法--数据解析

//测试数据解析
+ (id)testData{
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
//    NSLog(@"path: %@", path);
//    使用name传值，替代以上冗余部分
    
    return [self parserData:@"test.json"];
}

//北美票房数据解析
+ (id)northUSA{
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"NorthUSA" ofType:@"json"];
//    NSLog(@"path: %@", path);
//    使用name传值，替代以上冗余部分
    
    return [self parserData:@"NorthUSA.json"];
}

@end
