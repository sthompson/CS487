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
+(id) getNonJSONPostDataFromURLString:(NSString *) urlString andPost: (NSString *) post;
+(id) getDataFromURLString:(NSString *) urlString;
+(NSData *) getImageFromURL:(NSString *) urlString;
+(NSData *) getImageFromURL:(NSString *) urlString inContext:(NSManagedObjectContext *)ctx;
+(NSString *) loginWithUsername:(NSString *)username andPassword:(NSString *)password;
+(NSString *) updateSeatNumber:(NSString *)seatNumber WithUser:(NSString *) username;
+(NSArray *) getStadiumsWithLongitude:(NSString *)lon andLatitude:(NSString *)lat;
+(NSArray *) getRestaurantsFromStadiumName: (NSString *)stadiumName;
+(NSArray *) getMenuFromStadiumName:(NSString *) stadiumName andRestaurantName:(NSString *)restaurantName;
+(NSArray *) getExtrasFromStadiumName:(NSString *) stadiumName andRestaurantName:(NSString *) restaurantName;
+(NSArray *) placeOrderWithStadiumName: (NSString *) stadiumName andRestaurantName: (NSString *) restaurantName andItemName: (NSString *) itemName andExtras: (NSArray *) extras andSeatNumber: (NSString *) seatNumber andQuantity: (NSString *) quantity;

@end
