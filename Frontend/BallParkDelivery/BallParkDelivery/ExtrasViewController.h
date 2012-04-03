//
//  ExtrasViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/3/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExtrasViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIButton *finished;
@property (weak, nonatomic) IBOutlet UIButton *none;

@end
