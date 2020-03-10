//  UICellConfig.h

#import <UIKit/UIKit.h>

@interface UICellRate2: UITableViewCell
{
	UILabel	*itemdesc;
	NSMutableDictionary *thestore;
	
}

@property (nonatomic, assign) NSMutableDictionary * thestore;
-(void) showData;

@end
