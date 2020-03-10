
#import "CellMore.h"

@implementation CellMore




- (id)initWithFrame:(CGRect)aRect reuseIdentifier:(NSString *)identifier
{
	if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier])
	{
		/*
		theimage =[ [UIImageView  alloc] initWithFrame:CGRectZero];
		theimage.image = [UIImage imageNamed:@"Prox 10 Inactivo.png"];
		*/
		thesleep = [[UIActivityIndicatorView  alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		thesleep.hidesWhenStopped=YES;

		//[self.contentView addSubview:theimage];
		[self.contentView addSubview:thesleep];
		
		
		thelabel = [[UILabel alloc] initWithFrame:aRect];
		thelabel.backgroundColor = [UIColor clearColor];
		thelabel.opaque = NO;
		thelabel.textAlignment = UITextAlignmentCenter;
		thelabel.numberOfLines= 1;
		thelabel.text =@"Obtener mas resultados";
		thelabel.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
		thelabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:14];
		
		[self.contentView addSubview:thelabel];
		
	
	
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondocell.png"]];
	}
	return self;
}




- (void)layoutSubviews
{
	[super layoutSubviews];
	
	CGRect frameItemnAdress = CGRectMake(0,10,300, 30);
	thelabel.frame = frameItemnAdress;
	//theimage.frame = frameItemnAdress;

	frameItemnAdress = CGRectMake(145,17.5,20, 20);
	thesleep.frame= frameItemnAdress;

	
	
}

- (void)dealloc
{
	//[theimage release];
	[thelabel release];
	[thesleep release];
    [super dealloc];
}



-(void) start
{
	thelabel.alpha=0;
	//theimage.alpha=0;
	[thesleep startAnimating];
}

-(void) stop
{
	thelabel.alpha=1;
	//theimage.alpha=1;
	[thesleep stopAnimating];
}




@end


