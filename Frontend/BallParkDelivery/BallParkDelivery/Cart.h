//
//  Cart.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/5/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Order;

@interface Cart : NSObject


+(void) addToCart:(Order *) order;

@end
