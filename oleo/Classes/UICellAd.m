

#import "UICellAd.h"


/*
 
 UILabel	*itemName;
 UILabel	*itemDescriptionL1;
 UILabel	*itemDescriptionL2;
 UILabel	*itemDescriptionURL;
 UIImageView *aviewImage;
 UAD * aAd;
 
 
 */



@implementation UICellAd


//@synthesize aAd;

- (id)initWithFrame:(CGRect)aRect reuseIdentifier:(NSString *)identifier
{
	if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier])
	{
		
		itemName = [[UILabel alloc] initWithFrame:aRect];
		itemName.backgroundColor = [UIColor clearColor];
		itemName.opaque = NO;
		itemName.textAlignment = UITextAlignmentLeft;
		itemName.textColor = [UIColor blackColor];
		itemName.highlightedTextColor = [UIColor blackColor];
		itemName.font = [UIFont boldSystemFontOfSize:14];
		itemName.numberOfLines= 1;

		
		itemDescriptionL1 = [[UILabel alloc] initWithFrame:aRect];
		itemDescriptionL1.backgroundColor = [UIColor clearColor];
		itemDescriptionL1.opaque = NO;
		itemDescriptionL1.textAlignment = UITextAlignmentLeft;
		itemDescriptionL1.textColor = [UIColor grayColor];
		itemDescriptionL1.highlightedTextColor = [UIColor blackColor];
		itemDescriptionL1.font = [UIFont systemFontOfSize:11];
		itemDescriptionL1.numberOfLines= 1;
		



		itemDescriptionL2 = [[UILabel alloc] initWithFrame:aRect];
		itemDescriptionL2.backgroundColor = [UIColor clearColor];
		itemDescriptionL2.opaque = NO;
		itemDescriptionL2.textAlignment = UITextAlignmentLeft;
		itemDescriptionL2.textColor = [UIColor blackColor];
		itemDescriptionL2.highlightedTextColor = [UIColor blackColor];
		itemDescriptionL2.font = [UIFont systemFontOfSize:11];
		
		
		
		
		[self.contentView addSubview:itemName];
		[self.contentView addSubview:itemDescriptionL1];
		[self.contentView addSubview:itemDescriptionL2];

		
		
		self.contentView.backgroundColor = [UIColor clearColor];
	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	

	CGRect frameItemName = CGRectMake(25,5,250, 20);
	itemName.frame = frameItemName;
	
	frameItemName = CGRectMake(25,25,250, 20);
	itemDescriptionL1.frame = frameItemName;
	
	frameItemName = CGRectMake(25,40,250, 20);
	itemDescriptionL2.frame = frameItemName;


	
	
	
}

- (void)dealloc
{
	
	[itemName release];
	[itemDescriptionL1 release];
	[itemDescriptionL2 release];
    [super dealloc];
}




-(void) showData
{
//	itemName.text= [NSString stringWithFormat:@"%@", aAd.itemName ];
//	itemDescriptionL1.text=[NSString stringWithFormat:@"%@",aAd.itemDescriptionL1 ] ;
//	itemDescriptionL2.text=[NSString stringWithFormat:@"%@",aAd.itemDescriptionL2 ] ;
	
}


@end


