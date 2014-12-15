//
//  RatingView.m
//  RatingViewDemo
//
//  Created by choushayne on 14/12/12.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import "RatingView.h"

@implementation RatingView

#define kNormalWidth 35
#define kNormalHeight 33

#define kSmallWidth 15
#define kSmallHeight 14

#define kFullMark 10

#define kNormalFontSize 25
#define kSmallFontSize 12

- (void)drawRect:(CGRect)rect{

}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initGrayStarView];
        [self initYellowStarView];
        [self initRatingLabel];
    }
    return self;
}

- (void)initGrayStarView{
    _grayStarsArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    for (int index = 0; index < 5; index++) {
        UIImageView *grayStarView = [[UIImageView alloc] initWithFrame:CGRectZero];
        grayStarView.image = [UIImage imageNamed:@"gray"];
        [self addSubview:grayStarView];
        
        [_grayStarsArray addObject:grayStarView];
    }
}

- (void)initYellowStarView{
    _baseView = [[UIView alloc] initWithFrame:CGRectZero];
    _baseView.backgroundColor = [UIColor clearColor];
    _baseView.clipsToBounds = YES;
    [self addSubview:_baseView];
    
    _yellowStarsArray = [[NSMutableArray alloc] initWithCapacity:5];
    for (int index = 0; index < 5; index++) {
        UIImageView *yellowStarView = [[UIImageView alloc] initWithFrame:CGRectZero];
        yellowStarView.image = [UIImage imageNamed:@"yellow"];
        [_baseView addSubview:yellowStarView];
        
        [_yellowStarsArray addObject:yellowStarView];
    }
}

- (void)initRatingLabel{
    _ratingLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _ratingLabel.backgroundColor = [UIColor clearColor];
    _ratingLabel.textColor = [UIColor purpleColor];
    [self addSubview:_ratingLabel];
}

- (void)setRatingScore:(CGFloat)ratingScore
{
    _ratingScore = ratingScore;
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f", _ratingScore];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    int width = 0;
    for (int index = 0; index < 5; index++) {
        UIView *yellowStar = _yellowStarsArray[index];
        UIView *grayStar   = _grayStarsArray[index];
        
        if (self.style == kSmallStyle) {
            yellowStar.frame = CGRectMake(0+width, 0, kSmallWidth, kSmallHeight);
            grayStar.frame = CGRectMake(0+width, 0, kSmallWidth, kSmallHeight);
            width += kSmallWidth;
        }else {
            yellowStar.frame = CGRectMake(0+width, 0, kNormalWidth, kNormalHeight);
            grayStar.frame = CGRectMake(0+width, 0, kNormalWidth, kNormalHeight);
            width += kNormalWidth;
        }
    }
    
    float baseViewWidth = 0;
    baseViewWidth = self.ratingScore / kFullMark * width;
    
    float height = 0;
    if (self.style == kSmallStyle) {
        _baseView.frame = CGRectMake(0, 0, baseViewWidth, kSmallHeight);
        _ratingLabel.font = [UIFont boldSystemFontOfSize:kSmallFontSize];
        height = kSmallHeight;
    }else {
        _baseView.frame = CGRectMake(0, 0, baseViewWidth, kNormalHeight);
        _ratingLabel.font = [UIFont boldSystemFontOfSize:kNormalFontSize];
        height = kNormalHeight;
    }
    
    _ratingLabel.frame = CGRectMake(width, 0, 0, 0);
    [_ratingLabel sizeToFit];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width+_ratingLabel.frame.size.width, height);
}

@end
