//
//  ServiceSettingViewController.m
//  Gnomo
//
//  Created by Hirohisa Kobayasi on 11/06/06.
//  Copyright 2011 hogelab.net All rights reserved.
//

#import "ServiceSettingViewController.h"
#import "GTMOAuthAuthentication.h"
#import "GTMOAuthViewControllerTouch.h"
#import "GnomoOAuthSettings.h"


enum {
	kSectionTwitterSetting			= 0,
	kSectionMax
};


@interface ServiceSettingViewController ()

- (void)handleTwitterSetting;

- (void)viewController:(GTMOAuthViewControllerTouch *)viewController
      finishedWithAuth:(GTMOAuthAuthentication *)auth
                 error:(NSError *)error;

@end


@implementation ServiceSettingViewController

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
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.section) {
		case kSectionTwitterSetting:
			[self handleTwitterSetting];
			break;
	}
}

- (void)handleTwitterSetting
{
	GTMOAuthAuthentication *auth;
	auth = [[[GTMOAuthAuthentication alloc] initWithSignatureMethod:kGTMOAuthSignatureMethodHMAC_SHA1
                                                        consumerKey:cTwitterConsumerKey
                                                         privateKey:cTwitterConsumerSecret] autorelease];	
	auth.serviceProvider = cTwitterServiceName;
	auth.callback = cTwitterCallbackUrl;

	NSURL *requestUrl = [NSURL URLWithString:@"https://api.twitter.com/oauth/request_token"];
	NSURL *accessUrl = [NSURL URLWithString:@"https://api.twitter.com/oauth/access_token"];
	NSURL *authorizeUrl = [NSURL URLWithString:@"https://api.twitter.com/oauth/authorize"];
	NSString *scope = @"http://api.twitter.com/";

    GTMOAuthViewControllerTouch *vc = [[[GTMOAuthViewControllerTouch alloc] initWithScope:scope
																				 language:nil
																		  requestTokenURL:requestUrl
																		authorizeTokenURL:authorizeUrl
																		   accessTokenURL:accessUrl
																		   authentication:auth
																		   appServiceName:cTwitterApplicationName
																				 delegate:self
																		 finishedSelector:@selector(viewController:finishedWithAuth:error:)] autorelease];

    [self presentModalViewController:vc animated:YES];
}

- (void)viewController:(GTMOAuthViewControllerTouch *)viewController
      finishedWithAuth:(GTMOAuthAuthentication *)auth
                 error:(NSError *)error
{
	if (error != nil) {
		NSLog(@"Error:%@", [error description]);
	} else {
		NSLog(@"Success");
	}

	[self dismissModalViewControllerAnimated:YES];
}

@end
