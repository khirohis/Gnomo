//
//  RoundRectView.h
//  Callisto
//
//  Created by Hirohisa Kobayasi on 11/05/20.
//  Copyright 2011 hogelab.net All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RoundRectView : UIView {

@private
	CGFloat			__radius;

	CGFloat			__lineWidth;
    UIColor			*__strokeColor;

	BOOL			__fill;
	UIColor			*__fillColor;
}


@property (nonatomic, assign) CGFloat			radius;

@property (nonatomic, assign) CGFloat			lineWidth;
@property (nonatomic, retain) UIColor			*strokeColor;

@property (nonatomic, assign) BOOL				fill;
@property (nonatomic, retain) UIColor			*fillColor;

@end
