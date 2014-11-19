//
//  USAViewController.m
//  iMovieApp
//
//  Created by choushayne on 14/11/19.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import "USAViewController.h"

@interface USAViewController ()

@end

@implementation USAViewController

#pragma mark - ViewController-life
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"北美榜";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if (self.view.window) {
        self.view = nil;
    }//将试图控制器中的强引用释放
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
