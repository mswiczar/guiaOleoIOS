//
//  UICellConfig.m
//
/*
 UILabel	*itemName;
 UILabel	*itemAddress;
 UILabel	*itemURL;
 UILabel *ItemTel;
 UStore * astore;
 
 */

#import "UICellRate2.h"

#import "oleoAppDelegate.h"


@implementation UICellRate2
@synthesize thestore;


- (id)initWithFrame:(CGRect)aRect reuseIdentifier:(NSString *)identifier
{
	if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier])
	{
		
		itemdesc = [[UILabel alloc] initWithFrame:aRect];
		itemdesc.backgroundColor = [UIColor clearColor];
		itemdesc.opaque = NO;
		itemdesc.textAlignment = UITextAlignmentLeft;
		itemdesc.textColor = [UIColor blackColor];
		itemdesc.highlightedTextColor = [UIColor blackColor];
		itemdesc.numberOfLines= 5;
		
		itemdesc.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
		itemdesc.font = [UIFont fontWithName:@"Arial-ItalicMT" size:12];

	
		[self.contentView addSubview:itemdesc];
//		self.contentView.backgroundColor = [UIColor clearColor];
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"vot_02_1.png"]];	

	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];

	CGRect frameItemnumber = CGRectMake(16,10,268, 74);
	itemdesc.frame = frameItemnumber;
	
}

- (void)dealloc
{
	[itemdesc release];
    [super dealloc];
}



-(void) showData
{
	itemdesc.text =[NSString stringWithFormat:@"%@", [thestore objectForKey:@"COMENTARIO"] ] ; 
}





@end


