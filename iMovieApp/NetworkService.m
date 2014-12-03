//
//  NetworkService.m
//  iMovieApp
//
//  Created by choushayne on 14/12/3.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import "NetworkService.h"

@implementation NetworkService

//测试数据
+ (id)testData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    NSLog(@"path: %@", path);
    return nil;
}

@end
