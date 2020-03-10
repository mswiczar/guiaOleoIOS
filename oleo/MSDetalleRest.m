//
//  MSDetalleRest.m
//  oleo
//
//  Created by Moises Swiczar on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSDetalleRest.h"
#import "oleoAppDelegate.h"
#import "UChache.h"
#import "WSCall.h"
#import "UContact.h"





@implementation MSDetalleRest
@synthesize theid;


@synthesize stringtel1;
@synthesize stringtel2;


-(void)workOnBackground:(BOOL)background
{
	self.view.userInteractionEnabled = !background;
	if (background)
	{
		thetable.alpha=0;

		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		[backAlert show];
		[progressInd startAnimating];
		
	}
	else
	{

		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		[progressInd stopAnimating];
		[backAlert dismissWithClickedButtonIndex:0 animated:YES];
	}
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		fueradememoria=NO;
		amap=nil;
		thefotos=nil;
		thefacebook=nil;
		thelogin=nil;
		thelistvotos=nil;
		thetwitter=nil;
		thevotacion=nil;
		
		thearrayunico = [[NSMutableArray alloc]init];
		progressInd = [[UIActivityIndicatorView alloc] init];
		progressInd.hidesWhenStopped = YES;
		progressInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
		[progressInd sizeToFit];
		progressInd.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
										UIViewAutoresizingFlexibleRightMargin |
										UIViewAutoresizingFlexibleTopMargin |
										UIViewAutoresizingFlexibleBottomMargin);
		
		backAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"", @"")
											   message:NSLocalizedString(@"Buscando información.\nPor favor aguarde.", @"") 
											  delegate:nil 
									 cancelButtonTitle:nil
									 otherButtonTitles:nil];
		
		
		progressInd.center = CGPointMake(backAlert.frame.size.width / 2.0, -5.0);
		
		[backAlert addSubview:progressInd];
		thearrayImages= [[NSMutableArray alloc]init ];
		theobj = [[NSMutableDictionary alloc] init];
		thebanner = [[NSMutableDictionary alloc] init];
		


    }
    return self;
}


- (void)viewWillDisappear:(BOOL)animated
{
	if (enviar==NO)
	{
		self.title=@"Atrás";
	}

}


- (void)viewWillAppear:(BOOL)animated
{
	if(fueradememoria)
	{
		fueradememoria=NO;
		[self show];
		
	}
	if ([theobj objectForKey:@"NOMBRE"]!=nil)
	{
		self.title = [theobj objectForKey:@"NOMBRE"];
	}
	enviar=NO;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
/*
	label_desc.textColor = [UIColor colorWithRed:81.6 green:89.8 blue:49.4 alpha:99];
	lable_title2.textColor = [UIColor colorWithRed:81.6 green:89.8 blue:49.4 alpha:99];
	lable_title3.textColor = [UIColor colorWithRed:81.6 green:89.8 blue:49.4 alpha:99];
	lable_title31.textColor = [UIColor colorWithRed:81.6 green:89.8 blue:49.4 alpha:99];
	lable_title4.textColor = [UIColor colorWithRed:81.6 green:89.8 blue:49.4 alpha:99];
*/

	
	label_name.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	label_vinos.font = [UIFont fontWithName:@"Arial" size:13];
	label_vinos.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];

	label_street_1.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
	label_street_2.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.99];
	
	label_tel.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
	label_tel.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	
	
	label_cantcomentarios.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
	label_cantcomentarios.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	
	
	label_desc.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_desc.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	lable_title2.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	lable_title2.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	lable_title3.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	lable_title3.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	lable_title31.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	lable_title31.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];


	lable_title4.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	lable_title4.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	
	lable_title5.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	lable_title5.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	
	lable_title51.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	lable_title51.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
	
	
	
	
	
	thetable.backgroundColor =[UIColor clearColor];

	view_caract.backgroundColor =[UIColor clearColor];
	
	footerView.backgroundColor =[UIColor clearColor];
	
	topView.backgroundColor =[UIColor clearColor];
	viewMapaLLamar.backgroundColor =[UIColor clearColor];
	view_noPreload.backgroundColor =[UIColor clearColor];

	
	view_caract.backgroundColor =[UIColor clearColor];
	view_images.backgroundColor =[UIColor clearColor];
	
	
	
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
	fueradememoria=YES;
	if(amap!=nil)
	{
		[amap release];
		amap=nil;
		
	}


	if(thevotacion!=nil)
	{
		[thevotacion release];
		thevotacion=nil;
		
	}
	
	if (theaddressbook!=nil)
	{
		[theaddressbook release];
		theaddressbook=nil;
	}

	
	if(thefotos!=nil)
	{
		[thefotos release];
		thefotos=nil;
		
	}

	if(thefacebook!=nil)
	{
		[thefacebook release];
		thefacebook=nil;
		
	}
	
	if(thelogin!=nil)
	{
		[thelogin release];
		thelogin=nil;
		
	}
	
	if(thelistvotos!=nil)
	{
		[thelistvotos release];
		thelistvotos=nil;
		
	}

	if(thetwitter!=nil)
	{
		[thetwitter release];
		thetwitter=nil;
		
	}
	
	[super didReceiveMemoryWarning];

	
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	fueradememoria=YES;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	if(amap!=nil)
	{
		[amap release];
		amap=nil;
		
	}
	if (theaddressbook!=nil)
	{
		[theaddressbook release];
		theaddressbook=nil;
	}
	
	
	if(thevotacion!=nil)
	{
		[thevotacion release];
		thevotacion=nil;
		
	}
	
	
	if(thefotos!=nil)
	{
		[thefotos release];
		thefotos=nil;
		
	}
	
	if(thefacebook!=nil)
	{
		[thefacebook release];
		thefacebook=nil;
		
	}
	
	if(thelogin!=nil)
	{
		[thelogin release];
		thelogin=nil;
		
	}
	
	if(thelistvotos!=nil)
	{
		[thelistvotos release];
		thelistvotos=nil;
		
	}
	
	if(thetwitter!=nil)
	{
		[thetwitter release];
		thetwitter=nil;
		
	}
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
*/




