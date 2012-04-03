//
//  Model.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/2/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Model : UIViewController

+(id) getPostDataFromURLString:(NSString *) urlString andPost: (NSString *) post;
+(id) getDataFromURLString:(NSString *) urlString;
+(NSArray *) getStadiums;
+(NSArray *) getRestaurantsFromStadiumName: (NSString *)stadiumName;
+(NSArray *) getMenuFromRestaurantName:(NSString *)restaurantName;
+(NSArray *) getExtrasFromRestaurantName:(NSString *) restaurantName;

@end
