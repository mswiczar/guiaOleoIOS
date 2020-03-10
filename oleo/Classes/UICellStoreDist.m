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

#import "UICellStoreDist.h"

#import "oleoAppDelegate.h"


@implementation UICellStoreDist
@synthesize thestore;
@synthesize is_yellow;


-(void)clickonbutton:(id)aobj
{
	if ([[thestore objectForKey:@"TEL1"] length]!=0)
	{
		
		NSMutableString *aux = [[NSMutableString alloc] initWithString:[[thestore objectForKey:@"TEL1"] uppercaseString]];
		
		
		[aux replaceOccurrencesOfString:@"A" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"B" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"C" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"D" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"E" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"F" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"G" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"H" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"I" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"J" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"K" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"L" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"M" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"N" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"O" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"P" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"Q" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"R" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"S" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"T" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"U" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"V" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"W" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"X" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"Y" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"Z" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		
		
		
		[aux replaceOccurrencesOfString:@"(" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@")" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"-" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux length])];
		
		
		NSRange therange = [aux rangeOfString:@"/"];
		NSString *url;
		if (therange.length==0)
		{
			[aux replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux length])];
			if ([[aux substringToIndex:2]isEqualToString:@"08"])
			{
				url = [NSString stringWithFormat: @"tel://%@",[NSString stringWithFormat: @"%@",aux]];
			}
			else 
			{
				if ([aux length]>8)
				{
					url = [NSString stringWithFormat: @"tel://%@",[aux substringToIndex:8]];
					
				}
				else {
					url = [NSString stringWithFormat: @"tel://%@",aux];
				}
			}
			
		}
		else {
			
			url = [NSString stringWithFormat: @"tel://%@",[aux substringToIndex:therange.location]];
			
		}
		
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];			
	}
	else
	{
		UIAlertView *aview= [[UIAlertView alloc] initWithTitle:@"Guía Oleo" message:@"No hay numero telefonico." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[aview show];
		[aview release];
	}
}

- (id)initWithFrame:(CGRect)aRect reuseIdentifier:(NSString *)identifier
{
	
	//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier 
	//if (self = [super initWithFrame:aRect reuseIdentifier:identifier])
	if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier])
	
	{
		
		itemnumber = [[UILabel alloc] initWithFrame:aRect];
		itemnumber.backgroundColor = [UIColor clearColor];
		itemnumber.opaque = NO;
		itemnumber.textAlignment = UITextAlignmentRight;
		itemnumber.textColor = [UIColor blackColor];
		itemnumber.highlightedTextColor = [UIColor blackColor];
		itemnumber.font = [UIFont boldSystemFontOfSize:14];
		itemnumber.numberOfLines= 1;
		
		
		itemName = [[UILabel alloc] initWithFrame:aRect];
		itemName.backgroundColor = [UIColor clearColor];
		itemName.opaque = NO;
		itemName.textAlignment = UITextAlignmentLeft;
		itemName.highlightedTextColor = [UIColor blackColor];
		itemName.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
		itemName.font = [UIFont fontWithName:@"Arial-BoldMT" size:14];
		itemName.adjustsFontSizeToFitWidth=YES;
		itemName.numberOfLines= 1;


		itemAddress1 = [[UILabel alloc] initWithFrame:aRect];
		itemAddress1.backgroundColor = [UIColor clearColor];
		itemAddress1.opaque = NO;
		itemAddress1.textAlignment = UITextAlignmentLeft;
		itemAddress1.highlightedTextColor = [UIColor blackColor];
		itemAddress1.font = [UIFont fontWithName:@"Arial" size:12];
		itemAddress1.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];

		itemAddress1.numberOfLines= 1;

		itemAddress2 = [[UILabel alloc] initWithFrame:aRect];
		itemAddress2.backgroundColor = [UIColor clearColor];
		itemAddress2.opaque = NO;
		itemAddress2.textAlignment = UITextAlignmentLeft;
		itemAddress2.highlightedTextColor = [UIColor blackColor];
		itemAddress2.font = [UIFont fontWithName:@"Arial" size:12];
		itemAddress2.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];

		itemAddress2.numberOfLines= 1;

		itemKM = [[UILabel alloc] initWithFrame:aRect];
		itemKM.backgroundColor = [UIColor clearColor];
		itemKM.opaque = NO;
		itemKM.textAlignment = UITextAlignmentLeft;
		itemKM.textColor = [UIColor blackColor];
		itemKM.highlightedTextColor = [UIColor blackColor];
		itemKM.font = [UIFont boldSystemFontOfSize:11];
		itemKM.numberOfLines= 1;
		
		/*
		viewbg = [[UIImageView  alloc] initWithFrame:CGRectNull];
		viewbg.image = [UIImage imageNamed:@"row_cell_phone.png"];
		*/

		
		butoncall = [[UIButton alloc] init];
		[butoncall addTarget:self action:@selector(clickonbutton:) forControlEvents:UIControlEventTouchUpInside];

		[butoncall setBackgroundImage:[UIImage imageNamed:@"btn_call.png"] forState:0];
	
	

		