-(void) updateimageAlphacero
{
	
	NSUInteger totalsubview = [view_caract.subviews count];
	NSUInteger zzz;
	for (zzz=0;zzz<totalsubview; zzz++)
	{
		UIView * theviewaux = [view_caract.subviews objectAtIndex:zzz];
		if ([theviewaux isKindOfClass:[UIImageView class]])
		{
			if(theviewaux.tag >999)
			{
				theviewaux.alpha =0;
			}
		}
	}
	
}





-(void) updateimage
{
	NSUInteger totalsubview = [view_caract.subviews count];
	NSUInteger zzz;
	NSUInteger tofind ;
	NSString *strinfind;
	NSRange arange;
	
	NSMutableString *aux = [[NSMutableString alloc] init];
	[aux appendFormat:@" %@ ",[theobj objectForKey:@"CARACTERISTICASID"]];
	[aux replaceOccurrencesOfString:@"," withString:@" " options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux  length])];
	
	for (zzz=0;zzz<totalsubview; zzz++)
	{
		UIView * theviewaux = [view_caract.subviews objectAtIndex:zzz];
		if ([theviewaux isKindOfClass:[UIImageView class]])
		{
			if(theviewaux.tag >999)
			{
				tofind = theviewaux.tag-1000;
				strinfind = [NSString stringWithFormat:@" %d ",tofind];
				arange = [aux rangeOfString:strinfind];
				if (arange.length !=0)
				{
					theviewaux.alpha =1;
				}
			}
			
		}
	}
	[aux release];
}

