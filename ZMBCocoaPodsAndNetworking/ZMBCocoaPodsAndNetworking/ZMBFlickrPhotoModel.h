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

@protocol ZMBFlickrPhotoModelDelegate
- (void)imageWasDownloadedForRow:(NSInteger)rowNumber;
@end

@interface ZMBFlickrPhotoModel : JSONModel

@property (nonatomic, weak) id<Optional, ZMBFlickrPhotoModelDelegate> delegate;

@property (assign, nonatomic) int farm;
@property (strong, nonatomic) NSString *id;
@property (assign, nonatomic) int isfamily;
@property (assign, nonatomic) int isfriend;
@property (assign, nonatomic) int ispublic;
@property (strong, nonatomic) NSString *owner;
@property (strong, nonatomic) NSString *secret;
@property (strong, nonatomic) NSString *server;
@property (strong, nonatomic) NSString *title;

@property (strong, nonatomic) NSURL<Optional> *photoURL;
@property (strong, nonatomic) UIImage<Optional> *photo;
@property (nonatomic, strong) NSNumber<Optional> *rowNumber;

- (id)initWithString:(NSString *)string error:(JSONModelError *__autoreleasing *)err andDelegate:(id)delegate;

@end