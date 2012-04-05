//
//  LocationViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/5/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationDelegate

- (void) locationFinishedUpdating:(id)sender; 

@end

@interface LocationViewController : UIViewController<CLLocationManagerDelegate>

@property(strong, nonatomic) CLLocationManager *locationManager;
@property(strong, nonatomic) NSString *longitude;
@property(strong, nonatomic) NSString *latitude;

-(void) startStandardUpdates;




@end
