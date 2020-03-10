//  UICellConfig.h

#import <UIKit/UIKit.h>
@interface CellMore: UITableViewCell
{
	//UIImageView * theimage;
	UILabel * thelabel;
	
	UIActivityIndicatorView * thesleep;
}

-(void) start;
-(void) stop;
 
@end





