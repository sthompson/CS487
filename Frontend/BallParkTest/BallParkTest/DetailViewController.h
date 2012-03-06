//
//  DetailViewController.h
//  BallParkTest
//
//  Created by Seth  Thompson on 2/14/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OrderPageController;

@interface DetailViewController : UITableViewController

@property (strong, nonatomic) OrderPageController *page;
@property (strong, nonatomic) NSDictionary *menu;


@property (strong, nonatomic) NSString *logoname;



@end
