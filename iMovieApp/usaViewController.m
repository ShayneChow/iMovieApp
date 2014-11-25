//
//  USAViewController.m
//  iMovieApp
//
//  Created by choushayne on 14/11/19.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import "USAViewController.h"
#import "ItemView.h"
#define kPosterItemTag 101
#define kListItemTag   102

@interface USAViewController ()

//加载表视图私有方法
- (void)loadListView;

//加载海报视图私有方法
- (void)loadPosterView;

//添加NavigationItem
- (void)loadNavigationItem;

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
    [self loadNavigationItem];//加载NavigationItem
    
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


- (void)loadNavigationItem{
    //加载NavigationItem
    UIImageView *itemBaseView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 25)];
    itemBaseView.userInteractionEnabled = YES;  //打开交互
    itemBaseView.image = [UIImage imageNamed:@"exchange_bg_home"];
    
    //给基视图添加单击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeBrowseMode)];//添加一个手势识别器
    [itemBaseView addGestureRecognizer:tap];
    
    UIImageView *posterItem = [[UIImageView alloc] initWithFrame:CGRectMake(itemBaseView.width/2-22.0/2, itemBaseView.height/2-15.0/2, 23, 14)];   //定义海报视图Item
    posterItem.tag = kPosterItemTag;
    posterItem.hidden = YES;
    posterItem.image = [UIImage imageNamed:@"poster_home"];     //指定海报视图图标
    UIImageView *listItem = [[UIImageView alloc] initWithFrame:CGRectMake(itemBaseView.width/2-23.0/2, itemBaseView.height/2-7, 23, 14)];     //定义列表视图Item
    listItem.tag = kListItemTag;
    listItem.image = [UIImage imageNamed:@"list_home"];     //指定列表视图图标
    //将2个视图分别加载
    [itemBaseView addSubview:posterItem];
    [itemBaseView addSubview:listItem];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:itemBaseView];
    self.navigationItem.rightBarButtonItem = rightItem ;    //将rightItem赋值给系统的navigationItem.rightBarButtonItem（固定位置）
}//添加NavigationItem

#pragma mark - Actions Method
- (void)changeBrowseMode{
    //获得itemBaseView
    UIView *baseItenView = [self.navigationItem.rightBarButtonItem customView];
    
    UIView *posterItem = [baseItenView viewWithTag:kPosterItemTag];
    UIView *listItem   = [baseItenView viewWithTag:kListItemTag];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [baseItenView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    if (posterItem.hidden) {
        posterItem.hidden = NO;
        listItem.hidden = YES;
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:baseItenView cache:YES];
    }else{
        posterItem.hidden = YES;
        listItem.hidden = NO;
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:baseItenView cache:YES];
    }
    [UIView commitAnimations];
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if (self.view.window) {
        self.view = nil;
    }//将视图控制器中的强引用释放
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
