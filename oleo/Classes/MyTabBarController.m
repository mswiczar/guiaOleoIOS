//

//  MyTabBarController.m
//  voip
//
//  Created by Alejandro Daher on 5/2/08.
//  Copyright 2008 Creative Coefficient. All rights reserved.
//

#import "MyTabBarController.h"
#import "PinMapController.h"
#import "SimpleWebView.h"
#import "MSBuscar.h"
#import "MSRanking.h"
#import "MSCercanos.h"
#import "MSDescuentos.h"



@implementation MyTabBarController
@synthesize aroot;
- (id)init
{
	if (self = [super init]) 
	{
		/*
		SimpleWebView * asimple = [[SimpleWebView alloc] initWithNibName:@"SimpleWebView" bundle:nil];
		web_nav = [[UINavigationController alloc]initWithRootViewController:asimple];
		web_nav.navigationBar.tintColor = [UIColor blackColor];
		[asimple release];
		
		About * aabout = [[About alloc] initWithNibName:@"About" bundle:nil];
		about_nav = [[UINavigationController alloc]initWithRootViewController:aabout];
		about_nav.navigationBar.tintColor = [UIColor blackColor];
		[aabout release];
		*/
		
		MSBuscar * abuscar = [[MSBuscar alloc] initWithNibName:@"MSBuscar" bundle:nil];
		buscar_nav = [[UINavigationController alloc]initWithRootViewController:abuscar];
		buscar_nav.navigationBar.tintColor = [UIColor blackColor];
		buscar_nav.title =@"Buscar";
		[abuscar release];

		
		MSRanking * aranking = [[MSRanking alloc] initWithNibName:@"MSRanking" bundle:nil];
		ranking_nav = [[UINavigationController alloc]initWithRootViewController:aranking];
		ranking_nav.navigationBar.tintColor = [UIColor blackColor];
		ranking_nav.title =@"Rankings";
		[aranking release];
		

		MSCercanos * acercanos = [[MSCercanos alloc] initWithNibName:@"MSCercanos" bundle:nil];
		cerca_nav = [[UINavigationController alloc]initWithRootViewController:acercanos];
		cerca_nav.navigationBar.tintColor = [UIColor blackColor];
		cerca_nav.title =@"Cercanos";
		[acercanos release];

		
		/*
		PinMapController * aaroot = [[PinMapController alloc] initWithNibName:@"PinMapController" bundle:nil];
		map_nav = [[UINavigationController alloc]initWithRootViewController:aaroot];
		map_nav.navigationBar.tintColor = [UIColor blackColor];
		map_nav.title =@"Mapa";
		[aaroot release];
		*/


		MSDescuentos * adesc = [[MSDescuentos alloc] initWithNibName:@"MSDescuentos" bundle:nil];
		desc_nav = [[UINavigationController alloc]initWithRootViewController:adesc];
		desc_nav.navigationBar.tintColor = [UIColor blackColor];
		desc_nav.title =@"Descuentos";

		[adesc release];
		
		
		NSArray *localViewControllersArray = [NSArray arrayWithObjects:buscar_nav,ranking_nav,cerca_nav,desc_nav,nil];

		self.delegate = self;
		self.viewControllers = localViewControllersArray;
		self.selectedIndex = 0;
	}
	return self;
}

- (void)loadView 
{
	// Don't invoke super if you want to create a view hierarchy programmatically
	[super loadView];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc
{
	[super dealloc];
}

#pragma UITabBarViewControllerDelegate methods

- (void)tabBarController:(UITabBarController *)tabBarController
didEndCustomizingViewControllers:(NSArray *)viewControllers
				 changed:(BOOL)changed
{

}

- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController
{
	/*
	if (viewController==recordcontroller)
	{
		[playcontroller clickstopmusic:playcontroller];
	
	}
	else
	{
	
		if(viewController==playcontroller)
		{
			[playcontroller clickpause:playcontroller];
			//
		}
		else
		{
			[playcontroller clickstopmusic:playcontroller];

			// this is settings controller
		
		}
	}
	 */
}

@end
