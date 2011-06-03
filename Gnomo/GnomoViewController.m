//
//  GnomoViewController.m
//  Gnomo
//
//  Created by 小林 博久 on 11/05/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GnomoViewController.h"


@implementation GnomoViewController

@synthesize tweetText				= __tweetText;
@synthesize inputAccessoryToolber	= __inputAccessoryToolbar;
@synthesize closeButton				= __closeButton;


- (void)dealloc
{
	[__tweetText release];
	[__inputAccessoryToolbar release];
	[__closeButton release];

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
}


- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


#pragma mark - Action handling

- (IBAction)handleCloseButton:(id)sender
{
	[self.tweetText resignFirstResponder];
}


#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
{
	[textView setInputAccessoryView:self.inputAccessoryToolber];

	return YES;
}


@end
