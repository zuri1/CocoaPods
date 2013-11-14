//
//  FKFlickrGroupsPoolsRemove.m
//  FlickrKit
//
//  Generated by FKAPIBuilder on 12 Jun, 2013 at 17:19.
//  Copyright (c) 2013 DevedUp Ltd. All rights reserved. http://www.devedup.com
//
//  DO NOT MODIFY THIS FILE - IT IS MACHINE GENERATED


#import "FKFlickrGroupsPoolsRemove.h" 

@implementation FKFlickrGroupsPoolsRemove

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
    return @"flickr.groups.pools.remove";
}

- (BOOL) isValid:(NSError **)error {
    BOOL valid = YES;
	NSMutableString *errorDescription = [[NSMutableString alloc] initWithString:@"You are missing required params: "];
	if(!self.photo_id) {
		valid = NO;
		[errorDescription appendString:@"'photo_id', "];
	}
	if(!self.group_id) {
		valid = NO;
		[errorDescription appendString:@"'group_id', "];
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
	if(self.group_id) {
		[args setValue:self.group_id forKey:@"group_id"];
	}

    return [args copy];
}

- (NSString *) descriptionForError:(NSInteger)error {
    switch(error) {
		case FKFlickrGroupsPoolsRemoveError_GroupNotFound:
			return @"Group not found";
		case FKFlickrGroupsPoolsRemoveError_PhotoNotInPool:
			return @"Photo not in pool";
		case FKFlickrGroupsPoolsRemoveError_InsufficientPermissionToRemovePhoto:
			return @"Insufficient permission to remove photo";
		case FKFlickrGroupsPoolsRemoveError_InvalidSignature:
			return @"Invalid signature";
		case FKFlickrGroupsPoolsRemoveError_MissingSignature:
			return @"Missing signature";
		case FKFlickrGroupsPoolsRemoveError_LoginFailedOrInvalidAuthToken:
			return @"Login failed / Invalid auth token";
		case FKFlickrGroupsPoolsRemoveError_UserNotLoggedInOrInsufficientPermissions:
			return @"User not logged in / Insufficient permissions";
		case FKFlickrGroupsPoolsRemoveError_InvalidAPIKey:
			return @"Invalid API Key";
		case FKFlickrGroupsPoolsRemoveError_ServiceCurrentlyUnavailable:
			return @"Service currently unavailable";
		case FKFlickrGroupsPoolsRemoveError_FormatXXXNotFound:
			return @"Format \"xxx\" not found";
		case FKFlickrGroupsPoolsRemoveError_MethodXXXNotFound:
			return @"Method \"xxx\" not found";
		case FKFlickrGroupsPoolsRemoveError_InvalidSOAPEnvelope:
			return @"Invalid SOAP envelope";
		case FKFlickrGroupsPoolsRemoveError_InvalidXMLRPCMethodCall:
			return @"Invalid XML-RPC Method Call";
		case FKFlickrGroupsPoolsRemoveError_BadURLFound:
			return @"Bad URL found";
  
		default:
			return @"Unknown error code";
    }
}

@end
