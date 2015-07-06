//
//  NetworkDetectorView.h
//  ActiView
//
//  Created by TopeD on 4/15/15.
//  Copyright (c) 2015 Mississippi State Extension Service. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@class NetworkDetectorView; 

@protocol NetworkDetectorViewDelegate
@optional

//method is called whenever the network status flags are changed
- (void)detectorView:(NetworkDetectorView *)detectorView networkStatusDidChangeWithReachableStatus:(BOOL)reachableStatus;
@end


@interface NetworkDetectorView : UIView

@property (nonatomic) BOOL statusChanged;
@property (nonatomic) Reachability *internetReachability;
@property (nonatomic, strong) UIView *notification;
@property (nonatomic, weak) id <NetworkDetectorViewDelegate> delegate;

@end
