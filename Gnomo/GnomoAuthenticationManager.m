//
//  GnomoAuthenticationManager.m
//  Gnomo
//
//  Created by 小林 博久 on 11/06/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GnomoAuthenticationManager.h"
#import "GTMOAuthAuthentication.h"
#import "GnomoOAuthSettings.h"


static GnomoAuthenticationManager *sGnomoAuthenticationManager	= nil;


@interface GnomoAuthenticationManager ()

@property (nonatomic, retain, readwrite) GTMOAuthAuthentication *twitterAuthentication;

- (GTMOAuthAuthentication *)createTwitterAuthentication;

@end


@implementation GnomoAuthenticationManager

@synthesize twitterAuthentication	= __twitterAuthentication;


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


@end
