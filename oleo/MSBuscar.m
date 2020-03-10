//
//  MSBuscar.m
//  oleo
//
//  Created by Moises Swiczar on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSBuscar.h"
#import "oleoAppDelegate.h"


@implementation MSBuscar

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.title =@"Buscar";
		theprecioVC = nil;
		theresult=nil;
		theZonas=nil;
		theCocinas=nil;
		theCaracteristicas=nil;
		theabout=nil;

		
		self.tabBarItem =  [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	self.navigationController.navigationBar.hidden=YES;
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	if ((appDelegate.precioD != 0) || (appDelegate.precioH != 1000 ))
	{
		label_buton1.text =[NSString stringWithFormat:@"PRECIO: DESDE $%d HASTA $%d",appDelegate.precioD,appDelegate.precioH];
	}
	else 
	{
		label_buton1.text =@"FILTRAR POR PRECIO";
	}


	if (appDelegate.zonaID !=0)	
	{
		label_buton2.text =[NSString stringWithFormat:@"ZONA: %@",appDelegate.strZona];

	}
	else 
	{
		label_buton2.text =@"FILTRAR POR ZONA";
	}
	


	if (appDelegate.cocinaID !=0)	
	{
		label_buton3.text =[NSString stringWithFormat:@"COCINA: %@",appDelegate.strCocina];
		
	}
	else 
	{
		label_buton3.text =@"FILTRAR POR COCINA";
	}
	

	
	if ([appDelegate.caractsID length] !=0)	
	{
		label_buton4.text =[NSString stringWithFormat:@"CARACTERISTICAS: %@",@"VER SELECCION"];
	}
	else 
	{
		label_buton4.text =@"FILTRAR POR CARACTERISTICAS";
	}
	
	

	
	
	

	
	
	
}

-(IBAction) clickInfo:(id)aobj
{
	if (theabout==nil)
	{
		theabout = [[MSAbout alloc] initWithNibName:@"MSAbout" bundle:nil];
		
	}
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	

	[appDelegate.mytabview presentModalViewController:theabout animated:YES];
	
	
	//UIAlertView* theal = [[UIAlertView alloc]initWithTitle:@"Guía Oleo" message:@"Lo hice yo Moshé" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	//[theal show];
	//[theal release];
	
	
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationController.navigationBar.hidden=YES;

	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BGFIRST.png"]];
	

	label_first.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_first.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	label_second.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_second.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	
	
	label_buton1.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	label_buton2.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	label_buton3.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
	label_buton4.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	
	label_buton1.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
	label_buton2.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
	label_buton3.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
	label_buton4.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.99];
	
	
	
	
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
    [super didReceiveMemoryWarning];
	
	if(theprecioVC != nil)
	{
		[theprecioVC release];
		theprecioVC=nil;
	}
	
	if(theabout != nil)
	{
		[theabout release];
		theabout=nil;
	}
	
	
	
	
	if(theZonas != nil)
	{
		[theZonas release];
		theZonas=nil;
	}

	if(theCocinas != nil)
	{
		[theCocinas release];
		theCocinas=nil;
	}

	if(theCaracteristicas != nil)
	{
		[theCaracteristicas release];
		theCaracteristicas=nil;
	}
	

	if(theresult != nil)
	{
		[theresult release];
		theresult=nil;
	}
	
	

    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	if(theprecioVC != nil)
	{
		[theprecioVC release];
		theprecioVC=nil;
	}

	if(theabout != nil)
	{
		[theabout release];
		theabout=nil;
	}
	

	
	
	if(theZonas != nil)
	{
		[theZonas release];
		theZonas=nil;
	}
	
	if(theCocinas != nil)
	{
		[theCocinas release];
		theCocinas=nil;
	}
	
	if(theCaracteristicas != nil)
	{
		[theCaracteristicas release];
		theCaracteristicas=nil;
	}
	
	
	if(theresult != nil)
	{
		[theresult release];
		theresult=nil;
	}
	
    [super dealloc];
}


-(IBAction) clickPrecio:(id)aobj
{
	
	if (theprecioVC==nil)
	{
		theprecioVC = [[MSPrecio alloc] initWithNibName:@"MSPrecio" bundle:nil];

	}
	[self.navigationController pushViewController:theprecioVC animated:YES];
	
}
-(IBAction) clickZona:(id)aobj
{
	if (theZonas==nil)
	{
		theZonas = [[MSZonas alloc] initWithNibName:@"MSZonas" bundle:nil];
		
	}
	[self.navigationController pushViewController:theZonas animated:YES];
	
	
}

-(IBAction) clickCocina:(id)aobj
{
	if (theCocinas==nil)
	{
		theCocinas = [[MSCocinas alloc] initWithNibName:@"MSCocinas" bundle:nil];
		
	}
	[self.navigationController pushViewController:theCocinas animated:YES];
	
	
}

-(IBAction) clickCaracteristicas:(id)aobj
{
	if (theCaracteristicas==nil)
	{
		theCaracteristicas = [[MSCaracteristicas alloc] initWithNibName:@"MSCaracteristicas" bundle:nil];
		
	}
	[self.navigationController pushViewController:theCaracteristicas animated:YES];
	
	
	
}

-(IBAction) clickBuscar:(id)aobj
{
	if (theresult==nil)
	{
		theresult = [[MSResultSearch alloc] initWithNibName:@"MSResultSearch" bundle:nil];
	}
	oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.search_str=NO;
	theresult.loaded=NO;
	

	[self.navigationController pushViewController:theresult animated:YES];
	[theresult show];
	

	
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField              // called when 'return' key pressed. return NO to ignore.
{
	if([textField.text isEqualToString:@""])
	{
		[textField endEditing:TRUE];
	}
	else
	{
		[textField endEditing:TRUE];

		oleoAppDelegate *appDelegate = (oleoAppDelegate *)[[UIApplication sharedApplication] delegate];
		appDelegate.search_str=YES;
		appDelegate.strsearch =textField.text; 
		
		if (theresult==nil)
		{
			theresult = [[MSResultSearch alloc] initWithNibName:@"MSResultSearch" bundle:nil];
		}
		theresult.loaded=NO;
		[self.navigationController pushViewController:theresult animated:YES];
		[theresult show];

	}
	[textField resignFirstResponder];

	return YES;

	
}	







@end
