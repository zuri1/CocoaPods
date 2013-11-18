//
//  ZMBPhotosModel.h
//  ZMBCocoaPodsAndNetworking
//
//  Created by Zuri Biringer on 11/14/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "JSONModel.h"
#import "ZMBFlickrPhotoModel.h"

@interface ZMBPhotosModel : JSONModel

@property (nonatomic) NSArray<ZMBFlickrPhotoModel> *photo;

@property (nonatomic) NSString *title;


@end