//
//  StadiumViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/3/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationViewController.h"

@class AlertViewWithIndicator;
@class RestaurantViewController;
@class Cart;

@protocol StadiumDelegate <NSObject>

-(void) selectedStadium:(NSString *)stadiumName fromSender:(id)sender;

@end


@interface StadiumViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,LocationDelegate,UIAlertViewDelegate>


@property (strong, nonatomic) RestaurantViewController *restaurantViewController;
@property (strong, nonatomic) LocationViewController *locationViewController;
@property (strong, nonatomic) AlertViewWithIndicator *locationAlert;
@property (strong, nonatomic) Cart *cart;
@property (strong, nonatomic) NSArray *stadiums;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *userKey;

@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIButton *finishedButton;

@property (strong, nonatomic) NSIndexPath *lastIndexPath;

@property (nonatomic, assign) id<StadiumDelegate> delegate;



-(IBAction)finished:(id)sender;
-(void) startLocationAlert;


@end
