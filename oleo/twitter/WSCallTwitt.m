//
//  WSCall.m
//

/*
 +(void) setHtml:(NSString*) thestringURL thecontents:(NSString*)  thecontents;
 + (NSString*)GetHmtl:(NSString*)theURL;
 
+(BOOL) DoGetIdolsaarray:(NSMutableArray*)aarray;
+(BOOL) DoGetTimeline:(NLogin *) alogin aarray:(NSMutableArray*)aarray;
+(BOOL) DoGetTimeline2:(NLogin *) alogin screenname:(NSString *)screenname aarray:(NSMutableArray*)aarray;
+(BOOL) DoGetFollowers:(NLogin *) alogin aarray:(NSMutableArray*)aarray thenametoview:(NSString*) thenametoview;
+(BOOL) DoGetFollowings:(NLogin *) alogin aarray:(NSMutableArray*)aarray thenametoview:(NSString*) thenametoview;
+(BOOL) DoGetFavorites:(NLogin *) alogin aarray:(NSMutableArray*)aarray;
+(BOOL) DoGetUpdates:(NLogin *) alogin aarray:(NSMutableArray*)aarray thenametoview:(NSString*) thenametoview;
*/


#import "WSCallTwitt.h"
#import "XMLReaderLogin.h"
#import "UChache.h"

@implementation WSCallTwitt

NSString *authenti64;

static char base64[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
"abcdefghijklmnopqrstuvwxyz"
"0123456789"
"+/";

int encode(unsigned s_len, char *src, unsigned d_len, char *dst)
{
	unsigned triad;
	
	for (triad = 0; triad < s_len; triad += 3)
	{
		unsigned long int sr;
		unsigned byte;
		
		for (byte = 0; (byte<3)&&(triad+byte<s_len); ++byte)
		{
			sr <<= 8;
			sr |= (*(src+triad+byte) & 0xff);
		}
		
		sr <<= (6-((8*byte)%6))%6; /*shift left to next 6bit alignment*/
		
		if (d_len < 4) return 1; /* error - dest too short */
		
		*(dst+0) = *(dst+1) = *(dst+2) = *(dst+3) = '=';
		switch(byte)
		{
			case 3:
				*(dst+3) = base64[sr&0x3f];
				sr >>= 6;
			case 2:
				*(dst+2) = base64[sr&0x3f];
				sr >>= 6;
			case 1:
				*(dst+1) = base64[sr&0x3f];
				sr >>= 6;
				*(dst+0) = base64[sr&0x3f];
		}
		dst += 4; d_len -= 4;
	}
	
	return 0;
	
}



+(BOOL) rateExceed:(NSString *)thetext
{
	char* data = (char*)[thetext UTF8String];
	if (strstr(data,"<error>")!=NULL)
	{
		UIAlertView * alert= [[UIAlertView alloc] initWithTitle:@"Twitter Server Error!" message:@"Limit exceeded,\nClients may not make more than 100 requests per hour" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
		return NO;
	}
	return YES;
}

+(NSInteger) DoLogin:(NSMutableDictionary *) alogin
{
	NSMutableString *dataStr = (NSMutableString*)[@"" stringByAppendingFormat:@"%@:%@", [alogin objectForKey:@"username"], [alogin objectForKey:@"password"]];
	NSData *encodeData = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
	char encodeArray[512];
	memset(encodeArray, '\0', sizeof(encodeArray));
	// Base64 Encode username and password
	encode([encodeData length], (char *)[encodeData bytes], sizeof(encodeArray), encodeArray);	
	dataStr = [NSString stringWithCString:encodeArray length:strlen(encodeArray)];
	authenti64 = [@"" stringByAppendingFormat:@"Basic %@", dataStr];

	NSMutableURLRequest *request;
	request = [[[NSMutableURLRequest alloc] init] autorelease];	
	[request setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
	NSString *urlstr =@"http://twitter.com/account/verify_credentials.xml";
	[request setURL:[NSURL URLWithString:urlstr]];
	[request setHTTPMethod:@"GET"];
	[request addValue:authenti64 forHTTPHeaderField:@"Authorization"];
	
	NSURLResponse *response;
	NSError *error=nil;
	BOOL salida=NO;
	NSData *d;
	d = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	if ( (d) && (error.code == 0))
	{
		NSString *myResponse = [ [NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
		if ([WSCallTwitt rateExceed:myResponse])
		{
				salida= YES;
		}
		else
		{
			salida= NO;
		}
		
	}
		
	return salida;
}











+(BOOL) DoUpdateStatus:(NSMutableDictionary *) alogin theid:(NSString*) theid themessage:(NSString*) themessage inreplyofstatus:(NSString*)inreplyofstatus
{
	NSMutableString *dataStr = (NSMutableString*)[@"" stringByAppendingFormat:@"%@:%@", [alogin objectForKey:@"username"],[alogin objectForKey:@"password"]];
	
	NSData *encodeData = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
	char encodeArray[512];
	memset(encodeArray, '\0', sizeof(encodeArray));
	
	// Base64 Encode username and password
	encode([encodeData length], (char *)[encodeData bytes], sizeof(encodeArray), encodeArray);	
	dataStr = [NSString stringWithCString:encodeArray length:strlen(encodeArray)];
	authenti64 = [@"" stringByAppendingFormat:@"Basic %@", dataStr];
	
	
	NSString *string =  [[NSString alloc] initWithString:@""];
	if (inreplyofstatus!=nil)
	{
		string = [NSString stringWithFormat:@"status=%@&in_reply_to_status_id=%@",themessage  ,inreplyofstatus];
	}
	else
	{
		string = [NSString stringWithFormat:@"status=%@",themessage];
	}
	
//	RobtwitterAppDelegate *appDelegate = (RobtwitterAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	
//	string = [NSString stringWithFormat:@"%@lat=%@&long=%@",string ,appDelegate.aloc.latitude,appDelegate.aloc.longitude];
	
	
	
	NSNumber *length =[NSNumber numberWithUnsignedInteger:string.length];
	NSString *postLength = [length stringValue];
	
	
	
	NSMutableURLRequest *request;
	request = [[[NSMutableURLRequest alloc] init] autorelease];	
	[request setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];

	
	
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setHTTPBody:[string dataUsingEncoding:NSUTF8StringEncoding]];
	
	
	[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://twitter.com/statuses/update.xml"]]];
	[request setHTTPMethod:@"POST"];
	
	//	user 
	//text 
	
	[request addValue:authenti64 forHTTPHeaderField:@"Authorization"];
	
	
	NSURLResponse *response;
	NSError *error=nil;
	// Doing the request
	NSData *d = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	// checking the response
	
	if ( (d) && (error.code == 0))
	{
		//		NSString *myResponse = [ [NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];		
		//		XMLReaderTimeline *ret = [[XMLReaderTimeline alloc] init];		
		//		[ret parseXML:myResponse thearray:aarray ];
		
		//		[myResponse release];
		//		[ret release];
		return YES;
	}
	else
	{
		return NO;
	}
	return NO;	
	
}




@end