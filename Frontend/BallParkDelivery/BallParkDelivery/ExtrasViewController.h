//
//  ExtrasViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/3/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalViewDelegate

- (void) userFinished:(id)sender withInfo:(NSArray*) info;  

@end

@interface ExtrasViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIButton *finished;

@property (strong, nonatomic) NSArray *extras;
@property (strong, nonatomic) NSMutableArray *extraNames;
@property (strong, nonatomic) NSMutableArray *selectedRows;

@property(nonatomic, assign) id<ModalViewDelegate> delegate;

-(IBAction)finished:(id)sender;

@end
