//
//  NewViewController.m
//  Tour Form Card
//
//  Created by Richard Chong on 3/2/18.
//  Copyright © 2018 Richard Chong. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView.image = self.imageFromFirstView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [self addAlertView];
}

-(void)addAlertView {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"NOT OKAY" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)openEmailInterface:(id)sender {
    if (![MFMailComposeViewController canSendMail]) {
        NSLog(@"Mail services are not available.");
        return;
    } else {
        // construct mail compose view controller
        MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
        mailComposer.mailComposeDelegate = self;
        
        //picker.mailComposeDelegate = vc;
        [mailComposer setSubject:@"testing"];
        [mailComposer setToRecipients:@[@"acpoints@gmail.com"]];
        
        NSData *attachment = UIImagePNGRepresentation(self.imageView.image);
        
        [mailComposer addAttachmentData:attachment mimeType:@"image/png" fileName:@"TESTING.png"];
        
        // Fill out the email body text
        NSString *emailBody = @"BODY OF THE MAIL";
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

@end
