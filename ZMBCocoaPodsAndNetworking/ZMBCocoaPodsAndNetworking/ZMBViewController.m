//
//  ZMBViewController.m
//  ZMBCocoaPodsAndNetworking
//
//  Created by Zuri Biringer on 11/11/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "ZMBViewController.h"
#import <JSONKit/JSONKit.h>

@interface ZMBViewController ()

@end

@implementation ZMBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSData *weatherData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Seattle,us"]];
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end