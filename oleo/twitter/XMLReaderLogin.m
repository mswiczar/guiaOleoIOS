//
//  XMLReaderCategories.m
//  iPhoneList
//
//  Created by macmini on 01/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "XMLReaderLogin.h"


@implementation XMLReaderLogin
@synthesize curCategory;
@synthesize contentOfCurrentNoticia;
@synthesize afoundCDATA;


 



- (void)parserDidStartDocument:(NSXMLParser *)parser
{
	return;
}

- (NSInteger)parseXML: (NSString *)data theTWLoginData:(TWLoginData *) theTWLoginData

//- (NSInteger)parseXML: (NSString *)data 
{	
		
	BOOL salida;
	salida = YES;
	self.curCategory = nil;
//	DetelefoongidsAppDelegate *appDelegate = (DetelefoongidsAppDelegate *)[[UIApplication sharedApplication] delegate];
//	database = appDelegate.database;
	
	self.curCategory = theTWLoginData;
	
	NSData *d = [ data dataUsingEncoding:NSUTF8StringEncoding];
//	NSLog(data);
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:d];
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [parser setDelegate:self];
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
	is_user=NO;

    [parser parse];
    
    NSError *parseError = [parser parserError];
    if (parseError)  {
		salida = NO;
    }
	else
	{
		salida=YES;
	}

	
	[parser release];
	return salida;
	
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	
	
	
    if (qName) {
        elementName = qName;
    }
	
	
/*
	<user>
	<id>24254394</id>
	<name>Moises</name>
	<screen_name>mswiczar</screen_name>
	<location></location>
	<description></description>
	<profile_image_url>http://s3.amazonaws.com/twitter_production/profile_images/95396997/dolar_normal.jpg</profile_image_url>
	<url></url>
	<protected>false</protected>
	<followers_count>8</followers_count>
	<profile_background_color>9ae4e8</profile_background_color>
	<profile_text_color>000000</profile_text_color>
	<profile_link_color>0000ff</profile_link_color>
	<profile_sidebar_fill_color>e0ff92</profile_sidebar_fill_color>
	<profile_sidebar_border_color>87bc44</profile_sidebar_border_color>

	<created_at>Fri Mar 13 21:07:58 +0000 2009</created_at>
	<favourites_count>0</favourites_count>
	<utc_offset></utc_offset>
	<time_zone></time_zone>
	<profile_background_image_url>http://static.twitter.com/images/themes/theme1/bg.gif</profile_background_image_url>
	<profile_background_tile>false</profile_background_tile>
	<statuses_count>15</statuses_count>
	<notifications>false</notifications>
	<following>false</following>
	<status>
    <created_at>Sat May 23 05:43:17 +0000 2009</created_at>
    <id>1891055969</id>
    <text>Of Zoek in de Buurt</text>
    <source>web</source>
    <truncated>false</truncated>
    <in_reply_to_status_id></in_reply_to_status_id>
    <in_reply_to_user_id></in_reply_to_user_id>
    <favorited>false</favorited>
    <in_reply_to_screen_name></in_reply_to_screen_name>
	</status>
	</user>
	*/
	
    if ([elementName isEqualToString:@"user"]) 
	{
       // self.curCategory = [[TWLoginData alloc] init];
		self.contentOfCurrentNoticia = [[NSMutableString alloc] init];
		is_user=YES;
		return;
	
    }

    if ([elementName isEqualToString:@"status"]) 
	{
		// self.curCategory = [[TWLoginData alloc] init];
		self.contentOfCurrentNoticia = [[NSMutableString alloc] init];
		is_user=NO;
		return;
		
    }
	
	
    if ([elementName isEqualToString:@"id"]) 
	{
		self.contentOfCurrentNoticia = [[NSMutableString alloc] init];
		return;
		
    }
    if ([elementName isEqualToString:@"name"]) 
	{
		self.contentOfCurrentNoticia = [[NSMutableString alloc] init];
		return;
		
    }
    if ([elementName isEqualToString:@"screen_name"]) 
	{
		self.contentOfCurrentNoticia = [[NSMutableString alloc] init];
		return;
    }

	if ([elementName isEqualToString:@"profile_image_url"]) 
	{
		self.contentOfCurrentNoticia = [[NSMutableString alloc] init];
		return;
    }
	
	
	if ([elementName isEqualToString:@"created_at"]) 
	{
		self.contentOfCurrentNoticia = [[NSMutableString alloc] init];
		return;
    }
	
	
	if ([elementName isEqualToString:@"text"]) 
	{
		self.contentOfCurrentNoticia = [[NSMutableString alloc] init];
		return;
    }

	if ([elementName isEqualToString:@"followers_count"]) 
	{
		self.contentOfCurrentNoticia = [[NSMutableString alloc] init];
		return;
    }
	if ([elementName isEqualToString:@"friends_count"]) 
	{
		self.contentOfCurrentNoticia = [[NSMutableString alloc] init];
		return;
    }
	if ([elementName isEqualToString:@"statuses_count"]) 
	{
		self.contentOfCurrentNoticia = [[NSMutableString alloc] init];
		return;
    }
	
	
	
	
	
	

	
	
	
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
	self.afoundCDATA = 	CDATABlock;
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{   
    if (qName) {
        elementName = qName;
    }
	
	
    if ([elementName isEqualToString:@"user"]) 
	{
		if (self.curCategory!=nil)
		{
			NSLog(@"%@ , %@",curCategory.Name,curCategory.Id);
		}
    }

	
    if ([elementName isEqualToString:@"id"]) 
	{

		if 	(is_user=YES)
		{
			curCategory.Id = contentOfCurrentNoticia;
		};
		[contentOfCurrentNoticia release];
		return;
		
    }
    if ([elementName isEqualToString:@"name"]) 
	{
		curCategory.Name = contentOfCurrentNoticia;
		[contentOfCurrentNoticia release];
		return;
		
    }
    if ([elementName isEqualToString:@"screen_name"]) 
	{
		curCategory.Screen_name = contentOfCurrentNoticia;
		[contentOfCurrentNoticia release];
		return;
    }
	
	if ([elementName isEqualToString:@"profile_image_url"]) 
	{
		curCategory.Profile_image_url = contentOfCurrentNoticia;
		[contentOfCurrentNoticia release];
		return;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if (self.contentOfCurrentNoticia !=nil)
	{
		[self.contentOfCurrentNoticia appendString:string];
	};
}

@end
