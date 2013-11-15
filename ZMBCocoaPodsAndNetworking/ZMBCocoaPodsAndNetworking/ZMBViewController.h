//
//  ZMBViewController.h
//  ZMBCocoaPodsAndNetworking
//
//  Created by Zuri Biringer on 11/11/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMBViewController : UIViewController

@property (nonatomic) IBOutlet UILabel *placeLabel;
@property (nonatomic) IBOutlet UILabel *tempLabel;
@property (nonatomic) IBOutlet UILabel *weatherLabel;

@property (nonatomic) IBOutlet UITableView *tuckersTableView;

@property (nonatomic) NSMutableArray *tuckerArray;

@end