//  UICellConfig.h

#import <UIKit/UIKit.h>

@interface UICellStoreDesc: UITableViewCell
{
	UILabel	*itemnumber;
	UILabel	*itemnumber2;

	UILabel	*itemName;
	UILabel	*itemAddress1;
	UILabel	*itemAddress2;
	UILabel	*itemKM;
	UIImageView *butoncall;
	NSMutableDictionary *thestore;
	BOOL is_yellow;
	
}

@property (nonatomic) BOOL is_yellow;
@property (nonatomic, assign) NSMutableDictionary * thestore;
-(void) showData;

@end
