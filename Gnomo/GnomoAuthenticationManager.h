//
//  GnomoAuthenticationManager.h
//  Gnomo
//
//  Created by 小林 博久 on 11/06/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@class GTMOAuthAuthentication;

@interface GnomoAuthenticationManager : NSObject {
	GTMOAuthAuthentication *	__twitterAuthentication;
}

@property (nonatomic, retain, readonly) GTMOAuthAuthentication *twitterAuthentication;


+ (GnomoAuthenticationManager *)sharedManager;


@end
