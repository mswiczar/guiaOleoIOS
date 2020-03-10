//
//  MyTabBarController.h
//  voip
//
//  Created by Alejandro Daher on 5/2/08.
//  Copyright 2008 Creative Coefficient. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyTabBarController : UITabBarController<UITabBarControllerDelegate> 
{

	UINavigationController *web_nav;
	UINavigationController *about_nav;
	UINavigationController *spinner_nav;
	UINavigationController *map_nav;

	UINavigationController *buscar_nav;
	UINavigationController *ranking_nav;
	UINavigationController *cerca_nav;
	UINavigationController *desc_nav;

	
	
	id aroot;
}
@property (nonatomic,assign) id aroot;
@end
