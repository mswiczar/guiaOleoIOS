//
//  WSCall.h
//  Detelefoongids
//
//  Created by Moises Swiczar on 4/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define WITH_OFFLINE 0

@interface WSCallTwitt : NSObject 
{

}

+(NSInteger) DoLogin:(NSMutableDictionary *) alogin;
+(BOOL) DoUpdateStatus:(NSMutableDictionary *) alogin theid:(NSString*) theid themessage:(NSString*) themessage inreplyofstatus:(NSString*)inreplyofstatus;





@end
