//
//  MovieCell.m
//  iMovieApp
//
//  Created by choushayne on 14/12/10.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import "MovieCell.h"
#import "UIViewExt.h"

@implementation MovieCell

//- (void)awakeFromNib {
//    // Initialization code
//    [super awakeFromNib];
//    [self initSubviews];
//}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initSubviews];
        
        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    return self;
}

- (void)initSubviews{
    //图片
    _imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imgView.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_imgView];
    
    //标题
    _titleLable = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLable.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_titleLable];
    
    //副标题
    _yearLable = [[UILabel alloc] initWithFrame:CGRectZero];
    _yearLable.backgroundColor = [UIColor purpleColor];
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
//    [super layoutSubviews];
    
    _imgView.frame = CGRectMake(10, 10, 40, 60);
    _titleLable.frame = CGRectMake(_imgView.right+10, 10, 220, 30);
    _yearLable.frame = CGRectMake(_titleLable.left, _titleLable.bottom, _titleLable.width/2, 30);
    _ratingView.frame = CGRectMake(_yearLable.left, _titleLable.bottom, _yearLable.width, 30);
}

@end
