
#import "XMLReaderLite.h"



@implementation XMLReaderLite
@synthesize error;
@synthesize contentOfContact;
@synthesize resultData;
@synthesize resultname;


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (qName) {
        elementName = qName;
    }
	
    if ([elementName isEqualToString:resultname]) 
	{
		contentOfContact = [[NSMutableString alloc] init];
	}

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{     
    if (qName) 
	{
        elementName = qName;
    }
	
	if ([elementName isEqualToString:resultname]) 
	{
		self.resultData =   contentOfContact ;
		[contentOfContact release];
		contentOfContact = nil;
	}

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if (contentOfContact != nil)
	{
		[self.contentOfContact appendString:string];
	}
}



//this function will return YES if whas parsed ok.
// need to check the resultstring in order to get the parsed data
- (BOOL)parseXML: (NSString *)data;
{	
	if (error != nil) 
	{
		[error release];
	}
    error= [NSError alloc];
	BOOL salida;
	salida = YES;
	
	NSData *d = [ data dataUsingEncoding:NSUTF8StringEncoding];
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:d];
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [parser setDelegate:self];
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
    
    [parser parse];
    
    NSError *parseError = [parser parserError];
    if (parseError && error) {
        error = parseError;
		salida =NO;
    }
    [parser release];
	return salida;
	
}



@end