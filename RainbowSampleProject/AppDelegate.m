//
//  AppDelegate.m
//  RainbowSampleProject
//
//  Created by Asal Tech on 7/23/17.
//  Copyright © 2017 Asaltech. All rights reserved.
//

#import "AppDelegate.h"
#import "ContactsViewController.h"
#import "ConversationsViewController.h"
#import "SettingsViewController.h"
#import "LoginViewController.h"
#import "RecentViewController.h"
#import <Rainbow/Rainbow.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   
    
   // MyUser * currentUser = [[ServicesManager sharedInstance] myUser];
    if (/* DISABLES CODE */ (NO)) {
        LoginViewController *masterViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
        self.navigationController = self.navigationController;
    }
    else{
        _tabBarController = [[UITabBarController alloc] init];
        
        
        UIViewController *contactsViewCntroller = [[ContactsViewController alloc] init];
        UINavigationController *contactsNavigationViewCntroller = [[UINavigationController alloc]initWithRootViewController:contactsViewCntroller];
        
        contactsNavigationViewCntroller.tabBarItem.title = @"Contacts" ;
        contactsNavigationViewCntroller.tabBarItem.image = [UIImage imageNamed:@"contacts-icon"];
        contactsNavigationViewCntroller.tabBarItem.selectedImage=[UIImage imageNamed:@"contacts-selected-icon"];
        //contactsNavigationViewCntroller.tabBarItem.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)[ServicesManager sharedInstance].contactsManagerService.totalNbOfPendingInvitations];
        
        UIViewController *conversationsViewController = [[ConversationsViewController alloc] init];
        UINavigationController *conversationsNavigationViewController = [[UINavigationController alloc]initWithRootViewController:conversationsViewController];
        
        conversationsNavigationViewController.tabBarItem.title= @"Conversations" ;
        conversationsNavigationViewController.tabBarItem.image = [UIImage imageNamed:@"conversations-icon"];
        conversationsNavigationViewController.tabBarItem.selectedImage=[UIImage imageNamed:@"conversations-selected-icon"];
       // conversationsNavigationViewController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)[ServicesManager sharedInstance].conversationsManagerService.totalNbOfUnreadMessagesInAllConversations];
        
        UIViewController *recentsViewController = [[RecentViewController alloc] init];
        UINavigationController *recentsNavigationViewController = [[UINavigationController alloc]initWithRootViewController:recentsViewController];
        
        recentsNavigationViewController.tabBarItem.title= @"Recents" ;
        recentsNavigationViewController.tabBarItem.image = [UIImage imageNamed:@"past-not-selected-icon"];
        recentsNavigationViewController.tabBarItem.selectedImage=[UIImage imageNamed:@"past-selected-icon"];
        
        UIViewController *settingsViewController = [[SettingsViewController alloc] init];
        UINavigationController *settingsNavigationViewController = [[UINavigationController alloc]initWithRootViewController:settingsViewController];
        
        settingsNavigationViewController.tabBarItem.title= @"Settings" ;
        settingsNavigationViewController.tabBarItem.image = [UIImage imageNamed:@"settings-icon"];
        settingsNavigationViewController.tabBarItem.selectedImage=[UIImage imageNamed:@"settings-selected-icon"];
        
        
        [_tabBarController setViewControllers:[NSArray arrayWithObjects:contactsNavigationViewCntroller,conversationsNavigationViewController,recentsNavigationViewController,settingsNavigationViewController,nil]];
        
        [[UITabBar appearance] setTintColor:[UIColor colorWithRed:39.0/255.0 green:129.0/255.0 blue:187.0/255.0 alpha:1.0]];
        
         self.navigationController = [[UINavigationController alloc] initWithRootViewController:_tabBarController];
        
    }
    
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];


    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
