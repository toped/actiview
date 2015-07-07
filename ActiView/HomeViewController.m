//
//  HomeViewController.m
//  ActiView
//
//  Created by TopeD on 4/15/15.
//  Copyright (c) 2015 Mississippi State Extension Service. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Actiview Network Detector";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NetworkDtectorView Delegate Methods

-(void)detectorView:(NetworkDetectorView *)detectorView networkStatusDidChangeWithReachableStatus:(BOOL)reachableStatus {
    
    if (reachableStatus) {
        _statusMessage.text = @"Internet is available!";
    }
    else {
        _statusMessage.text = @"Internet is unavailable!";
    }
    
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
