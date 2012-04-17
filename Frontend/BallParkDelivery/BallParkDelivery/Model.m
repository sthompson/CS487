  
//
//  Model.m
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/2/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "Model.h"
#import "CJSONDeserializer.h"

#define ROOT @"http://69.210.254.67:8080/"

@implementation Model

+(NSString *) loginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    NSString *urlString = [NSString stringWithFormat:@"%@login/",ROOT];
    NSString *post = [NSString stringWithFormat:@"username=%@&password=%@",
                      username,password];
    NSData *response = [Model getNonJSONPostDataFromURLString:urlString 
                                                      andPost:post];
    NSString *user = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    return user;
}

+(NSString *) updateSeatNumber:(NSString *)seatNumber WithUser:(NSString *) username
{
    NSString *urlString = [NSString stringWithFormat:@"%@update_seat_number/",ROOT];
    NSString *post = [NSString stringWithFormat:@"username=%@&seat_number=%@",
                      username,seatNumber];
    NSData *response = [Model getNonJSONPostDataFromURLString:urlString 
                                                                     andPost:post];
    NSString *stringResponse = [[NSString alloc] initWithData:response 
                                                     encoding:NSUTF8StringEncoding];
    return stringResponse;
}

+(void) emptyCart:(NSString *) username
{
    NSString *urlString = [NSString stringWithFormat:@"%@empty_cart/",ROOT];
    NSString *post = [NSString stringWithFormat:@"username=%@",username];
    [Model getNonJSONPostDataFromURLString:urlString andPost:post];
}

+(NSString *) registerUser:(NSString *) name withUsername:(NSString *)username andPassword:(NSString *) password andCCNum:(NSString *) ccNum andCCYear:(NSString *) ccYear andCCMonth:(NSString *) ccMonth
{
    NSString *urlString = [NSString stringWithFormat:@"%@create_username/",ROOT];
    NSString *post = [NSString stringWithFormat:@"cc_name=%@&cc_number=%@&cc_exp_month=%@&cc_exp_year=%@&username=%@&password=%@",
                      name,ccNum,ccMonth,ccYear,username,password];
    NSData *response = [Model getNonJSONPostDataFromURLString:urlString 
                                                      andPost:post];
    NSString *stringResponse = [[NSString alloc] initWithData:response 
                                                     encoding:NSUTF8StringEncoding];
    return stringResponse;
}

+(NSArray *) getRestaurantsFromStadiumName:(NSString *)stadiumName
{
    NSString *urlString = [NSString stringWithFormat:@"%@restaurant/",ROOT];
    NSString *post = [NSString stringWithFormat:@"stadium_name=%@",stadiumName];
    
    NSArray *restaurants = (NSArray *)[Model getPostDataFromURLString:urlString andPost:post];
    return restaurants;
}

+(NSArray *) getMenuFromStadiumName:(NSString *) stadiumName andRestaurantName:(NSString *)restaurantName
{
    NSString *urlString = [NSString stringWithFormat:@"%@menu_item/",ROOT];
    NSString *post = [NSString stringWithFormat:@"stadium_name=%@&restaurant_name=%@",
                      stadiumName,restaurantName];
    
    NSArray *menu = (NSArray *)[Model getPostDataFromURLString:urlString andPost:post];
    return menu;
}


+(NSArray *) getStadiumsWithLongitude:(NSString *)lon andLatitude:(NSString *)lat
{
    NSString *urlString = [NSString stringWithFormat:@"%@stadium/",ROOT];
    NSString *post = [NSString stringWithFormat:@"longitude=%@&latitude=%@",lon,lat];
    
    NSArray *stadiums = (NSArray *)[Model getPostDataFromURLString:urlString andPost:post];
    return stadiums;
}

+(NSArray *) getExtrasFromStadiumName:(NSString *) stadiumName andRestaurantName:(NSString *) restaurantName
{
    NSString *urlString = [NSString stringWithFormat:@"%@extra_item/",ROOT];
    NSString *post = [NSString stringWithFormat:@"stadium_name=%@&restaurant_name=%@",
                      stadiumName,restaurantName];
    
    NSArray *extras = (NSArray *)[Model getPostDataFromURLString:urlString andPost:post];
    return extras;
}

