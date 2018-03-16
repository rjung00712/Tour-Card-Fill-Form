//
//  ViewController.m
//  Tour Form Card
//
//  Created by Richard Chong on 3/2/18.
//  Copyright © 2018 Richard Chong. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *viewToBeConverted;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.viewToBeConverted setAutoresizesSubviews:YES];
    
    checked0 = NO;
    checked1 = NO;
    checked2 = NO;
    checked3 = NO;
    buttonImage = @"Black_check.png";
    file = @"Tour Card.png";
    emailSubject = @"Tour Card";
    emailRecipient = @"acpoints@gmail.com";
    emailBody = @"Hi Jay,\nHere is my information and preferences. Hope to hear from you soon!";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {}

- (UIImage *)imageWithView:(UIView *) view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (IBAction)convertUIView:(id)sender {
//    NewViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NewViewController"];
//    vc.imageFromFirstView = [self imageWithView:self.viewToBeConverted];
//    [self presentViewController:vc animated:YES completion:nil];

    UIImage *imageFromFirstView = [self imageWithView:self.viewToBeConverted];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:imageFromFirstView];
    
    if (![MFMailComposeViewController canSendMail]) {
        NSLog(@"Mail services are not available.");
        return;
    } else {
        // construct mail compose view controller
        MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
        mailComposer.mailComposeDelegate = self;
        
        //picker.mailComposeDelegate = vc;
        [mailComposer setSubject:emailSubject];
        [mailComposer setToRecipients:@[emailRecipient]];
        
        NSData *attachment = UIImagePNGRepresentation(imageView.image);
        
        [mailComposer addAttachmentData:attachment mimeType:@"image/png" fileName:file];
        
        // Fill out the email body text
        NSString *emailBody = emailBody;
        [mailComposer setMessageBody:emailBody isHTML:NO];
        [self presentViewController:mailComposer animated:YES completion:nil];
    }
}

//// The mail compose view controller delegate method
//- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:
//    (MFMailComposeResult)result error:(NSError *)error {
//    [self dismissViewControllerAnimated:NO completion:nil];
//}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickedCheckButton:(id)sender {
    UIButton *button = (UIButton *) sender;
    
    switch (button.tag) {
        case 0:
            if (!checked0) {
                [self.checkButton_0 setImage:[UIImage imageNamed:buttonImage] forState:UIControlStateNormal];
                checked0 = YES;
            } else {
                [self.checkButton_0 setImage:nil forState:UIControlStateNormal];
                checked0 = NO;
            }
            break;
        case 1:
            if (!checked1) {
                [self.checkButton_1 setImage:[UIImage imageNamed:buttonImage] forState:UIControlStateNormal];
                checked1 = YES;
            } else {
                [self.checkButton_1 setImage:nil forState:UIControlStateNormal];
                checked1 = NO;
            }
            break;
        case 2:
            if (!checked2) {
                [self.checkButton_2 setImage:[UIImage imageNamed:buttonImage] forState:UIControlStateNormal];
                checked2 = YES;
            } else {
                [self.checkButton_2 setImage:nil forState:UIControlStateNormal];
                checked2 = NO;
            }
            break;
        case 3:
            if (!checked3) {
                [self.checkButton_3 setImage:[UIImage imageNamed:buttonImage] forState:UIControlStateNormal];
                checked3 = YES;
            } else {
                [self.checkButton_3 setImage:nil forState:UIControlStateNormal];
                checked3 = NO;
            }
            break;
        default:
            break;
    }
}
@end
