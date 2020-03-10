//  UICellConfig.h

#import <UIKit/UIKit.h>

@interface UICellRate3: UITableViewCell
{
	UILabel	*label_comida;
	UILabel	*label_servicio;
	UILabel	*label_ambiente;

	UIImageView * image_comida;
	UIImageView * image_servicio;
	UIImageView * image_ambiente;

	NSMutableDictionary *thestore;
	
}

@property (nonatomic, assign) NSMutableDictionary * thestore;
-(void) showData;

@end
