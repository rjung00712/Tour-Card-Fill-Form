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
    NewViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NewViewController"];
    vc.imageFromFirstView = [self imageWithView:self.viewToBeConverted];

    [self presentViewController:vc animated:YES completion:nil];
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
    
    
//    if (button.tag == 0) {
//        if (!checked0) {
//            [self.checkButton_0 setImage:[UIImage imageNamed:buttonImage] forState:UIControlStateNormal];
//            checked0 = YES;
//        } else {
//            [self.checkButton_0 setImage:nil forState:UIControlStateNormal];
//            checked0 = NO;
//        }
//    } else if (button.tag == 1) {
//        if (!checked1) {
//            [self.checkButton_1 setImage:[UIImage imageNamed:buttonImage] forState:UIControlStateNormal];
//            checked1 = YES;
//        } else {
//            [self.checkButton_1 setImage:nil forState:UIControlStateNormal];
//            checked = NO;
//
//            NSLog(@"1 un-clicked");
//        }
//
//    }
    
//    if (!checked) {
//        [self.checkButton_0 setImage:[UIImage imageNamed:@"Black_check.png"] forState:UIControlStateNormal];
//        checked = YES;
//
//        NSLog(@"clicked");
//    } else {
//        [self.checkButton_0 setImage:nil forState:UIControlStateNormal];
//        checked = NO;
//
//        NSLog(@"un-clicked");
//    }
}
@end
