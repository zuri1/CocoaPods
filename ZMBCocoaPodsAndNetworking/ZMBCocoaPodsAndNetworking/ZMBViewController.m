//
//  ZMBViewController.m
//  ZMBCocoaPodsAndNetworking
//
//  Created by Zuri Biringer on 11/11/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "ZMBViewController.h"
#import <JSONKit/JSONKit.h>
#import <FlickrKit/FlickrKit.h>
#import <JSONModel/JSONModel.h>
#import "ZMBPhotosModel.h"

@interface ZMBViewController ()

@end

@implementation ZMBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSData *weatherData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Seattle,us"]];
    
    NSDictionary *weatherDict = [weatherData objectFromJSONData];
    
//    NSLog(@"%@", [weatherDict objectForKey:@"weather"]);
//    NSLog(@"%@", [weatherDict objectForKey:@"main"]);
    
    NSArray *weatherKeyArray = [weatherDict objectForKey:@"weather"];
//    NSLog(@"%@", [weatherKeyArray objectAtIndex:0]);
    
    NSDictionary *weatherKeyDict = [weatherKeyArray objectAtIndex:0];
//    NSLog(@"%@", [weatherKeyDict objectForKey:@"description"]);
    
    NSDictionary *mainKeyDict = [weatherDict objectForKey:@"main"];
//    NSLog(@"%@", [mainKeyDict objectForKey:@"temp"]);
    //NSLog(@"%@", [weatherDict objectForKey:@"main"]);
    
//    NSLog(@"%@", [weatherDict objectForKey:@"name"]);
    
    _placeLabel.text = [weatherDict objectForKey:@"name"];
    _tempLabel.text = [NSString stringWithFormat:@"%@ K", [mainKeyDict objectForKey:@"temp"]];
    _weatherLabel.text = [weatherKeyDict objectForKey:@"description"];
    
    [[FlickrKit sharedFlickrKit] initializeWithAPIKey:@"c6506c0d2e8da8dadc72c4924f37828d" sharedSecret:@"a2bdae7dab12593d"];
    
    FlickrKit *fk = [FlickrKit sharedFlickrKit];
    
    NSData *flickrData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key=f3dcd6e63a3a7cca3752fbe5939e1c59&user_id=42145244%40N03&format=json&nojsoncallback=1&auth_token=72157637669376345-0f985f7cdefec834&api_sig=56f44e1de244fbe2b8bd4489874a3b5b"]];
    NSDictionary *flickrDict = [flickrData objectFromJSONData];

    NSDictionary *photosDict = [flickrDict objectForKey:@"photos"];
    NSArray *photoDict = [photosDict objectForKey:@"photo"];
    
    //NSString *tuckerJSON = [photoDict JSONString];
    NSError *err = nil;
    
    _tuckerArray = [[NSMutableArray alloc] initWithCapacity: photoDict.count];
    
    for (NSDictionary *individualPhoto in photoDict)
    {
        NSString *tuckerJSON = [individualPhoto JSONString];
        ZMBFlickrPhotoModel *tuckersModel = [[ZMBFlickrPhotoModel alloc] initWithString:tuckerJSON error:&err];
        [_tuckerArray addObject: tuckersModel];
    }
    
    //ZMBPhotosModel *tuckersModel = [[ZMBPhotosModel alloc] initWithString:tuckerJSON error:&err];
    
    ZMBFlickrPhotoModel *individualPhoto = _tuckerArray[0];
    
    NSLog(@"%@", individualPhoto.owner);
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    // Return number of rows in section
    return _tuckerArray.count;
}

- (IBAction)refreshButtonPressed
{
    NSLog(@"Refresh button pressed");
    
    NSData *weatherData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=everett,wa"]];
    
    NSDictionary *weatherDict = [weatherData objectFromJSONData];
    
    NSLog(@"%@", [weatherDict objectForKey:@"weather"]);
    NSLog(@"%@", [weatherDict objectForKey:@"main"]);
    
    NSArray *weatherKeyArray = [weatherDict objectForKey:@"weather"];
    NSLog(@"%@", [weatherKeyArray objectAtIndex:0]);
    
    NSDictionary *weatherKeyDict = [weatherKeyArray objectAtIndex:0];
    NSLog(@"%@", [weatherKeyDict objectForKey:@"description"]);
    
    NSDictionary *mainKeyDict = [weatherDict objectForKey:@"main"];
    NSLog(@"%@", [mainKeyDict objectForKey:@"temp"]);
    //NSLog(@"%@", [weatherDict objectForKey:@"main"]);
    
    NSLog(@"%@", [weatherDict objectForKey:@"name"]);
    
    _placeLabel.text = [weatherDict objectForKey:@"name"];
    _tempLabel.text = [NSString stringWithFormat:@"%@ K", [mainKeyDict objectForKey:@"temp"]];
    _weatherLabel.text = [weatherKeyDict objectForKey:@"description"];
}

@end