//
//  USAViewController.h
//  iMovieApp
//
//  Created by choushayne on 14/11/19.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewExt.h"

@interface USAViewController : UIViewController{
@private
    UITableView *_listView;
    UIView *_posterView;
    NSMutableArray *_subjectsArray;
}
@end
