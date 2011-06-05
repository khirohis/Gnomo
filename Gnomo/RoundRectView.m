//
//  RoundRectView.m
//  Callisto
//
//  Created by Hirohisa Kobayasi on 11/05/20.
//  Copyright 2011 hogelab.net All rights reserved.
//

#import "RoundRectView.h"


@interface RoundRectView ()

- (void)commonInit;

- (void)roundRectPathWithContect:(CGContextRef)context
					   frameRect:(CGRect)frame
						  radius:(CGFloat)radius;

@end


@implementation RoundRectView

@synthesize radius				= __radius;

@synthesize lineWidth			= __lineWidth;
@synthesize strokeColor			= __strokeColor;

@synthesize fill				= __fill;
@synthesize fillColor			= __fillColor;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self commonInit];
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
		[self commonInit];
    }

    return self;
}


- (void)dealloc
{
	[__strokeColor release];
	[__fillColor release];

    [super dealloc];
}


- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);

	[self roundRectPathWithContect:context frameRect:rect radius:self.radius];

	if (self.fill) {
		CGContextSetFillColorWithColor(context, self.fillColor.CGColor);
		CGContextDrawPath(context, kCGPathFill);
	} else {
		CGContextSetLineWidth(context, self.lineWidth);
		CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor);
		CGContextDrawPath(context, kCGPathStroke);
	}

	CGContextRestoreGState(context);
}

- (void)commonInit
{
	self.radius = 20.0;

	self.lineWidth = 1.0;
	self.strokeColor = [UIColor blackColor];

	self.fill = YES;
	self.fillColor = [UIColor blackColor];
}


- (void)roundRectPathWithContect:(CGContextRef)context
					   frameRect:(CGRect)frame
						  radius:(CGFloat)radius
{
	CGFloat minx = CGRectGetMinX(frame), midx = CGRectGetMidX(frame), maxx = CGRectGetMaxX(frame);
	CGFloat miny = CGRectGetMinY(frame), midy = CGRectGetMidY(frame), maxy = CGRectGetMaxY(frame);

	CGContextMoveToPoint(context, minx, midy);
	CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
	CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
	CGContextClosePath(context);
}

@end
