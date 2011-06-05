//
//  OverlapViewController.h
//  Callisto
//
//  Created by Hirohisa Kobayasi on 11/05/20.
//  Copyright 2011 hogelab.net All rights reserved.
//

#import <UIKit/UIKit.h>


@class RoundRectView;

@interface OverlapViewController : UIViewController {

@private
	CGFloat					__saveAlpha;
	RoundRectView			*__roundRectView;
	UIActivityIndicatorView *__indicator;
}

@property (nonatomic, assign) CGFloat			saveAlpha;
@property (nonatomic, retain) IBOutlet RoundRectView *roundRectView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *indicator;

- (void)presentOverlapView;
- (void)dismissOverlapView;

- (void)startIndicator;
- (void)stopIndicator;

@end
