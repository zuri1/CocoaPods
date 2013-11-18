//
//  ZMBViewController.h
//  ZMBCocoaPodsAndNetworking
//
//  Created by Zuri Biringer on 11/11/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMBFlickrPhotoModel.h"
#import "ZMBPhotoTableViewCell.h"

@interface ZMBViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) IBOutlet UILabel *placeLabel;
@property (nonatomic) IBOutlet UILabel *tempLabel;
@property (nonatomic) IBOutlet UILabel *weatherLabel;

@property (nonatomic) NSMutableArray *tuckerArray;

@property (weak, nonatomic) IBOutlet UITableView *theTableView;

@end