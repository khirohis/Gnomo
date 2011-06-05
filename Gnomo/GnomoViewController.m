//
//  GnomoViewController.m
//  Gnomo
//
//  Created by Hirohisa Kobayasi on 11/05/19.
//  Copyright 2011 hogelab.net All rights reserved.
//

#import "GnomoViewController.h"
#import "ServiceSettingViewController.h"


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

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];

	ServiceSettingViewController *controller = [[[ServiceSettingViewController alloc] initWithNibName:@"ServiceSettingViewController" bundle:nil] autorelease];
	[self presentModalViewController:controller animated:YES];
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
