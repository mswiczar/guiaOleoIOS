//
//  TWLoginData.h
//  Robtwitter
//
//  Created by Moises Swiczar on 5/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TWLoginData : NSObject {
	NSString* Id;
	NSString* Name;
	NSString* Screen_name;
	NSString* Location;
	NSString* Description;
	NSString* Profile_image_url;
	NSString* Url;
	NSString* Protected;
	NSString* Followers_count;
	NSString* Friends_count;
	NSString* Favourites_count;
	UIImage *image;
	NSString* Status_count;
	NSString *Following;
	BOOL haveerror;
}

@property (nonatomic,copy) NSString* Id;
@property (nonatomic,copy) NSString* Name;
@property (nonatomic,copy) NSString* Screen_name;
@property (nonatomic,copy) NSString* Location;
@property (nonatomic,copy) NSString* Description;
@property (nonatomic,copy) NSString* Profile_image_url;
@property (nonatomic,copy) NSString* Url;

@property (nonatomic,copy) NSString* Protected;
@property (nonatomic,copy) NSString* Followers_count;
@property (nonatomic,copy) NSString* Friends_count;
@property (nonatomic,copy) NSString* Favourites_count;
@property (nonatomic,copy) NSString* Status_count;
@property (nonatomic) BOOL haveerror;
@property (nonatomic,retain) UIImage *image;
@property (nonatomic,copy) NSString* Following;

-(void) loadimage;

@end
