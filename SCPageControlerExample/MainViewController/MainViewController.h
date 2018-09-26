//
//  ContentViewController.h
//  SCPageControlerTest
//
//  Created by Kamile Medzeviciute on 26/09/2018.
//  Copyright © 2018 Kamile Medzeviciute. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainViewControllerDelegate;

@interface MainViewController : UIViewController

@property (nonatomic, weak) IBOutlet id<MainViewControllerDelegate> delegate;
- (void)setLabelUsingIndexNumber:(NSUInteger)index;

@end

@protocol MainViewControllerDelegate <NSObject>

- (void)mainViewControllerRequestPageInsertion:(MainViewController *)mainViewController;

- (void)mainViewControllerRequestPageDeletion:(MainViewController *)mainViewController;



@end

