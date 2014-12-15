//
//  MovieCell.h
//  iMovieApp
//
//  Created by choushayne on 14/12/10.
//  Copyright (c) 2014年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MovieModel, RatingView;
@interface MovieCell : UITableViewCell{
@private
    UIImageView *_imgView;
    UILabel     *_titleLable;
    UILabel     *_yearLable;
    RatingView  *_ratingView;
    MovieModel  *_movieModel;
}

@property (nonatomic, retain) MovieModel *movieModel;

@end
