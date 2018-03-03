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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
