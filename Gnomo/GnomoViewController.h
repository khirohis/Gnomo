//
//  GnomoViewController.h
//  Gnomo
//
//  Created by Hirohisa Kobayasi on 11/05/19.
//  Copyright 2011 hogelab.net All rights reserved.
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


- (IBAction)handleSend:(id)sender;
- (IBAction)handleSetting:(id)sender;
- (IBAction)handleCloseButton:(id)sender;

@end
