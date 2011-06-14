//
//  ServiceSettingViewController.h
//  Gnomo
//
//  Created by Hirohisa Kobayasi on 11/06/06.
//  Copyright 2011 hogelab.net All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GnomoAuthenticationManager.h"


@interface ServiceSettingViewController : UITableViewController <GnomoAuthenticationManagerDelegate> {
	BOOL			__authenticatedTwitter;
}

@end
