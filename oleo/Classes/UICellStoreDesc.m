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

#import "UICellStoreDesc.h"

#import "oleoAppDelegate.h"


@implementation UICellStoreDesc
@synthesize thestore;
@synthesize is_yellow;


-(void)clickonbutton:(id)aobj
{

}

- (id)initWithFrame:(CGRect)aRect reuseIdentifier:(NSString *)identifier
{
	//if (self = [super initWithFrame:aRect reuseIdentifier:identifier])
	if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier])

	{
		
		itemnumber = [[UILabel alloc] initWithFrame:aRect];
		itemnumber.backgroundColor = [UIColor clearColor];
		itemnumber.opaque = NO;
		itemnumber.textAlignment = UITextAlignmentCenter;
		itemnumber.textColor = [UIColor colorWithRed:.58 green:.73 blue:0.4 alpha:1];
		itemnumber.font = [UIFont boldSystemFontOfSize:17];
		itemnumber.numberOfLines= 1;

		itemnumber2 = [[UILabel alloc] initWithFrame:aRect];
		itemnumber2.backgroundColor = [UIColor clearColor];
		itemnumber2.opaque = NO;
		itemnumber2.textAlignment = UITextAlignmentCenter;
		itemnumber2.textColor = [UIColor colorWithRed:.58 green:.73 blue:0.4 alpha:1];
		itemnumber2.font = [UIFont boldSystemFontOfSize:17];
		itemnumber2.numberOfLines= 1;
		
		
		itemName = [[UILabel alloc] initWithFrame:aRect];
		itemName.backgroundColor = [UIColor clearColor];
		itemName.opaque = NO;
		itemName.textAlignment = UITextAlignmentLeft;
		itemName.numberOfLines= 1;
		itemName.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
		itemName.font = [UIFont fontWithName:@"Arial-BoldMT" size:14];
		itemName.adjustsFontSizeToFitWidth=YES;


		itemAddress1 = [[UILabel alloc] initWithFrame:aRect];
		itemAddress1.backgroundColor = [UIColor clearColor];
		itemAddress1.opaque = NO;
		itemAddress1.textAlignment = UITextAlignmentLeft;
		itemAddress1.textColor = [UIColor blackColor];
		itemAddress1.font = [UIFont fontWithName:@"Arial" size:12];
		itemAddress1.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];

		
		itemAddress1.numberOfLines= 1;

		itemAddress2 = [[UILabel alloc] initWithFrame:aRect];
		itemAddress2.backgroundColor = [UIColor clearColor];
		itemAddress2.opaque = NO;
		itemAddress2.textAlignment = UITextAlignmentLeft;
		itemAddress2.font = [UIFont fontWithName:@"Arial" size:12];
		itemAddress2.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];

		itemAddress2.numberOfLines= 1;

		itemKM = [[UILabel alloc] initWithFrame:aRect];
		itemKM.backgroundColor = [UIColor clearColor];
		itemKM.opaque = NO;
		itemKM.textAlignment = UITextAlignmentLeft;
		itemKM.numberOfLines= 1;
		
		itemKM.font = [UIFont fontWithName:@"Arial" size:12];
		itemKM.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];

		
	//	viewbg = [[UIImageView  alloc] initWithFrame:CGRectNull];
	//	viewbg.image = [UIImage imageNamed:@"celda_vacia_dto.png"];

		
		butoncall = [[UIImageView alloc] init];
		
		//[butoncall addTarget:self action:@selector(clickonbutton:) forControlEvents:UIControlEventTouchUpInside];

		//[butoncall setBackgroundImage:[UIImage imageNamed:@"bgbuton.png"] forState:0];
		butoncall.image = [UIImage imageNamed:@"celda_vacia_dto21.png"];
	
//		file://localhost/Users/mswiczar/Documents/XCode/Woonky/guiaOleo/SourcesIphone/media/.png//viewbg.image = [
		
//		[self.contentView addSubview:viewbg];

		[self.contentView addSubview:itemName];
		[self.contentView addSubview:itemAddress1];
		[self.contentView addSubview:itemAddress2];
		[self.contentView addSubview:butoncall];
		[butoncall addSubview:itemnumber];
		[butoncall addSubview:itemnumber2];

		
	
		[self.contentView addSubview:itemKM];

		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"celda_vacia_dto.png"]];
	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	//viewbg.frame= self.contentView.frame;
	
	CGRect frameItemnumber = CGRectMake(0,14,60, 30);
	itemnumber.frame = frameItemnumber;

	frameItemnumber = CGRectMake(0,50,60, 30);
	itemnumber2.frame = frameItemnumber;
	
	
	
	CGRect frameItemName = CGRectMake(65,5,220, 20);
	itemName.frame = frameItemName;

	CGRect frameItemnAdress1 = CGRectMake(65,20,215, 20);
	itemAddress1.frame = frameItemnAdress1;

	CGRect frameItemnAdress2 = CGRectMake(65,35,215, 20);
	itemAddress2.frame = frameItemnAdress2;

	CGRect frameItemitemKM = CGRectMake(65,50,215, 20);
	itemKM.frame = frameItemitemKM;

	CGRect frameItemImage = CGRectMake(0,0,60, 80);
	butoncall.frame = frameItemImage;
	
	
	
	
}

