//
//  ServiceSettingViewController.m
//  Gnomo
//
//  Created by Hirohisa Kobayasi on 11/06/06.
//  Copyright 2011 hogelab.net All rights reserved.
//

#import "ServiceSettingViewController.h"
#import "GnomoAuthenticationManager.h"


enum {
	kSectionTwitterSetting			= 0,
	kSectionMax
};


@interface ServiceSettingViewController ()

@property (nonatomic, assign) BOOL		authenticatedTwitter;

- (void)handleTwitterSetting;

@end


@implementation ServiceSettingViewController

@synthesize authenticatedTwitter		= __authenticatedTwitter;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
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

	GnomoAuthenticationManager *manager = [GnomoAuthenticationManager sharedManager];
	self.authenticatedTwitter = [manager isAuthenticatedTwitter];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return kSectionMax;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSInteger rows = 0;

	switch (section) {
		case kSectionTwitterSetting:
			rows = 1;
			break;
	}

    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	switch (indexPath.section) {
		case kSectionTwitterSetting:
			cell.textLabel.text = @"Twitter Setting";
			break;
	}
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.section) {
		case kSectionTwitterSetting:
			[self handleTwitterSetting];
			break;
	}
}


#pragma mark - GnomoAuthenticationManager delegate

- (void)authenticateTwitterResult:(BOOL)result
{
	if (self.authenticatedTwitter != result) {
		self.authenticatedTwitter = result;
		[self.tableView reloadData];
	}
}


#pragma mark - private methods

- (void)handleTwitterSetting
{
	GnomoAuthenticationManager *manager = [GnomoAuthenticationManager sharedManager];
	[manager authenticateTwitter:self];
}


@end
