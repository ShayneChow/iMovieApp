//
//  MainViewController.h
//  iMovieApp
//
//  Created by choushayne on 14/11/19.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewExt.h"
#import "ItemView.h"

@interface MainViewController : UITabBarController<ItemViewDelegate>{
@private
    UIImageView *_tabBarBG;
    UIImageView *_selectView;
}
@end
