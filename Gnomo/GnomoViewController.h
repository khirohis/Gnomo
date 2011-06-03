//
//  GnomoViewController.h
//  Gnomo
//
//  Created by 小林 博久 on 11/05/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GnomoViewController : UIViewController <UITextViewDelegate> {
	UITextView			*__tweetText;
    UIToolbar			*__inputAccessoryToolbar;
	UIBarButtonItem		*__closeButton;
}

@property (nonatomic, retain) IBOutlet UITextView *tweetText;
@property (nonatomic, retain) IBOutlet UIToolbar *inputAccessoryToolber;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *closeButton;


- (IBAction)handleCloseButton:(id)sender;

@end
