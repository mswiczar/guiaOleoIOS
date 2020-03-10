//
//  StorePick.m
//  Detelefoongids
//
//  Created by Moises Swiczar on 6/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StorePick.h"


@implementation StorePick


@synthesize coordinate;
@synthesize thestore;
@synthesize thepos;


- (NSString *)subtitle{
	
	if([thestore objectForKey:@"DIRECCION1"]!=nil)
	{
		return [NSString stringWithFormat:@"%@ %@", [thestore objectForKey:@"DIRECCION1"] , [thestore objectForKey:@"DIRECCION2"] ];
	}
	return @"";

}
- (NSString *)title{
	if([thestore objectForKey:@"NOMBRE"]!=nil)
	{
		return [NSString stringWithFormat:@"%@", [thestore objectForKey:@"NOMBRE"] ];
	
	}
	return @"";
	
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	coordinate=c;
	NSLog(@"%f,%f",c.latitude,c.longitude);
	return self;
}
@end

