//
//  OverlapViewController.m
//  Callisto
//
//  Created by Hirohisa Kobayasi on 11/05/20.
//  Copyright 2011 hogelab.net All rights reserved.
//

#import "OverlapViewController.h"
#import "RoundRectView.h"


@interface OverlapViewController ()
- (void)animationFinished:(NSString*)animationID
				 finished:(BOOL)finished
				  context:(void*)context;
@end


@implementation OverlapViewController

@synthesize saveAlpha			= __saveAlpha;
@synthesize roundRectView		= __roundRectView;
@synthesize	indicator			= __indicator;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }

    return self;
}

- (void)dealloc
{
	[__roundRectView release];
	[__indicator release];

    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.roundRectView.radius = 16.0;
	UIColor *rectColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
	self.roundRectView.fillColor = rectColor;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	[self startIndicator];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];

	[self stopIndicator];
}

- (void)presentOverlapView
{
	self.saveAlpha = self.view.alpha;

	self.view.alpha = 0.0;
	UIWindow*	window = [UIApplication sharedApplication].keyWindow;
	[window addSubview:self.view];

	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	self.view.alpha = self.saveAlpha;
	[UIView commitAnimations];
}

- (void)dismissOverlapView
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
	[UIView setAnimationDuration:0.3];
	self.view.alpha = 0.0;
	[UIView commitAnimations];
}


- (void)animationFinished:(NSString*)animationID finished:(BOOL)finished context:(void*)context
{
	[self.view removeFromSuperview];
	self.view.alpha = self.saveAlpha;
}


- (void)startIndicator
{
	[self.indicator startAnimating];
}

- (void)stopIndicator
{
	[self.indicator stopAnimating];
}


@end
