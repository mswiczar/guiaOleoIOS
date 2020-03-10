//  UICellConfig.h

#import <UIKit/UIKit.h>

@interface UICellStore: UITableViewCell
{
	UILabel	*itemnumber;
	UILabel	*itemName;
	UILabel	*itemAddress1;
	UILabel	*itemAddress2;
	UILabel	*itemKM;
	UIButton *butoncall;
	NSMutableDictionary *thestore;
	BOOL is_yellow;
	
}

@property (nonatomic) BOOL is_yellow;
@property (nonatomic, assign) NSMutableDictionary * thestore;
-(void) showData;

@end
