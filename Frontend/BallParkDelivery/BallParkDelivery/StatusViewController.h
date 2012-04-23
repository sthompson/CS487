//
//  StatusViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/22/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusViewController : UITableViewController

@property (strong, nonatomic) NSArray *statuses;

@property (weak, nonatomic) IBOutlet UILabel *orderLabel;
@property (weak, nonatomic) IBOutlet UILabel *restaurantLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *customCell;


@end
