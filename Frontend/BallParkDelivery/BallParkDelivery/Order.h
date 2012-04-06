//
//  Order.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/5/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject

@property(strong, nonatomic) NSString *stadiumName;
@property(strong, nonatomic) NSString *restaurantName;
@property(strong, nonatomic) NSString *itemName;
@property(strong, nonatomic) NSString *quantity;
@property(strong, nonatomic) NSString *seatNumber;
@property(strong, nonatomic) NSString *price;

@property(strong, nonatomic) NSMutableArray  *extras;

@end
