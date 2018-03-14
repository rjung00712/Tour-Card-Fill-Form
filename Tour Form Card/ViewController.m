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

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    
}

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
    
    self.imageView.image = [self imageWithView:self.viewToBeConverted];
    
//    [self presentViewController:vc animated:YES completion:nil];
    
}

//if ([MFMailComposeViewController canSendMail]){
//
//}


@end
