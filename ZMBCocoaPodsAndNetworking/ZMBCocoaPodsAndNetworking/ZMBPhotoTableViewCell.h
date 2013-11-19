//
//  ZMBPhotoTableViewCell.h
//  ZMBCocoaPodsAndNetworking
//
//  Created by Zuri Biringer on 11/15/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMBViewController.h"
#import "ZMBFlickrPhotoModel.h"

@interface ZMBPhotoTableViewCell : UITableViewCell

@property (nonatomic) ZMBFlickrPhotoModel *model;

@property (nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIImageView *photo;

@end