//		[self.contentView addSubview:viewbg];
	
		[self.contentView addSubview:itemnumber];
		[self.contentView addSubview:itemName];
		[self.contentView addSubview:itemAddress1];
		[self.contentView addSubview:itemAddress2];
		oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
		if (appDelegate.is_ipod==NO)
		{
			[self.contentView addSubview:butoncall];
			self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondocelliphone.png"]];	
		
		}
		else 
		{
			self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondocell.png"]];	
		}
	


		
		
	//	[self.contentView addSubview:itemKM];
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondocell.png"]];

		
//		self.contentView.backgroundColor = [UIColor clearColor];
	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	if (appDelegate.is_ipod==NO)
	{	
		CGRect frameItemnumber = CGRectMake(30,5,20, 20);
		itemnumber.frame = frameItemnumber;

		CGRect frameItemName = CGRectMake(50,5,220, 20);
		itemName.frame = frameItemName;

		CGRect frameItemnAdress1 = CGRectMake(50,20,230, 20);
		itemAddress1.frame = frameItemnAdress1;

		CGRect frameItemnAdress2 = CGRectMake(50,35,200, 20);
		itemAddress2.frame = frameItemnAdress2;

		CGRect frameItemitemKM = CGRectMake(185,30,40, 30);
		itemKM.frame = frameItemitemKM;

		CGRect frameItemImage = CGRectMake(2.5,2.5,45, 56);
		butoncall.frame = frameItemImage;
	}
	else {
		CGRect frameItemnumber = CGRectMake(30,5,20, 20);
		itemnumber.frame = frameItemnumber;
		
		CGRect frameItemName = CGRectMake(10,5,220, 20);
		itemName.frame = frameItemName;
		
		CGRect frameItemnAdress1 = CGRectMake(10,20,230, 20);
		itemAddress1.frame = frameItemnAdress1;
		
		CGRect frameItemnAdress2 = CGRectMake(10,35,200, 20);
		itemAddress2.frame = frameItemnAdress2;
		
		CGRect frameItemitemKM = CGRectMake(185,30,40, 30);
		itemKM.frame = frameItemitemKM;
		
		CGRect frameItemImage = CGRectMake(0,0,45, 60);
		butoncall.frame = frameItemImage;
		
	}

	
	
	
}

- (void)dealloc
{
	[itemName release];
	[itemnumber release];
	[itemAddress1 release];
	[itemAddress2 release];
	[itemKM release];
    [butoncall release];
    [super dealloc];
}



/*
 @"NOMBRE"
 @"DIRECCION1"
 @"DIRECCION2"
 @"COCINA"
 @"TEL1"
 @"TEL2"
 @"LAT"
 @"LONG"
 @"MINIIMAGE1"
 @"MINIIMAGE2"
 @"MINIIMAGE3"
 @"MINIIMAGE4"
 @"IMAGE1"
 @"IMAGE2"
 @"IMAGE3"
 @"IMAGE4"
 @"HORARIOS"
 @"VOTOCOMIDA"
 @"VOTOSERVICIO"
 @"VOTOAMBIENTE"
 @"PRECIOD"
 @"PRECION"
 @"VOTOS"
 @"DISTANCIA"
 */


-(void) showData
{
	//itemnumber.text = [NSString stringWithFormat:@"%d", 1] ; 
	itemName.text =[NSString stringWithFormat:@"%@", [[thestore objectForKey:@"NOMBRE"]uppercaseString]] ; 
	itemAddress1.text = [NSString stringWithFormat:@"%@", [thestore objectForKey:@"DIRECCION1"]] ;  
	itemAddress2.text = [NSString stringWithFormat:@"%@", [thestore objectForKey:@"DIRECCION2"] ] ;  
	
	if (([[thestore objectForKey:@"DISTANCIA"] intValue]/1000) < 1)
	{
		itemKM.text = [NSString stringWithFormat:@"(%d m)", [[thestore objectForKey:@"DISTANCIA"]intValue] ] ;  
	}
	else 
	{
		itemKM.text = [NSString stringWithFormat:@"(%.2f km)", ([[thestore objectForKey:@"DISTANCIA"] floatValue]/1000) ] ;  
		
	}

	itemAddress2.text = [NSString stringWithFormat:@"%@. %@", [thestore objectForKey:@"DIRECCION2"],itemKM.text ] ;  

	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
/*
	if (buttonIndex==1)
	{
		NSMutableString *aux = [[NSMutableString alloc] initWithString:self.thestore.tel];
		[aux replaceOccurrencesOfString:@"(" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@")" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
		[aux replaceOccurrencesOfString:@"-" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux length])];
		[aux replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux length])];
		NSString *url = [NSString stringWithFormat: @"tel://%@",aux];
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];	
	};
 */
	
}




@end