-(void) loadMoredata:aobj
{
	[self updateimageAlphacero];

	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	[appDelegate updateStatus];
	if (appDelegate.internetConnectionStatus==NotReachable)
	{
		[self workOnBackground:NO];
		[appDelegate  shownotreacheable];
		return;
	}
	[theobj removeAllObjects];
	if ([WSCall callGetRest:self.theid thedict:theobj])
	{
		showbanner=NO;
		viewad.alpha=0;
		[self updateimage];
		if([WSCall callBanner:thebanner])
		{
			viewad.alpha=1;
			viewad.image = [UIImage imageWithData:[UChache cachedIconFromURL:[thebanner objectForKey:@"imagen"]]];
			showbanner=YES;
		}
		thetable.alpha=1;
		showVotos = !([[theobj objectForKey:@"COMENTARIOS"] isEqualToString:@"0"]);

		if (showVotos)
		{
			theviewver.alpha=1;
		}
		
		 self.title = [theobj objectForKey:@"NOMBRE"];
		
		 label_name.text            =[[theobj objectForKey:@"NOMBRE"] uppercaseString];
		 label_cocina.text          =[theobj objectForKey:@"COCINA"];
		 label_horarios.text        =[theobj objectForKey:@"HORARIOS"];
		 
		 label_rate_cocina.text     =[theobj objectForKey:@"VOTOCOMIDA"];
		 label_rate_servicio.text   =[theobj objectForKey:@"VOTOSERVICIO"];
		 label_rate_ambiente.text   =[theobj objectForKey:@"VOTOAMBIENTE"];
		 
		 label_precio_dia.text      =[NSString stringWithFormat:@"$%@" ,[theobj objectForKey:@"PRECIOD"]];
		 label_precio_noche.text    =[NSString stringWithFormat:@"$%@" ,[theobj objectForKey:@"PRECION"]];
		 label_votos.text           =[theobj objectForKey:@"VOTOS"];
		 
		if([[theobj objectForKey:@"CARTAVINOS"]isEqualToString:@""])
		{
			label_vinos.text           =@"No hay comentarios sobre vinos";//;
		}
		else
		{
			label_vinos.text           =[NSString stringWithFormat:@"Carta de vinos Regular segun %@ usuarios",[theobj objectForKey:@"CARTAVINOS"]] ;
		
		}
		
		 label_cantcomentarios.text =[NSString stringWithFormat:@"%@ comentarios",[theobj objectForKey:@"COMENTARIOS"]] ;
		 
		 label_street_1.text        =[theobj objectForKey:@"DIRECCION1"];
		 label_street_2.text        =[theobj objectForKey:@"DIRECCION2"];
		 
		 if([[theobj objectForKey:@"TEL1"] isEqualToString:@""])
		 {
		 label_tel.text =@"Tel: No hay datos";
		 }
		 else
		 {
		 if([[theobj objectForKey:@"TEL2"] isEqualToString:@""])
		 {
		 label_tel.text    =[NSString stringWithFormat:@"Tel: %@", [theobj objectForKey:@"TEL1"]];
		 }
		 else
		 {
		 label_tel.text    =[NSString stringWithFormat:@"Tel: %@ / %@", [theobj objectForKey:@"TEL1"],[theobj objectForKey:@"TEL2"]];
		 }
		 }
		
		if (appDelegate.internetConnectionStatus==ReachableViaWiFiNetwork)
		{
			if(![[theobj objectForKey:@"MINIIMAGE1"] isEqualToString:@""])
			{
				viewPhoto1.image =[UIImage imageWithData:[UChache cachedIconFromURL:[theobj objectForKey:@"MINIIMAGE1"]]];
				viewPhoto2.image =[UIImage imageWithData:[UChache cachedIconFromURL:[theobj objectForKey:@"MINIIMAGE2"]]];
				viewPhoto3.image =[UIImage imageWithData:[UChache cachedIconFromURL:[theobj objectForKey:@"MINIIMAGE3"]]];
				viewPhoto4.image =[UIImage imageWithData:[UChache cachedIconFromURL:[theobj objectForKey:@"MINIIMAGE4"]]];
			
			}
		}
		[thetable reloadData];
	}
	else 
	{
		UIAlertView * theale = [[UIAlertView alloc]initWithTitle:@"Guía Oleo" message:@"Error de Servidor" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[theale show];
		[theale release];
		[self.navigationController popViewControllerAnimated:YES];
		
	}

	[self workOnBackground:NO];
}



-(void)showmoredata
{
	[self workOnBackground:YES];

	atimergetdata = [NSTimer scheduledTimerWithTimeInterval: .5
													 target: self
												   selector: @selector (loadMoredata:)
												   userInfo: self
													repeats: NO];
	
}


-(void) show
{
	thetable.alpha=0;
	self.title =@"Buscando Datos";
	[self showmoredata];
	
	
}

-(IBAction) clickVotar:(id)aob
{
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.theIDVotar = self.theid;
	
	
	if (appDelegate.loggedin)
	{
		if(thevotacion==nil)
		{
			thevotacion = [[MSVotacion1 alloc] initWithNibName:@"MSVotacion1" bundle:nil];
		}
		thevotacion.theview = self;
		thevotacion.theid = self.theid;
		[self.navigationController pushViewController:thevotacion animated:YES];
		
	}
	else 
	{
		if(thelogin==nil)
		{
			thelogin = [[MSLogin alloc] initWithNibName:@"MSLogin" bundle:nil];
		}
		thelogin.theid = self.theid;
		thelogin.theview = self;
		[self.navigationController pushViewController:thelogin animated:YES];
		
	}

	
}
-(IBAction) clickEnviar:(id)aob
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	enviar=YES;
	[picker setSubject:@"Guía Oleo"];
	
	NSString * str;
	
	if([[theobj objectForKey:@"TEL1"] isEqualToString:@""])
	{
		str= @"No hay telefono disponible"; 
	}
	else 
	{
		if([[theobj objectForKey:@"TEL2"] isEqualToString:@""])
		{
			str= [theobj objectForKey:@"TEL1"]; 
		}
		else 
		{
			str=[NSString stringWithFormat:@"%@ / %@", [theobj objectForKey:@"TEL1"],[theobj objectForKey:@"TEL2"]]; 
		}
	}

	NSString *emailBody = [NSString stringWithFormat:@"%@\nCocina: %@\nHorarios: %@\nDireccion: %@, %@\nTelefono: %@",

						   [theobj objectForKey:@"NOMBRE"],[theobj objectForKey:@"COCINA"],[theobj objectForKey:@"HORARIOS"],[theobj objectForKey:@"DIRECCION1"],[theobj objectForKey:@"DIRECCION2"],str];
							   ;
	[picker setMessageBody:emailBody isHTML:NO];
	
	[self presentModalViewController:picker animated:YES];
	[picker release];
	
}

