//
//  GnomoAuthenticationManager.m
//  Gnomo
//
//  Created by 小林 博久 on 11/06/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GnomoAuthenticationManager.h"
#import "GTMOAuthViewControllerTouch.h"
#import "GnomoOAuthSettings.h"


static GnomoAuthenticationManager *sGnomoAuthenticationManager	= nil;


@interface GnomoAuthenticationManager ()

@property (nonatomic, retain) UIViewController *parentView;
@property (nonatomic, retain, readwrite) GTMOAuthAuthentication *twitterAuthentication;

- (GTMOAuthAuthentication *)createTwitterAuthentication;

@end


@implementation GnomoAuthenticationManager

@synthesize parentView			= __parentView;
@synthesize twitterAuthentication = __twitterAuthentication;
@synthesize delegate			= __delegate;


+ (GnomoAuthenticationManager *)sharedManager
{
	if (sGnomoAuthenticationManager == nil) {
		sGnomoAuthenticationManager = [[GnomoAuthenticationManager alloc] init];
	}

	return sGnomoAuthenticationManager;
}


- (id)init
{
	self = [super init];
	if (self) {
	}

	return self;
}

- (void)dealloc
{
	[__parentView release];
	[__twitterAuthentication release];

	[super dealloc];
}


- (GTMOAuthAuthentication *)twitterAuthentication
{
	if (__twitterAuthentication == nil) {
		__twitterAuthentication = [self createTwitterAuthentication];
	}

	return __twitterAuthentication;
}


- (BOOL)isAuthenticatedAnyService
{
	if ([self isAuthenticatedTwitter]) {
		return YES;
	}

	return NO;
}

- (BOOL)isAuthenticatedTwitter
{
	GTMOAuthAuthentication *auth = self.twitterAuthentication;
	return [GTMOAuthViewControllerTouch authorizeFromKeychainForName:cTwitterApplicationName
													  authentication:auth];
}


- (void)authenticateTwitter:(UIViewController *)viewController
{
	GnomoAuthenticationManager *manager = [GnomoAuthenticationManager sharedManager];
	GTMOAuthAuthentication *auth = [manager twitterAuthentication];

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

	self.parentView = viewController;
    [self.parentView presentModalViewController:vc animated:YES];
}


#pragma mark - private methods

- (GTMOAuthAuthentication *)createTwitterAuthentication
{
	GTMOAuthAuthentication *auth = [[[GTMOAuthAuthentication alloc] initWithSignatureMethod:kGTMOAuthSignatureMethodHMAC_SHA1
																				consumerKey:cTwitterConsumerKey
																				 privateKey:cTwitterConsumerSecret] autorelease];
	auth.serviceProvider = cTwitterServiceName;
	auth.callback = cTwitterCallbackUrl;

	return auth;
}


- (void)viewController:(GTMOAuthViewControllerTouch *)viewController
      finishedWithAuth:(GTMOAuthAuthentication *)auth
                 error:(NSError *)error
{
	BOOL	result = YES;

	if (error) {
		NSLog(@"Error:%@", [error description]);
		result = NO;
	}

	if ([self.delegate respondsToSelector:@selector(authenticateTwitterResult:)]) {
		[self.delegate authenticateTwitterResult:result];
	}

	[self.parentView dismissModalViewControllerAnimated:YES];
}


@end
