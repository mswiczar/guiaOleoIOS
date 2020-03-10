//  UICellConfig.h

#import <UIKit/UIKit.h>
//#import "UStore.h"
//#import "UAD.h"
#define kUISourceAd  @"CellsourceAd"

@interface UICellAd: UITableViewCell
{
	UILabel	*itemName;
	UILabel	*itemDescriptionL1;
	UILabel	*itemDescriptionL2;
//	UAD * aAd;
}


//@property (nonatomic, assign) UAD * aAd;
-(void) showData;

@end
