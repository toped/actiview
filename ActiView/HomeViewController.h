//
//  HomeViewController.h
//  ActiView
//
//  Created by TopeD on 4/15/15.
//  Copyright (c) 2015 Mississippi State Extension Service. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkDetectorView.h"

@interface HomeViewController : UIViewController<NetworkDetectorViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *statusMessage;

@end
