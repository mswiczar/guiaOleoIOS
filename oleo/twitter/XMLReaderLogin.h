//
//  XMLReaderCategories.h
//
//  Created by macmini on 01/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

//This class is used to parse the result of the detelefoongids query.

#import <Foundation/Foundation.h>

#import "TWLoginData.H"

@interface XMLReaderLogin: NSObject {
	
@private
    NSMutableString * contentOfCurrentNoticia;
	NSData          * afoundCDATA;
	TWLoginData     * curCategory;
	BOOL is_user;
}


@property (nonatomic, retain) NSMutableString  * contentOfCurrentNoticia;
@property (nonatomic , copy)  NSData           * afoundCDATA;
@property (nonatomic ,retain)  TWLoginData     * curCategory;
 

- (NSInteger)parseXML: (NSString *)data theTWLoginData:(TWLoginData *) theTWLoginData ;
@end