- (void)dealloc
{
	[itemnumber2 release];
	[itemName release];
	[itemnumber release];
	[itemAddress1 release];
	[itemAddress2 release];
	[itemKM release];
    [butoncall release];
    [super dealloc];
}
/*
 
 <CFDictionary 0x20479a0 [0x30307a00]>{type = immutable, count = 13, capacity = 24, pairs = (
 0 : <CFString 0x2047a70 [0x30307a00]>{contents = "LAT"} = <CFString 0x2047ac0 [0x30307a00]>{contents = "-34.58665270171"}
 1 : <CFString 0x2047ab0 [0x30307a00]>{contents = "LONG"} = <CFString 0x2047b20 [0x30307a00]>{contents = "-58.429117305911"}
 3 : <CFString 0x2047860 [0x30307a00]>{contents = "DIRECCION2"} = <CFString 0x2047650 [0x30307a00]>{contents = "Ciudad de Buenos Aires"}
 5 : <CFString 0x20479f0 [0x30307a00]>{contents = "TEL1"} = <CFString 0x2047a40 [0x30307a00]>{contents = "4832-8370"}
 6 : <CFString 0x2047b60 [0x30307a00]>{contents = "DISTANCIA"} = <CFNumber 0x2047cd0 [0x30307a00]>{value = +2077.00000000000000000000, type = kCFNumberFloat64Type}
 7 : <CFString 0x2047a30 [0x30307a00]>{contents = "TEL2"} = <CFString 0x30303810 [0x30307a00]>{contents = ""}
 10 : <CFString 0x20478b0 [0x30307a00]>{contents = "COCINA"} = <CFString 0x20478e0 [0x30307a00]>{contents = "De autor"}
 11 : <CFString 0x2047640 [0x30307a00]>{contents = "ID"} = <CFString 0x2047630 [0x30307a00]>{contents = "2094"}
 13 : <CFString 0x20476f0 [0x30307a00]>{contents = "DTO"} = <CFString 0x20476e0 [0x30307a00]>{contents = "10"}
 14 : <CFString 0x2047710 [0x30307a00]>{contents = "NOMBRE"} = <CFString 0x2047760 [0x30307a00]>{contents = "Circe  Restobar"}
 23 : <CFString 0x20477a0 [0x30307a00]>{contents = "DIRECCION1"} = <CFString 0x20477e0 [0x30307a00]>{contents = "Thames 1801 "}
 29 : <CFString 0x2047940 [0x30307a00]>{contents = "DESCUENTODIA"} = <CFString 0x2047810 [0x30307a00]>{contents = "'0'"}
 31 : <CFString 0x2047920 [0x30307a00]>{contents = "DESCUENTONOCHE"} = <CFString 0x2047910 [0x30307a00]>{contents = "'127'"}
 )}
 */


-(void) showData
{
	//DESCUENTODIA
	//DESCUENTONOCHE
	itemName.text =[NSString stringWithFormat:@"%@", [[thestore objectForKey:@"NOMBRE"]uppercaseString]] ; 

	itemAddress1.text = [NSString stringWithFormat:@"%@", [thestore objectForKey:@"DIRECCION1"]] ;  
	itemAddress2.text = [NSString stringWithFormat:@"%@", [thestore objectForKey:@"DIRECCION2"] ] ;  

	itemnumber.text = [NSString stringWithFormat:@"%@%@", [thestore objectForKey:@"DTO"],@"%"] ; 
	itemnumber2.text = [NSString stringWithFormat:@"%@%@",[thestore objectForKey:@"DTO"],@"%"] ; 

	NSUInteger the = [[thestore objectForKey:@"DESCUENTONOCHE"]intValue];
	

	NSString *stringtoshow=@"";
	
	if ((1 & the) ==1) 	
	{
		stringtoshow  =[NSString stringWithFormat:@"%@",stringtoshow,@"Lun "];
	}

	
	if ((2 & the) ==2) 	
	{
		stringtoshow  =[NSString stringWithFormat:@"%@%@",stringtoshow,@"Mar "];
	}

	if ((4 & the) ==4) 	
	{
		stringtoshow  =[NSString stringWithFormat:@"%@%@",stringtoshow,@"Mie "];
	}

	if ((8 & the) ==8) 	
	{
		stringtoshow  =[NSString stringWithFormat:@"%@%@",stringtoshow,@"Jue "];
	}

	if ((16 & the) ==16) 	
	{
		stringtoshow  =[NSString stringWithFormat:@"%@%@",stringtoshow,@"Vie "];
	}

	if ((32 & the) ==32) 	
	{
		stringtoshow  =[NSString stringWithFormat:@"%@%@",stringtoshow,@"Sab "];
	}

	if ((64 & the) ==64) 	
	{
		stringtoshow  =[NSString stringWithFormat:@"%@%@",stringtoshow,@"Dom "];
	}

	
	itemKM.text =stringtoshow;
	
/*	 
	@""
	@""
	@""
	@""
	@""
	@""
 */
	
	
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


