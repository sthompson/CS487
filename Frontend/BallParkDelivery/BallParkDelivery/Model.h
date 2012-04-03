//
//  Model.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/2/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Model : UIViewController

+(id) getDataFromURLString:(NSString *) urlString andPost: (NSString *) post;
+(NSArray *) getRestaurantsFromStadiumName: (NSString *)stadiumName;

@end
