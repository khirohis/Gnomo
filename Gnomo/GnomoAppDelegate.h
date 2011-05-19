//
//  GnomoAppDelegate.h
//  Gnomo
//
//  Created by 小林 博久 on 11/05/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GnomoViewController;

@interface GnomoAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet GnomoViewController *viewController;

@end
