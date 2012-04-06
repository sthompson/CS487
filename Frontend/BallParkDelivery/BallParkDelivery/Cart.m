//
//  Cart.m
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/5/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "Cart.h"
#import "Order.h"
#import "Model.h"

@implementation Cart

@synthesize orders;

- (void) placeOrder
{
    for(Order * order in orders)
    {
        NSMutableArray *extraNames = [[NSMutableArray alloc]init];
        for (NSDictionary *extra in order.extras)
        {
            [extraNames addObject:[extra objectForKey:@"extra_name"]];
        }
        NSArray *result = [Model placeOrderWithStadiumName:order.stadiumName 
                                         andRestaurantName:order.restaurantName 
                                               andItemName:order.itemName andExtras:extraNames andSeatNumber:order.seatNumber andQuantity:order.quantity];
    }
}

@end
