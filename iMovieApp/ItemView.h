//
//  ItemView.h
//  iMovieApp
//
//  Created by choushayne on 14/11/20.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewExt.h"

@class ItemView;
@protocol ItemViewDelegate <NSObject>

@optional
- (void)didItemView:(ItemView *)itemView atIndex:(NSInteger)index;  //index = tag

@end

@interface ItemView : UIView{
@private
    UIImageView *_item;
    UILabel *_title;
    id <ItemViewDelegate> delegate;
}

//公开两个私有变量供本类调用
@property (nonatomic, readonly) UIImageView *item;
@property (nonatomic, readonly) UILabel *title;
@property (nonatomic, assign) id <ItemViewDelegate> _delegate;

@end