-(IBAction) clickFacebook:(id)aob
{
	if(thefacebook==nil)
	{
		thefacebook = [[FaceBook alloc] initWithNibName:@"FaceBook" bundle:nil];
	}	
	
	NSString * str;

	if([[theobj objectForKey:@"TEL1"] isEqualToString:@""])
	{
		str= @"No hay telefono disponible"; 
	}
	else 
	{
		if([[theobj objectForKey:@"TEL2"] isEqualToString:@""])
		{
			str= [theobj objectForKey:@"TEL1"]; 
		}
		else 
		{
			str=[NSString stringWithFormat:@"%@ / %@", [theobj objectForKey:@"TEL1"],[theobj objectForKey:@"TEL2"]]; 
		}
	}
	
	

	NSString *emailBody = [NSString stringWithFormat:@"%@\nCocina: %@\nHorarios: %@\nDireccion: %@, %@\nTelefono: %@",
						   [theobj objectForKey:@"NOMBRE"],[theobj objectForKey:@"COCINA"],[theobj objectForKey:@"HORARIOS"],[theobj objectForKey:@"DIRECCION1"],[theobj objectForKey:@"DIRECCION2"],str];
	
	thefacebook.astr =emailBody;
	
	
	
	[self.navigationController pushViewController:thefacebook animated:YES];
	[thefacebook show];
	

}

-(IBAction) clickTwitter:(id)aob
{
	if(thetwitter==nil)
	{
		thetwitter = [[RobtwitterViewController alloc] initWithNibName:@"RobtwitterViewController" bundle:nil];
	}	
	NSString * str;

	if([[theobj objectForKey:@"TEL1"] isEqualToString:@""])
	{
		str= @"No hay telefono disponible"; 
	}
	else 
	{
		if([[theobj objectForKey:@"TEL2"] isEqualToString:@""])
		{
			str= [theobj objectForKey:@"TEL1"]; 
		}
		else 
		{
			str=[NSString stringWithFormat:@"%@ / %@", [theobj objectForKey:@"TEL1"],[theobj objectForKey:@"TEL2"]]; 
		}
	}
	
	/*
	NSString *emailBody = [NSString stringWithFormat:@"%@\nCocina: %@\nHorarios: %@\nDireccion: %@, %@\nTelefono: %@",
						   [theobj objectForKey:@"NOMBRE"],[theobj objectForKey:@"COCINA"],[theobj objectForKey:@"HORARIOS"],[theobj objectForKey:@"DIRECCION1"],[theobj objectForKey:@"DIRECCION2"],str];
	

*/
	NSString *emailBody = [NSString stringWithFormat:@"Guía Oleo para iPhone recomienda:\nhttp://www.guiaoleo.com.ar/detail.php?ID=%@",self.theid];
	
	
	
	thetwitter.astr =emailBody;
	[self.navigationController pushViewController:thetwitter animated:YES];
	[thetwitter show];
	
}



