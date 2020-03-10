//
//  TWLoginData.m
//  Robtwitter
//
//  Created by Moises Swiczar on 5/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TWLoginData.h"
#import "UChache.h"


@implementation TWLoginData


@synthesize Id;
@synthesize Name;
@synthesize Screen_name;
@synthesize Location;
@synthesize Description;
@synthesize Profile_image_url;
@synthesize Url;

@synthesize Protected;
@synthesize Followers_count;
@synthesize Friends_count;
@synthesize Favourites_count;
@synthesize image;
@synthesize Status_count;
@synthesize haveerror;
@synthesize Following;

//CREATE TABLE ttuser(id varchar(64) , name varchar(64) , screen_name varchar(64) , location varchar(64) , description varchar(64), profile_imag_url varchar(64), url varchar(64), protected varchar(64), followers_count varchar(64), friends_count varchar(64) , favourites_count varchar(64));


- (id)init
{
	if (self = [super init]) 
	{
		image=nil;
		haveerror=NO;
	}
	return self;
}





-(void) loadimage
{
	
		
		//self.image=[UChache cachedIconFromURL:self.Profile_image_url];
		
	
	
	/*
	
	NSMutableURLRequest *request;
	request = [[[NSMutableURLRequest alloc] init] autorelease];	
	[request setCachePolicy:NSURLRequestReturnCacheDataElseLoad];

	[request setURL:[NSURL URLWithString:self.Profile_image_url]];
	[request setHTTPMethod:@"GET"];
	
	NSURLResponse *response;
	NSError *error=nil;
	// Doing the request
	NSData *d = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	// checking the response
	if ( (d) && (error.code == 0))
	{
		//geting the document folder in orde to save the received image
		self.image =[[UIImage alloc] initWithData:d];
		if (self.image==nil) 
		{
			haveerror=YES;;

		}
		haveerror=NO;

	}
	else
	{
		self.image=nil;
		haveerror=YES;

	}
	 */
}



@end
