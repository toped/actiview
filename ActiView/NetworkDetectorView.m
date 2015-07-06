//
//  NetworkDetectorView.m
//  ActiView
//
//  Created by TopeD on 4/15/15.
//  Copyright (c) 2015 Mississippi State Extension Service. All rights reserved.
//

#import "NetworkDetectorView.h"

@implementation NetworkDetectorView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)baseInit {
   

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGRect notificationFrame = CGRectMake(0, 0, screenRect.size.width, 22);
    notificationFrame.origin.y = -(self.bounds.size.height); //move off screen
    _notification = [[UIView alloc] initWithFrame:notificationFrame];
    _notification.backgroundColor = [UIColor colorWithRed:65.0/255.0 green:103.0/255.0 blue:181.0/255.0 alpha:.7];
    [self addSubview:_notification];
    
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 22)];
    
    messageLabel.text = @"Internet connection not available.";
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.font = [UIFont fontWithName:@"Avenir-Light" size:16];
    
    [_notification addSubview:messageLabel];

    /*
     Observe the kNetworkReachabilityChangedNotification. When that notification is posted, the method reachabilityChanged will be called.
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    _internetReachability = [Reachability reachabilityForInternetConnection];
    [_internetReachability startNotifier];
    [self updateInterfaceWithReachability:_internetReachability];
    
    _statusChanged = NO;
    _animationSpeed = 1.5;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self baseInit];
    }
    return self;
}


- (void) reachabilityChanged:(NSNotification *)note {
    
    
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]); //a simple way to test that a method's parameter is not nil or not 0. So basically, you use it to create a precondition, stating that some parameter must be set.
    [self updateInterfaceWithReachability:curReach];
}


- (void)updateInterfaceWithReachability:(Reachability *)reachability {
    
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    
    switch (netStatus) {
            
        case NotReachable: {
            
            [self.delegate detectorView:self networkStatusDidChangeWithReachableStatus:NO];
            
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGRect notificationFrame = CGRectMake(0, 0, screenRect.size.width, 22);
            
            [UIView animateWithDuration:self.animationSpeed
                                  delay:0.0
                                options: UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 _notification.frame = notificationFrame;
                             }
                             completion:^(BOOL finished){
                                 NSLog(@"Done! - 1");
                             }];
            
            break;
            
        }
            
        case ReachableViaWWAN: {
            
            [self.delegate detectorView:self networkStatusDidChangeWithReachableStatus:YES];
            
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGRect notificationFrame = CGRectMake(0, 0, screenRect.size.width, 22);
            notificationFrame.origin.y = -(self.bounds.size.height); //move off screen
            
            [UIView animateWithDuration:self.animationSpeed
                                  delay:0.0
                                options: UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 _notification.frame = notificationFrame;
                             }
                             completion:^(BOOL finished){
                                 NSLog(@"Done! - 1");
                             }];
            
            break;
            
        }
        case ReachableViaWiFi: {
            
            [self.delegate detectorView:self networkStatusDidChangeWithReachableStatus:YES];
            
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGRect notificationFrame = CGRectMake(0, 0, screenRect.size.width, 22);
            notificationFrame.origin.y = -(self.bounds.size.height); //move off screen
            
            [UIView animateWithDuration:self.animationSpeed
                                  delay:0.0
                                options: UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 _notification.frame = notificationFrame;
                             }
                             completion:^(BOOL finished){
                                 NSLog(@"Done! - 1");
                             }];
            
            break;
            
        }
            
    }

    
}


@end