-(IBAction) clickBanner:(id)aob
{
	if(showbanner)
	{
		NSString *url = [NSString stringWithFormat: @"%@",[thebanner objectForKey:@"url"]];
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];	
	}
}


-(IBAction) clickComentarios:(id)aob
{
	if([[theobj objectForKey:@"COMENTARIOS"] isEqualToString:@"0"])
	{
		UIAlertView * thea = [[UIAlertView alloc] initWithTitle:@"Guía Oleo" message:@"No hay comentarios para ver." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[thea show];
		[thea release];
	}
	else 
	{
		if(thelistvotos==nil)
		{
			thelistvotos = [[MSListVotos alloc] initWithNibName:@"MSListVotos" bundle:nil];
		}		
		thelistvotos.thedict = theobj;
		thelistvotos.theid = self.theid;
		[self.navigationController pushViewController:thelistvotos animated:YES];
		[thelistvotos show];
	}

	
	

}


-(IBAction) clickMapa:(id)aob;
{
	if(amap==nil)
	{
		amap = [[PinMapController alloc] initWithNibName:@"PinMapController" bundle:nil];
	}
	[thearrayunico removeAllObjects];
	[thearrayunico addObject:theobj];
	amap.thearray = thearrayunico;
	[self.navigationController pushViewController:amap animated:YES];
	[amap show];
}

-(IBAction) clickCall:(id)aob
{
	
	
	if([[theobj objectForKey:@"TEL1"] isEqualToString:@""])
	{
		UIAlertView * thealert = [[UIAlertView alloc] initWithTitle:@"Guía Oleo" message:@"No hay numero de telefono" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[thealert show];
		[thealert release];
									
	}
	else
	{
		
		
		
		NSMutableString *aux = [[NSMutableString alloc] initWithString:[[theobj objectForKey:@"TEL1"]uppercaseString]];
		
		
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
			if ([aux length]>8)
			{
				
				if ([[aux substringToIndex:2]isEqualToString:@"08"])
				{
					

					self.stringtel1 =[NSString stringWithFormat: @"tel://%@",[NSString stringWithFormat: @"%@",aux]];
					url = [NSString stringWithFormat: @"tel://%@",self.stringtel1];
					[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];	
				}
				else 
				{
					self.stringtel1 = [NSString stringWithFormat: @"%@",[aux substringToIndex:8]];
					self.stringtel2 = [NSString stringWithFormat: @"%@",[aux substringFromIndex:8]];
					if ([self.stringtel2 length]==4)
					{
						self.stringtel2 = [NSString stringWithFormat: @"%@%@",[aux substringToIndex:4] , [aux substringFromIndex:8]];
					}
					
					if (theactionSheet!=nil)
					{
						[theactionSheet release];
					}
					theactionSheet = [[UIActionSheet alloc] initWithTitle:@""
																 delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil
														otherButtonTitles:self.stringtel1,self.stringtel2, @"Cancelar", nil];
					
					theactionSheet.actionSheetStyle = UIBarStyleBlackOpaque;
					theactionSheet.cancelButtonIndex=2;
					
					oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
					[theactionSheet showInView:appDelegate.mytabview.view];
				}
			}
			else 
			{
				url = [NSString stringWithFormat: @"tel://%@",aux];
				[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];	
			}
			
	
		}
		else 
		{
			
			[aux replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux length])];
			[aux replaceOccurrencesOfString:@"/" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [aux length])];
	
			self.stringtel1 = [NSString stringWithFormat: @"%@",[aux substringToIndex:8]];
			self.stringtel2 = [NSString stringWithFormat: @"%@",[aux substringFromIndex:8]];
			if ([self.stringtel2 length]==4)
			{
				self.stringtel2 = [NSString stringWithFormat: @"%@%@",[aux substringToIndex:4] , [aux substringFromIndex:8]];
			}
			
			
			if (theactionSheet!=nil)
			{
				[theactionSheet release];
			}
			theactionSheet = [[UIActionSheet alloc] initWithTitle:@""
															 delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil
													otherButtonTitles:self.stringtel1,self.stringtel2, @"Cancelar", nil];
				
				
			theactionSheet.actionSheetStyle = UIBarStyleBlackOpaque;
			theactionSheet.cancelButtonIndex=2;
			
			oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
			
			[theactionSheet showInView:appDelegate.mytabview.view];
			
		}
		[aux release];

	}

}



