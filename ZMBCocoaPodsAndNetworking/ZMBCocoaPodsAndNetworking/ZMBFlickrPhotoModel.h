//
//  ZMBFlickrPhotoModel.h
//  ZMBCocoaPodsAndNetworking
//
//  Created by Zuri Biringer on 11/14/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "JSONModel.h"

@protocol ZMBFlickrPhotoModel
@end

@interface ZMBFlickrPhotoModel : JSONModel
@property (assign, nonatomic) int farm;
@property (strong, nonatomic) NSString *id;
@property (assign, nonatomic) int isfamily;
@property (assign, nonatomic) int isfriend;
@property (assign, nonatomic) int ispublic;
@property (strong, nonatomic) NSString *owner;
@property (strong, nonatomic) NSString *secret;
@property (strong, nonatomic) NSString *server;
@property (strong, nonatomic) NSString *title;

@end