//
//  MovieCell.h
//  iMovieApp
//
//  Created by choushayne on 14/12/10.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell{
@private
    UIImageView *_imgView;
    UILabel     *_titleLable;
    UILabel     *_yearLable;
    UIView      *_ratingView;
}


@end