-(IBAction) clickFotos:(id)aobj
{
	if(thefotos==nil)
	{
		thefotos = [[ImageDetail alloc] initWithNibName:@"ImageDetail" bundle:nil];
	}
	[thearrayImages removeAllObjects];
	[thearrayImages addObject:[theobj objectForKey:@"IMAGE1"]];
	[thearrayImages addObject:[theobj objectForKey:@"IMAGE2"]];
	[thearrayImages addObject:[theobj objectForKey:@"IMAGE3"]];
	[thearrayImages addObject:[theobj objectForKey:@"IMAGE4"]];
	
	thefotos.arrayimagenames = thearrayImages;
	
	 
	 
	[self.navigationController pushViewController:thefotos animated:YES];
	[thefotos go];
}






- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	oleoAppDelegate *appDelegate;
	
	switch (indexPath.row) {
		case 0:
			return 240;
			break;
		case 1:
			return 170;
			break;
		case 2:
			return 285;
			break;
		case 3:
			appDelegate= (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
			[appDelegate updateStatus];
			if(![[theobj objectForKey:@"MINIIMAGE1"] isEqualToString:@""])
			{
				if (appDelegate.internetConnectionStatus==ReachableViaWiFiNetwork)
				{
					return 135;
				}
				else {
					return 75;
					
				}
			
			}
			return 0;
			break;
		case 4:
			return 335;
			break;
			
		default:
			break;
	}
	return 0;
}

// This table will always only have one section.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tv
{
    return 1;
}

// One row per book, the number of books is the number of rows.
- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section 
{
	
	return 5;	
}




