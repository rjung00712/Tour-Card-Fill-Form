//
//  ViewController.h
//  Tour Form Card
//
//  Created by Richard Chong on 3/2/18.
//  Copyright © 2018 Richard Chong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController<MFMailComposeViewControllerDelegate> {
    BOOL checked0;
    BOOL checked1;
    BOOL checked2;
    BOOL checked3;
    NSString *buttonImage;
}


@property (weak, nonatomic) IBOutlet UIButton *checkButton_0;
@property (weak, nonatomic) IBOutlet UIButton *checkButton_1;
@property (weak, nonatomic) IBOutlet UIButton *checkButton_2;
@property (weak, nonatomic) IBOutlet UIButton *checkButton_3;
- (IBAction)clickedCheckButton:(id)sender;

@end

