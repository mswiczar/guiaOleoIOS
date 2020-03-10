//  UICellRate1.h

#import <UIKit/UIKit.h>

@interface UICellRate1: UITableViewCell
{
	UILabel	*labledelusuario;
	UILabel	*labelusername;
	UILabel	*labelfecha;
	UIImageView * theimagestars;
	NSMutableDictionary *thestore;
	
}

@property (nonatomic, assign) NSMutableDictionary * thestore;
-(void) showData;

@end
