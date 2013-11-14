//
//  FKFlickrPhotosPeopleDelete.m
//  FlickrKit
//
//  Generated by FKAPIBuilder on 12 Jun, 2013 at 17:19.
//  Copyright (c) 2013 DevedUp Ltd. All rights reserved. http://www.devedup.com
//
//  DO NOT MODIFY THIS FILE - IT IS MACHINE GENERATED


#import "FKFlickrPhotosPeopleDelete.h" 

@implementation FKFlickrPhotosPeopleDelete

- (BOOL) needsLogin {
    return YES;
}

- (BOOL) needsSigning {
    return YES;
}

- (FKPermission) requiredPerms {
    return 1;
}

- (NSString *) name {
    return @"flickr.photos.people.delete";
}

- (BOOL) isValid:(NSError **)error {
    BOOL valid = YES;
	NSMutableString *errorDescription = [[NSMutableString alloc] initWithString:@"You are missing required params: "];
	if(!self.photo_id) {
		valid = NO;
		[errorDescription appendString:@"'photo_id', "];
	}
	if(!self.user_id) {
		valid = NO;
		[errorDescription appendString:@"'user_id', "];
	}

	if(error != NULL) {
		if(!valid) {	
			NSDictionary *userInfo = @{NSLocalizedDescriptionKey: errorDescription};
			*error = [NSError errorWithDomain:FKFlickrKitErrorDomain code:FKErrorInvalidArgs userInfo:userInfo];
		}
	}
    return valid;
}

- (NSDictionary *) args {
    NSMutableDictionary *args = [NSMutableDictionary dictionary];
	if(self.photo_id) {
		[args setValue:self.photo_id forKey:@"photo_id"];
	}
	if(self.user_id) {
		[args setValue:self.user_id forKey:@"user_id"];
	}
	if(self.email) {
		[args setValue:self.email forKey:@"email"];
	}

    return [args copy];
}

- (NSString *) descriptionForError:(NSInteger)error {
    switch(error) {
		case FKFlickrPhotosPeopleDeleteError_PersonNotFound:
			return @"Person not found";
		case FKFlickrPhotosPeopleDeleteError_PhotoNotFound:
			return @"Photo not found";
		case FKFlickrPhotosPeopleDeleteError_UserCannotRemoveThatPerson:
			return @"User cannot remove that person";
		case FKFlickrPhotosPeopleDeleteError_InvalidSignature:
			return @"Invalid signature";
		case FKFlickrPhotosPeopleDeleteError_MissingSignature:
			return @"Missing signature";
		case FKFlickrPhotosPeopleDeleteError_LoginFailedOrInvalidAuthToken:
			return @"Login failed / Invalid auth token";
		case FKFlickrPhotosPeopleDeleteError_UserNotLoggedInOrInsufficientPermissions:
			return @"User not logged in / Insufficient permissions";
		case FKFlickrPhotosPeopleDeleteError_InvalidAPIKey:
			return @"Invalid API Key";
		case FKFlickrPhotosPeopleDeleteError_ServiceCurrentlyUnavailable:
			return @"Service currently unavailable";
		case FKFlickrPhotosPeopleDeleteError_FormatXXXNotFound:
			return @"Format \"xxx\" not found";
		case FKFlickrPhotosPeopleDeleteError_MethodXXXNotFound:
			return @"Method \"xxx\" not found";
		case FKFlickrPhotosPeopleDeleteError_InvalidSOAPEnvelope:
			return @"Invalid SOAP envelope";
		case FKFlickrPhotosPeopleDeleteError_InvalidXMLRPCMethodCall:
			return @"Invalid XML-RPC Method Call";
		case FKFlickrPhotosPeopleDeleteError_BadURLFound:
			return @"Bad URL found";
  
		default:
			return @"Unknown error code";
    }
}

@end
