//
//  RatingView.h
//  RatingViewDemo
//
//  Created by choushayne on 14/12/12.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum kRatingViewStyle {
    kSmallStyle  = 0,
    kNormalStyle = 1
}kRatingViewStyle;

@interface RatingView : UIView{
@private
    UIView  *_baseView;
    UILabel *_ratingLabel;
    NSMutableArray *_yellowStarsArray;
    NSMutableArray *_grayStarsArray;
    CGFloat         _ratingScore;
}

@property (nonatomic, assign) kRatingViewStyle style;
@property (nonatomic, assign) CGFloat ratingScore;

@end