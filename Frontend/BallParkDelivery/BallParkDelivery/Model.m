
//
//  Model.m
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/2/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "Model.h"
#import "CJSONDeserializer.h"

@implementation Model

+(NSArray *) getRestaurantsFromStadiumName:(NSString *)stadiumName
{
    NSString *urlString = [NSString stringWithFormat:@"http://69.210.242.101:8080/restaurant/"];
    NSString *post = [NSString stringWithFormat:@"stadium_name=%@",stadiumName];
    
    NSArray *restaurants = (NSArray *)[Model getPostDataFromURLString:urlString andPost:post];
    return restaurants;
}

+(NSArray *) getMenuFromStadiumName:(NSString *) stadiumName andRestaurantName:(NSString *)restaurantName
{
    NSString *urlString = [NSString stringWithFormat:@"http://69.210.242.101:8080/menu_item/"];
    NSString *post = [NSString stringWithFormat:@"stadium_name=%@&restaurant_name=%@",
                      stadiumName,restaurantName];
    
    NSArray *menu = (NSArray *)[Model getPostDataFromURLString:urlString andPost:post];
    return menu;
}


+(NSArray *) getStadiumsWithLongitude:(NSString *)lon andLatitude:(NSString *)lat
{
    NSString *urlString = [NSString stringWithFormat:@"http://69.210.242.101:8080/stadium/"];
    NSString *post = [NSString stringWithFormat:@"longitude=%@&latitude=%@",lon,lat];
    
    NSArray *stadiums = (NSArray *)[Model getPostDataFromURLString:urlString andPost:post];
    return stadiums;
}

+(NSArray *) getExtrasFromStadiumName:(NSString *) stadiumName andRestaurantName:(NSString *) restaurantName
{
    NSString *urlString = [NSString stringWithFormat:@"http://69.210.242.101:8080/extra_item/"];
    NSString *post = [NSString stringWithFormat:@"stadium_name=%@&restaurant_name=%@",
                      stadiumName,restaurantName];
    
    NSArray *extras = (NSArray *)[Model getPostDataFromURLString:urlString andPost:post];
    return extras;
}

+(NSArray *) placeOrderWithStadiumName: (NSString *) stadiumName andRestaurantName: (NSString *) restaurantName andItemName: (NSString *) itemName andExtras: (NSArray *) extras andSeatNumber: (NSString *) seatNumber andQuantity: (NSString *) quantity
{
    NSString *urlString = [NSString stringWithFormat:@"http://69.210.242.101:8080/order_submission/"];
    NSString *post = [NSString stringWithFormat:@"stadium_name=%@&restaurant_name=%@&%@,%@=",
                      stadiumName,restaurantName,itemName,quantity];
    for (int i = 0; i<[extras count]; i++)
    {
        if (i==0)
            post = [post stringByAppendingFormat:@"%@",[extras objectAtIndex:i]];
        else
            post = [post stringByAppendingFormat:@",%@",[extras objectAtIndex:i]];
    }
    post = [post stringByAppendingFormat:@"&seat_number=%@",seatNumber];
    NSArray *result = (NSArray *)[Model getPostDataFromURLString:urlString andPost:post];
    return result;

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

+(id) getDataFromURLString:(NSString *) urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    CJSONDeserializer *theDeserializer = [CJSONDeserializer deserializer];
    theDeserializer.nullObject = NULL;
    NSError *theError = nil;
    return [theDeserializer deserialize:data error:&theError];
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
