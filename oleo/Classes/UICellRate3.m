#import "UICellRate3.h"
#import "oleoAppDelegate.h"


@implementation UICellRate3
@synthesize thestore;



- (id)initWithFrame:(CGRect)aRect reuseIdentifier:(NSString *)identifier
{
	if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier])
	{
		
		
		
		label_comida = [[UILabel alloc] initWithFrame:aRect];
		label_comida.backgroundColor = [UIColor clearColor];
		label_comida.opaque = NO;
		label_comida.textAlignment = UITextAlignmentLeft;
		label_comida.textColor = [UIColor blackColor];
		label_comida.highlightedTextColor = [UIColor blackColor];
		label_comida.numberOfLines= 1;

		label_comida.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
		label_comida.font = [UIFont fontWithName:@"Arial" size:12];

		
		
		label_servicio = [[UILabel alloc] initWithFrame:aRect];
		label_servicio.backgroundColor = [UIColor clearColor];
		label_servicio.opaque = NO;
		label_servicio.textAlignment = UITextAlignmentLeft;
		label_servicio.textColor = [UIColor blackColor];
		label_servicio.highlightedTextColor = [UIColor blackColor];
		label_servicio.numberOfLines= 1;
		label_servicio.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
		label_servicio.font = [UIFont fontWithName:@"Arial" size:12];

		
		
		label_ambiente = [[UILabel alloc] initWithFrame:aRect];
		label_ambiente.backgroundColor = [UIColor clearColor];
		label_ambiente.opaque = NO;
		label_ambiente.textAlignment = UITextAlignmentLeft;
		label_ambiente.textColor = [UIColor blackColor];
		label_ambiente.highlightedTextColor = [UIColor blackColor];
		label_ambiente.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
		label_ambiente.font = [UIFont fontWithName:@"Arial" size:12];

		label_ambiente.numberOfLines= 1;
		
		
		image_comida = [[UIImageView  alloc] initWithFrame:CGRectNull];
		image_comida.image = [UIImage imageNamed:@"row_cell_phone.png"];
		image_comida.contentMode = UIViewContentModeCenter;

		
		image_servicio = [[UIImageView  alloc] initWithFrame:CGRectNull];
		image_servicio.image = [UIImage imageNamed:@"row_cell_phone.png"];
		image_servicio.contentMode = UIViewContentModeCenter;

		image_ambiente = [[UIImageView  alloc] initWithFrame:CGRectNull];
		image_ambiente.image = [UIImage imageNamed:@"row_cell_phone.png"];
		image_ambiente.contentMode = UIViewContentModeCenter;

		
		
		[self.contentView addSubview:label_comida];
		[self.contentView addSubview:label_servicio];
		[self.contentView addSubview:label_ambiente];
		
		[self.contentView addSubview:image_comida];
		[self.contentView addSubview:image_servicio];
		[self.contentView addSubview:image_ambiente];

		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"vot_03_1.png"]];	

		self.contentView.backgroundColor = [UIColor clearColor];
	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	CGRect frameItemnumber = CGRectMake(16,8,45, 20);
	label_comida.frame = frameItemnumber;

	CGRect frameItemnAdress2 = CGRectMake(65-8,12,40, 14);
	image_comida.frame = frameItemnAdress2;

	
	CGRect frameItemName = CGRectMake(104,8,50, 20);
	label_servicio.frame = frameItemName;

	
	CGRect frameItemitemKM = CGRectMake(154-8,12,40, 14);
	image_servicio.frame = frameItemitemKM;

	
	CGRect frameItemnAdress1 = CGRectMake(194,8,62, 20);
	label_ambiente.frame = frameItemnAdress1;



	CGRect frameItemImage = CGRectMake(253-8,12,40, 14);
	image_ambiente.frame = frameItemImage;
	
	
	
}

- (void)dealloc
{
	
	[self.contentView addSubview:label_comida];
	[self.contentView addSubview:label_servicio];
	[self.contentView addSubview:label_ambiente];
	
	[self.contentView addSubview:image_comida];
	[self.contentView addSubview:image_servicio];
	[self.contentView addSubview:image_ambiente];
	
	[label_comida release];
	[label_servicio release];
	[label_ambiente release];
	
	[image_comida release];
	[image_servicio release];
    [image_ambiente release];
	
    [super dealloc];
}



-(void) showData
{
	
	
	

	
	label_comida.text =[NSString stringWithFormat:@"%@", @"Comida"] ; 
	label_servicio.text = [NSString stringWithFormat:@"%@", @"Servicio"] ;  
	label_ambiente.text = [NSString stringWithFormat:@"%@", @"Ambiente"] ;  

	
	
	
	image_comida.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@_4_tiers.png",[thestore objectForKey:@"COMIDA"]]];
	image_servicio.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@_4_tiers.png",[thestore objectForKey:@"SERVICIO"]]];
	image_ambiente.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@_4_tiers.png",[thestore objectForKey:@"AMBIENTE"]]];


	
}



@end


