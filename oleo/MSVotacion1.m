//
//  MSVotacion1.m
//  oleo
//
//  Created by Moises Swiczar on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MSVotacion1.h"


@implementation MSVotacion1
@synthesize theview,theid;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		thevotacion2 = nil;
		comida=1;
		servicio=1;
		ambiente=1;
		vino=1;
		self.title =@"Votar";
		theInfo2 = [[UIBarButtonItem alloc] initWithTitle:@"Listo" style:0 target:self action:@selector(done:)];
		thedictvotar = 	[[NSMutableDictionary alloc]init];
		
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
	thepicker.date = [NSDate date];

	NSDateFormatter * theformat = [[NSDateFormatter alloc] init];
	[theformat setDateFormat:@"yyyy-dd-MM"];
	text_fecha.text =	[theformat stringFromDate:thepicker.date];
	
	[theformat release];
	
	/*
	label_fecha.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
 	label_horario.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_valorizacion.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	
	label_fecha.font = [UIFont boldSystemFontOfSize:18];
	label_horario.font = [UIFont boldSystemFontOfSize:18];
	label_valorizacion.font= [UIFont boldSystemFontOfSize:18];
	
	*/
	
	
	label_fecha.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_fecha.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	
	
	
	label_horario.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_horario.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	
	
	label_valorizacion.textColor = [UIColor colorWithRed:0.85 green:0.97 blue:0.62 alpha:0.99];
	label_valorizacion.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];

	
	
	
	
	image_comida.image = [UIImage imageNamed:@"voto_grande_1.png"];
	image_servicio.image = [UIImage imageNamed:@"voto_grande_1.png"];
	image_amb.image = [UIImage imageNamed:@"voto_grande_1.png"];
	image_vino.image = [UIImage imageNamed:@"voto_grande_1.png"];
	
	noche=NO;
	
	
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
    
	if(thevotacion2!=nil)
	{
		[thevotacion2 release];
		thevotacion2=nil;
		
	}
	[super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	if(thevotacion2!=nil)
	{
		[thevotacion2 release];
		thevotacion2=nil;
		
	}
	[super dealloc];

}



-(void) showpicker
{
	self.navigationItem.rightBarButtonItem = theInfo2;

	
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:.6];
	CGRect arect = thepicker.frame;
	arect.origin.y = 156;
	thepicker.frame = arect;
	[UIView commitAnimations];
	
}



-(void) HidePicker
{
	self.navigationItem.rightBarButtonItem = nil;

	NSDateFormatter * theformat = [[NSDateFormatter alloc] init];
	[theformat setDateFormat:@"yyyy-dd-MM"];

	text_fecha.text =	[theformat stringFromDate:thepicker.date];
	
	[theformat release];
 
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:.4];
	CGRect arect = thepicker.frame;
	arect.origin.y = 480;
	thepicker.frame = arect;
	[UIView commitAnimations];
	
}
-(void) done:(id)aobj
{
	[self HidePicker 	];
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	[self showpicker ];
	
	return NO;
	
}

-(IBAction) clickvote:(id)aobj
{
//vote_big_off.png
//vote_big_on.png
	[self HidePicker ];
	UIButton * buton = (UIButton*) aobj;
	switch (buton.tag) {
		case 1:
			image_comida.image = [UIImage imageNamed:@"voto_grande_1.png"];
			comida=1;
			break;
		case 2:
			image_comida.image = [UIImage imageNamed:@"voto_grande_2.png"];
			comida=2;
			break;
		case 3:
			image_comida.image = [UIImage imageNamed:@"voto_grande_3.png"];
			comida=3;
			break;
		case 4:
			image_comida.image = [UIImage imageNamed:@"voto_grande_4.png"];
			comida=4;
			break;
///////////////
		case 5:
			image_servicio.image = [UIImage imageNamed:@"voto_grande_1.png"];
			servicio=1;
			break;
		case 6:
			image_servicio.image = [UIImage imageNamed:@"voto_grande_2.png"];
			servicio=2;
			break;
		case 7:
			image_servicio.image = [UIImage imageNamed:@"voto_grande_3.png"];
			servicio=3;
			break;
		case 8:
			image_servicio.image = [UIImage imageNamed:@"voto_grande_4.png"];
			servicio=4;
			break;

///////////////
		case 9:
			image_amb.image = [UIImage imageNamed:@"voto_grande_1.png"];
			ambiente=1;
			break;
		case 10:
			image_amb.image = [UIImage imageNamed:@"voto_grande_2.png"];
			ambiente=2;
			break;
		case 11:
			image_amb.image = [UIImage imageNamed:@"voto_grande_3.png"];
			ambiente=3;
			break;
		case 12:
			image_amb.image = [UIImage imageNamed:@"voto_grande_4.png"];
			ambiente=4;
			break;

			///////////////
		case 13:
			image_vino.image = [UIImage imageNamed:@"voto_grande_1.png"];
			vino=1;
			break;
		case 14:
			image_vino.image = [UIImage imageNamed:@"voto_grande_2.png"];
			vino=2;
			break;
		case 15:
			image_vino.image = [UIImage imageNamed:@"voto_grande_3.png"];
			vino=3;
			break;
		case 16:
			image_vino.image = [UIImage imageNamed:@"voto_grande_4.png"];
			vino=4;
			break;
			
			
	}
}

-(IBAction) clickCont:(id)aobj
{
	
	if(thevotacion2==nil)
	{
		thevotacion2 = [[MSVotacion2 alloc] initWithNibName:@"MSVotacion2" bundle:nil];
	}		
	[thedictvotar removeAllObjects];
	[thedictvotar setObject:self.theid forKey:@"idrestaurante"];
	
	if (noche)
	{
		[thedictvotar setObject:@"noche" forKey:@"horario"];
	}
	else 
	{
		[thedictvotar setObject:@"dia" forKey:@"horario"];
	}

	  
	
	
	
	[thedictvotar setObject:text_fecha.text forKey:@"fechavisita"];

	[thedictvotar setObject:[NSString stringWithFormat:@"%d",comida]   forKey:@"comida"];
	[thedictvotar setObject:[NSString stringWithFormat:@"%d",servicio] forKey:@"servicio"];
	[thedictvotar setObject:[NSString stringWithFormat:@"%d",ambiente] forKey:@"ambiente"];
	[thedictvotar setObject:[NSString stringWithFormat:@"%d",vino]     forKey:@"vinos"];
	
	
	
	
	
	
	thevotacion2.theview = self.theview;
	thevotacion2.thedict = thedictvotar;
	[self.navigationController pushViewController:thevotacion2 animated:YES];

}

-(IBAction) clickNoche:(id)aobj
{
	[self HidePicker ];

	if(noche==YES)
	{
		[UIView beginAnimations:@"" context:nil];
		[UIView setAnimationDuration:.4];
		CGRect arect = view_mov_noche_dia_selector.frame;
		arect.origin.x = 247;
		view_mov_noche_dia_selector.frame = arect;
		[UIView commitAnimations];
		
	}
	else 
	{
		[UIView beginAnimations:@"" context:nil];
		[UIView setAnimationDuration:.4];
		CGRect arect = view_mov_noche_dia_selector.frame;
		arect.origin.x = 186;
		view_mov_noche_dia_selector.frame = arect;
		[UIView commitAnimations];
		
	}
	noche=!noche;
	
	
}

/*- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	UIAlertView *THE = [[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
	[THE show];
	[THE release];
}
 */


@end