- (UITableViewCell *)obtainTableCellForRow:(NSInteger)row
{
	oleoAppDelegate *appDelegate;
	
	UITableViewCell *cell = nil;
	CGRect arect;
	switch (row) {
		case 0:
			cell = [thetable dequeueReusableCellWithIdentifier:@"UICell1"];
			if (cell == nil)
			{
				cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICell1"] autorelease];
				cell.textLabel.font =[UIFont systemFontOfSize:10];
				cell.backgroundView.backgroundColor = [UIColor clearColor];
				
				arect = topView.frame;
				arect.origin.y = 2;
				topView.frame= arect;
				[topView removeFromSuperview];
				[cell addSubview:topView];
				
			}
			break;
		case 1:
			cell = [thetable dequeueReusableCellWithIdentifier:@"UICell2"];
			if (cell == nil)
			{
				cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICell2"] autorelease];
				cell.textLabel.font =[UIFont systemFontOfSize:10];
				arect = viewMapaLLamar.frame;
				arect.origin.y = 2;
				viewMapaLLamar.frame= arect;
				[viewMapaLLamar removeFromSuperview];

				[cell addSubview:viewMapaLLamar];
				cell.backgroundView.backgroundColor = [UIColor clearColor];

			}
			break;
		case 2:
			cell = [thetable dequeueReusableCellWithIdentifier:@"UICell3"];
			if (cell == nil)
			{
				cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICell3"] autorelease];
				cell.textLabel.font =[UIFont systemFontOfSize:10];
				[view_caract removeFromSuperview];

				[cell addSubview:view_caract];
				cell.backgroundView.backgroundColor = [UIColor clearColor];

			}
			break;
		case 3:
			cell = [thetable dequeueReusableCellWithIdentifier:@"UICell4"];
			if (cell == nil)
			{
				cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICell4"] autorelease];
				cell.textLabel.font =[UIFont systemFontOfSize:10];
				cell.backgroundView.backgroundColor = [UIColor clearColor];
			}
			[view_noPreload removeFromSuperview];
			[view_images removeFromSuperview];
			arect = view_images.frame;
			arect.origin.y = 5;
			view_images.frame= arect;
			[view_images removeFromSuperview];
			if(![[theobj objectForKey:@"MINIIMAGE1"] isEqualToString:@""])
			{
				appDelegate= (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
				[appDelegate updateStatus];

				if (appDelegate.internetConnectionStatus==ReachableViaWiFiNetwork)
				{
					[cell addSubview:view_images];
				}
				else 
				{
					[cell addSubview:view_noPreload];
					
				}

			}
			

			break;
		case 4:
			cell = [thetable dequeueReusableCellWithIdentifier:@"UICell5"];
			if (cell == nil)
			{
				cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"UICell5"] autorelease];
				cell.textLabel.font =[UIFont systemFontOfSize:10];
				cell.backgroundView.backgroundColor = [UIColor clearColor];
				arect = footerView.frame;
				arect.origin.y = 12;
				footerView.frame= arect;
				
				[cell addSubview:footerView];

			}
			break;
			
	}
	return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
	
	UITableViewCell *cell;
	NSInteger row = [indexPath row];
	
		
	cell = [self obtainTableCellForRow:row];
	cell.selectionStyle = 	UITableViewCellSelectionStyleNone;
		
	
	return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	/*
	if(indexPath.row!=[arrayData count])
	{
		if(thedet==nil)
		{
			thedet = [[MSDetalleRest alloc] initWithNibName:@"MSDetalleRest" bundle:nil];
		}
		thedet.theobj = [arrayData objectAtIndex: indexPath.row];
		
		[self.navigationController pushViewController:thedet animated:YES];
		[thedet show];
		
		
		
		
		
	}
	else
	{
		[(CellMore*)thecell start];
		[self showmoredata];
	}
	
	
	[thetable deselectRowAtIndexPath:indexPath	animated:YES];
	*/
	return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 37.0;
}





- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	switch (result)
	{
		case MFMailComposeResultCancelled:
			//		message.text = @"Result: canceled";
			break;
		case MFMailComposeResultSaved:
			//		message.text = @"Result: saved";
			break;
		case MFMailComposeResultSent:
			break;
		case MFMailComposeResultFailed:
			//		message.text = @"Result: failed";
			break;
		default:
			//		message.text = @"Result: not sent";
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (actionSheet==theactionSheetContact)
	{
	
		if (buttonIndex == 0)
		{
			[UContact AddContact:theobj];
		}
		else
		{
			if (buttonIndex == 1)
			{
				
				
				if (theaddressbook==nil)
				{
					theaddressbook = [[AppendContact  alloc]init];
				}
				theaddressbook.thedetailStore = theobj;
				[self.navigationController presentModalViewController:theaddressbook animated:YES];
			}
		}
		
		return;
	}
	else 
	{
		if (buttonIndex == 0)
		{
			NSString *url = [NSString stringWithFormat: @"tel://%@",self.stringtel1];
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];	
			
		}
		else
		{
			// facoriten
			if (buttonIndex == 1)
			{
				NSString *url = [NSString stringWithFormat: @"tel://%@",self.stringtel2];
				[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];	
			}
		}
		
	
	}

	// the user clicked one of contacten
}


-(IBAction) clickAgregaContactos:(id)aobj
{
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];

	theactionSheetContact	 = [[UIActionSheet alloc] initWithTitle:@"Guía Oleo"
												  delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil
										 otherButtonTitles:@"Crear nuevo contacto",@"Anexar a contacto", @"Cancelar", nil];
	
	theactionSheetContact.actionSheetStyle = UIBarStyleBlackOpaque;
	theactionSheetContact.cancelButtonIndex=3;
	
	[theactionSheetContact showInView:appDelegate.mytabview.view];
	
}







@end
