#import "UICellRate1.h"
#import "oleoAppDelegate.h"


@implementation UICellRate1
@synthesize thestore;



- (id)initWithFrame:(CGRect)aRect reuseIdentifier:(NSString *)identifier
{
	if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier])
	{
		labledelusuario = [[UILabel alloc] initWithFrame:aRect];
		labledelusuario.backgroundColor = [UIColor clearColor];
		labledelusuario.opaque = NO;
		labledelusuario.textAlignment = UITextAlignmentLeft;
		labledelusuario.highlightedTextColor = [UIColor blackColor];
		labledelusuario.numberOfLines= 1;
		labledelusuario.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
		labledelusuario.font = [UIFont fontWithName:@"Arial" size:12];
		
		
		labelusername = [[UILabel alloc] initWithFrame:aRect];
		labelusername.backgroundColor = [UIColor clearColor];
		labelusername.opaque = NO;
		labelusername.textAlignment = UITextAlignmentLeft;
		labelusername.textColor = [UIColor blackColor];
		labelusername.highlightedTextColor = [UIColor blackColor];
		labelusername.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
		labelusername.font = [UIFont fontWithName:@"Arial" size:12];
	
		labelusername.numberOfLines= 1;

		labelfecha = [[UILabel alloc] initWithFrame:aRect];
		labelfecha.backgroundColor = [UIColor clearColor];
		labelfecha.opaque = NO;
		labelfecha.textAlignment = UITextAlignmentLeft;
		labelfecha.textColor = [UIColor blackColor];
		labelfecha.highlightedTextColor = [UIColor blackColor];
		labelfecha.numberOfLines= 1;
		labelfecha.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
		labelfecha.font = [UIFont fontWithName:@"Arial" size:12];

		theimagestars = [[UIImageView  alloc] initWithFrame:CGRectNull];
		theimagestars.contentMode = UIViewContentModeCenter;
		theimagestars.image = [UIImage imageNamed:@"row_cell_phone.png"];

		[self.contentView addSubview:labledelusuario];
		[self.contentView addSubview:labelusername];
		[self.contentView addSubview:theimagestars];
		[self.contentView addSubview:labelfecha];
		self.contentView.backgroundColor = [UIColor clearColor];
		
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"vot_01_1.png"]];	
	
	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	CGRect frameItemnumber = CGRectMake(16,14,65, 15);
	labledelusuario.frame = frameItemnumber;

	CGRect frameItemName = CGRectMake(84,14,70, 15);
	labelusername.frame = frameItemName;

	CGRect frameItemnAdress1 = CGRectMake(160,13,40, 15);
	theimagestars.frame = frameItemnAdress1;

	CGRect frameItemnAdress2 = CGRectMake(212,14,85, 15);
	labelfecha.frame = frameItemnAdress2;
	
}

- (void)dealloc
{
	[labledelusuario release];
	[labelusername release];
	[theimagestars release];
	[labelfecha release];
    [super dealloc];
}


-(void) showData
{
	
	

	labledelusuario.text =[NSString stringWithFormat:@"%@", @"Del usuario:"] ; 
	labelusername.text = [NSString stringWithFormat:@"%@", [thestore objectForKey:@"USUARIO"]] ;  
	labelfecha.text = [NSString stringWithFormat:@"%@ %@", @"el:",[thestore objectForKey:@"FECHA"] ] ;  
	//	[thestore objectForKey:@"STARTS"]	 ;
	//theimagestars.image =[UIImage imageNamed:@"2_4_stars.png"];
	theimagestars.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@_4_stars.png",[thestore objectForKey:@"STARTS"]]];

}




@end