+(NSArray *) addToCartWithStadiumName: (NSString *) stadiumName andRestaurantName: (NSString *) restaurantName andItemName: (NSString *) itemName andExtras: (NSArray *) extras andQuantity: (NSString *) quantity andUsername:(NSString *)username
{
    NSString *urlString = [NSString stringWithFormat:@"%@add_to_cart/",ROOT];
    NSString *post = [NSString stringWithFormat:@"username=%@&stadium_name=%@&restaurant_name=%@&%@,%@=",username,stadiumName,restaurantName,itemName,quantity];
    for (int i = 0; i<[extras count]; i++)
    {
        if (i==0)
            post = [post stringByAppendingFormat:@"%@",[extras objectAtIndex:i]];
        else
            post = [post stringByAppendingFormat:@",%@",[extras objectAtIndex:i]];
    }
    NSArray *result = (NSArray *)[Model getPostDataFromURLString:urlString andPost:post];
    return result;

}

+(NSArray *) getCartItemsFromUsername: (NSString *) username
{
    NSString *urlString = [NSString stringWithFormat:@"%@view_cart/",ROOT];
    NSString *post = [NSString stringWithFormat:@"username=%@",
                      username];
    NSArray *items = (NSArray *)[Model getPostDataFromURLString:urlString andPost:post];
    return items;
}

+(void) removeItem:(NSString *)itemPK fromUser:(NSString *) username
{
    NSString *urlString = [NSString stringWithFormat:@"%@delete_item/",ROOT];
    NSString *post = [NSString stringWithFormat:@"username=%@&pk=%@",
                      username,itemPK];
    [Model getPostDataFromURLString:urlString andPost:post];
}

+(void) submitOrder:(NSString *) username
{
    NSString *urlString = [NSString stringWithFormat:@"%@order_submission/",ROOT];
    NSString *post = [NSString stringWithFormat:@"username=%@",username];
    [Model getPostDataFromURLString:urlString andPost:post];
}

+(id) getPostDataFromURLString:(NSString *) urlString andPost: (NSString *) post
{
    NSString *urlFormattedString = [urlString stringByAddingPercentEscapesUsingEncoding:
                                    NSASCIIStringEncoding];
    NSURL *url = [[NSURL alloc] initWithString:urlFormattedString];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    NSURLResponse *response;
    NSData *data;
    
    data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    CJSONDeserializer *theDeserializer = [CJSONDeserializer deserializer];
    theDeserializer.nullObject = NULL;
    NSError *theError = nil;
    return [theDeserializer deserialize:data error:&theError];
}

+(id) getNonJSONPostDataFromURLString:(NSString *) urlString andPost: (NSString *) post
{
    NSString *urlFormattedString = [urlString stringByAddingPercentEscapesUsingEncoding:
                                    NSASCIIStringEncoding];
    NSURL *url = [[NSURL alloc] initWithString:urlFormattedString];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    NSURLResponse *response;
    NSData *data;
    
    data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];

    return data;
}

+(id) getDataFromURLString:(NSString *) urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    CJSONDeserializer *theDeserializer = [CJSONDeserializer deserializer];
    theDeserializer.nullObject = NULL;
    NSError *theError = nil;
    return [theDeserializer deserialize:data error:&theError];
}

+(NSData *) getImageFromURL:(NSString *) urlString inContext:(NSManagedObjectContext *)ctx
{
    
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlString]];
    
    NSManagedObject *newObject = [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:ctx];
    UIImage *image = [UIImage imageWithData:imageData];
    NSData *pngData = UIImagePNGRepresentation(image);
    [newObject setValue:pngData forKey:@"image"];
    [newObject setValue:urlString forKey:@"url"];
    [ctx save:nil];
    
    return imageData;
}

+(NSData *) getImageFromURL:(NSString *) urlString
{
    
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlString]];    
    return imageData;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}




@end
