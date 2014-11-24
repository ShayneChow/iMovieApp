//
//  USAViewController.m
//  iMovieApp
//
//  Created by choushayne on 14/11/19.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import "USAViewController.h"

@interface USAViewController ()

//加载表视图
- (void)loadListView;

//加载海报视图
- (void)loadPosterView;

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

- (void)loadView{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
    
    [self loadListView];    //加载表视图
    [self loadPosterView];  //加载海报视图
    //加载NavigationItem
    UIView *itemBaseView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 55, 40)];
//    UIImageView *
    itemBaseView.backgroundColor = [UIColor redColor];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:itemBaseView];
//    self.navigationItem.rightBarButtonItem = [rightItem autorelease];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

#pragma mark - Private Method
- (void)loadListView{
    int kDeviceHeight = [UIScreen mainScreen].bounds.size.height;
    int kDeviceWidth = [UIScreen mainScreen].bounds.size.width;
    _listView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHeight-20-44-49) style:UITableViewStylePlain];
    [self.view addSubview:_listView];
}//加载表视图

- (void)loadPosterView{
    int kDeviceHeight = [UIScreen mainScreen].bounds.size.height;
    int kDeviceWidth = [UIScreen mainScreen].bounds.size.width;
    _posterView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHeight-20-44-49)];
    _posterView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_posterView];
}//加载海报视图

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
