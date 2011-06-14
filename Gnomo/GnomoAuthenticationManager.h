//
//  GnomoAuthenticationManager.h
//  Gnomo
//
//  Created by 小林 博久 on 11/06/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMOAuthAuthentication.h"


@protocol GnomoAuthenticationManagerDelegate <NSObject>

@required
- (void)authenticateTwitterResult:(BOOL)result;

@end


@interface GnomoAuthenticationManager : NSObject {
	UIViewController		*__parentView;
	GTMOAuthAuthentication	*__twitterAuthentication;

	id<GnomoAuthenticationManagerDelegate> __delegate;
}

@property (nonatomic, retain, readonly) GTMOAuthAuthentication *twitterAuthentication;
@property (nonatomic, assign) id<GnomoAuthenticationManagerDelegate> delegate;


+ (GnomoAuthenticationManager *)sharedManager;

- (BOOL)isAuthenticatedAnyService;
- (BOOL)isAuthenticatedTwitter;

- (void)authenticateTwitter:(UIViewController *)viewController;

@end
