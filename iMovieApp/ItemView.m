//
//  ItemView.m
//  iMovieApp
//
//  Created by choushayne on 14/11/20.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import "ItemView.h"

@implementation ItemView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
        [self addGesture];
    }
    return self;
}

- (void)initSubviews{
    _item = [[UIImageView alloc] initWithFrame:CGRectMake(self.width/2.0-11, 5, 22, 22)];   //CGRectMake(18+x, 10, 22, 22)
    _item.contentMode = UIViewContentModeScaleAspectFit;     //默认为拉伸，改为适合（防止背景图变形）
    _item.userInteractionEnabled = YES;
    [self addSubview:_item];
    
    _title = [[UILabel alloc] initWithFrame:CGRectMake(0, _item.bottom+5, self.width, 10)];
    _title.backgroundColor = [UIColor clearColor];       //去除lable的背景颜色
    _title.textColor = [UIColor whiteColor];             //设置title的字体颜色
    _title.font = [UIFont boldSystemFontOfSize:10];      //字号为10并加粗
    _title.textAlignment = NSTextAlignmentCenter;        //文字居中
    [self addSubview:_title];

}

- (void)addGesture{
    //点击不同item即选中该视图
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didItemView:)];
    [self addGestureRecognizer:tap];
}

- (void)didItemView:(UITapGestureRecognizer *)tap{
    if ([self._delegate respondsToSelector:@selector(didItemView:atIndex:)]) {        
        [self._delegate didItemView:self atIndex:self.tag];
    }
}

@end
