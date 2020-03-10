

#import "UICellRanking.h"

#import "oleoAppDelegate.h"


@implementation UICellRanking
@synthesize itemName;


- (id)initWithFrame:(CGRect)aRect reuseIdentifier:(NSString *)identifier
{
	
	if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier])
	
	{
		
		
		theview = [[UIImageView alloc]initWithFrame:aRect];
		theview.image = [UIImage imageNamed:@"fondocell.png"];
		
		itemName = [[UILabel alloc] initWithFrame:aRect];
		itemName.backgroundColor = [UIColor clearColor];
		itemName.opaque = NO;
		itemName.textAlignment = UITextAlignmentLeft;
		//itemName.textColor = [UIColor blackColor];
		itemName.highlightedTextColor = [UIColor blackColor];
		//itemName.font = [UIFont boldSystemFontOfSize:14];
		itemName.numberOfLines= 1;
		itemName.font = [UIFont fontWithName:@"Arial-BoldMT" size:14];
		itemName.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];

		
	
		[self.contentView addSubview:theview];
		[theview addSubview:itemName];
		
		//self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondocell.png"]];
		//self.backgroundColor = [UIColor colorWithPatternImage:];


	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	CGRect frameItemName = CGRectMake(0,0,320,47);
	theview.frame = frameItemName;

	 frameItemName = CGRectMake(10,13,260, 20);
	itemName.frame = frameItemName;

	
	
}

- (void)dealloc
{
	[itemName release];
	[theview release];
    [super dealloc];
}







@end


