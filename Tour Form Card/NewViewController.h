//
//  NewViewController.h
//  Tour Form Card
//
//  Created by Richard Chong on 3/2/18.
//  Copyright © 2018 Richard Chong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
//#import <MessageUI/MFMailComposeViewController.h>

@interface NewViewController : UIViewController<MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) UIImage *imageFromFirstView;
@end
