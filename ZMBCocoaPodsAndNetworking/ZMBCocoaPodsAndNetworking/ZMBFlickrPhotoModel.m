//
//  ZMBFlickrPhotoModel.m
//  ZMBCocoaPodsAndNetworking
//
//  Created by Zuri Biringer on 11/14/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "ZMBFlickrPhotoModel.h"

@implementation ZMBFlickrPhotoModel

- (id)initWithString:(NSString *)string error:(JSONModelError *__autoreleasing *)err andDelegate:(id)delegate
{
    self = [super initWithString:string error:err];
    if (self) {
        _delegate = delegate;
        _photoURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://farm%d.staticflickr.com/%@/%@_%@.jpg", _farm, _server, _id, _secret]];
        if (_photo) {
            NSLog(@"Already Have Photo");
        } else {
            NSLog(@"Need To Download: %@", _photoURL);
            [self performSelectorInBackground:@selector(downloadImage) withObject:nil];
        }
    }
    
    return self;
}

- (void)downloadImage
{
    NSData *photoData = [NSData dataWithContentsOfURL:_photoURL];
    _photo = [UIImage imageWithData:photoData];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        NSLog(@"Finished Download Of Image:%@", self.photo);
        [self.delegate imageWasDownloadedForRow:[_rowNumber integerValue]];
    }];
}

@end