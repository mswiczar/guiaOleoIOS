#import <Foundation/Foundation.h>


//This class is a multipropouse parser in order to retrieve just one value.



@interface XMLReaderLite : NSObject
{
	NSError *error;
    NSMutableString *contentOfContact;
	NSString* resultData;
	NSString *resultname;
}

@property (nonatomic, retain) NSError *error;
@property (nonatomic, retain) NSMutableString *contentOfContact;
@property ( nonatomic,copy) NSString* resultData;
@property (nonatomic, retain) NSString *resultname;

- (BOOL)parseXML: (NSString *)data;

@end

