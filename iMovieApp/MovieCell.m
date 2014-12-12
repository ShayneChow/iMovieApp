//
//  MovieCell.m
//  iMovieApp
//
//  Created by choushayne on 14/12/10.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import "MovieCell.h"
#import "UIViewExt.h"
#import "MovieModel.h"
#import "UIImageView+WebCache.h"

@implementation MovieCell

- (void)awakeFromNib {
    // Initialization code
//    [super awakeFromNib];
//    [self initSubviews];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initSubviews];
        
//        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    return self;
}

- (void)initSubviews{
    //图片
    _imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imgView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_imgView];
    
    //标题
    _titleLable = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLable.backgroundColor = [UIColor clearColor];
    _titleLable.textColor = [UIColor orangeColor];
    _titleLable.font = [UIFont boldSystemFontOfSize:18];
    [self.contentView addSubview:_titleLable];
    
    //副标题
    _yearLable = [[UILabel alloc] initWithFrame:CGRectZero];
    _yearLable.backgroundColor = [UIColor clearColor];
    _yearLable.textColor = [UIColor whiteColor];
    _yearLable.font = [UIFont boldSystemFontOfSize:16];
    [self.contentView addSubview:_yearLable];
    
    //评级
    _ratingView = [[UIView alloc] initWithFrame:CGRectZero];
    _ratingView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_ratingView];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //取出数据
    NSDictionary *contentDic = self.movieModel.subject;     //这里需要引用 MovieModel.h
    
    //单元格布局
    _imgView.frame = CGRectMake(10, 10, 40, 60);
    NSString *imgURL = [[contentDic objectForKey:@"images"] objectForKey:@"medium"];
//    //同步请求，造成卡顿
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
//    _imgView.image = [UIImage imageWithData:data];
    [_imgView setImageWithURL:[NSURL URLWithString:imgURL]];//异步图片+缓存
    
    _titleLable.frame = CGRectMake(_imgView.right+10, 10, 220, 30);
    _titleLable.text = [contentDic objectForKey:@"title"];  //输出标题
    
    _yearLable.frame = CGRectMake(_titleLable.left, _titleLable.bottom, _titleLable.width/2, 30);
    _yearLable.text = [NSString stringWithFormat:@"年份：%@",[contentDic objectForKey:@"year"]];  //输出发行年份
    
    _ratingView.frame = CGRectMake(_yearLable.right, _titleLable.bottom, _yearLable.width, 30);

}

@end
