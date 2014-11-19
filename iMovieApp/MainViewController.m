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

- (void)loadViewControllers;    //定义私有方法装载子视图控制器

- (void)customTabBarView;       //定义自定义tabbar私有方法

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"wrong";  //test
        self.tabBar.hidden = YES;   //隐藏系统自带tabBarView
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadViewControllers];     //装载子视图控制器
    
    [self customTabBarView];        //自定义tabBar视图
}


#pragma mark - Private Method
- (void)loadViewControllers{
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

- (void)customTabBarView{
    //自定义tabbar视图
    _tabBarBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-49, [UIScreen mainScreen].bounds.size.width, 49)];    //定位
    _tabBarBG.userInteractionEnabled = YES;     //启动图片交互
    _tabBarBG.image = [UIImage imageNamed:@"tab_bg_all"];   //设置背景图
    [self.view addSubview:_tabBarBG];       //添加到视图中
    
    //选中视图
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(5, _tabBarBG.height/2-45.0/2, 50, 45)];
    _selectView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [_tabBarBG addSubview:_selectView];
    
    // 整理数据
    NSArray *imgs   = @[@"movie_home", @"msg_new", @"start_top100", @"icon_cinema", @"more_setting"];
    NSArray *titles = @[@"电影", @"新闻", @"Top", @"影院", @"更多"];
    
    //设置不同视图的背景图及标题
    int x = 0;
    for (int index = 0; index < 5; index++) {
        UIImageView *item = [[UIImageView alloc] initWithFrame:CGRectMake(18+x, 10, 22, 22)];
        item.tag = index;
        item.contentMode = UIViewContentModeScaleAspectFit;     //默认为拉伸，改为适合（防止背景图变形）
        item.userInteractionEnabled = YES;
        item.image = [UIImage imageNamed:imgs[index]];          //不同视图的不同背景
        [_tabBarBG addSubview:item];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(item.left, item.bottom+2, item.width, 10)];
        title.text = titles[index];
        title.backgroundColor = [UIColor clearColor];       //去除lable的背景颜色
        title.textColor = [UIColor whiteColor];             //设置title的字体颜色
        title.font = [UIFont boldSystemFontOfSize:10];      //字号为10并加粗
        title.textAlignment = NSTextAlignmentCenter;        //文字居中
        [_tabBarBG addSubview:title];
        
        x += (item.width+43);
        
        //点击不同item即选中该视图
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(test:)];
        [item addGestureRecognizer:tap];
    }
}

- (void)test:(UITapGestureRecognizer *)tap{
    UIView *view = [tap view];
    [UIView beginAnimations:nil context:NULL];
    _selectView.frame = CGRectMake(5+65 * view.tag, _tabBarBG.height/2-45.0/2, 50, 45);
    [UIView commitAnimations];
    
    self.selectedIndex = view.tag;
}

#pragma mark - Memory
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
