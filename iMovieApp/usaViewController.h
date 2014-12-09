//
//  USAViewController.h
//  iMovieApp
//
//  Created by choushayne on 14/11/19.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewExt.h"

@interface USAViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
@private
    UITableView *_listView;     //表视图
    UIView *_posterView;
    NSMutableArray *_subjectsArray;
}
@end
