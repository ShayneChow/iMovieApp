//
//  MainViewController.m
//  iMovieApp
//
//  Created by choushayne on 14/11/19.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import "MainViewController.h"
#import "USAViewController.h"
#import "NewsViewController.h"
#import "TopViewController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"
#import "BaseNavigationController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //北美视图
    USAViewController *usaViewController = [[USAViewController alloc] init];
    BaseNavigationController *usaNavigation = [[BaseNavigationController alloc] initWithRootViewController:usaViewController];
    
    //新闻视图
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    BaseNavigationController *newsNavigation = [[BaseNavigationController alloc] initWithRootViewController:newsViewController];
    
    //Top100
    TopViewController *topViewController = [[TopViewController alloc] init];
    BaseNavigationController *topNavigation = [[BaseNavigationController alloc] initWithRootViewController:topViewController];
    
    //影院视图
    CinemaViewController *cinemaViewController = [[CinemaViewController alloc] init];
    BaseNavigationController *cinemaNavigation = [[BaseNavigationController alloc] initWithRootViewController:cinemaViewController];

    //更多选项
    MoreViewController *moreViewController = [[MoreViewController alloc] init];
    BaseNavigationController *moreNavigation = [[BaseNavigationController alloc] initWithRootViewController:moreViewController];
    
    //创建数组，将以上视图的导航控制器添加到导航栏中
    NSArray *viewControllers = @[usaNavigation, newsNavigation, topNavigation, cinemaNavigation, moreNavigation];
    [self setViewControllers:viewControllers animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
