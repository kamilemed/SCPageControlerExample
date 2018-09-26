//
//  ViewController.m
//  SCPageControlerTest
//
//  Created by Kamile Medzeviciute on 26/09/2018.
//  Copyright © 2018 Kamile Medzeviciute. All rights reserved.
//

#import "RootViewController.h"



@interface RootViewController ()<SCPageViewControllerDelegate, SCPageViewControllerDataSource, MainViewControllerDelegate>
@property (nonatomic, strong) SCPageViewController *pageViewController;

@property NSUInteger pageCount;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.pageCount = 2;
    // Do any additional setup after loading the view, typically from a nib.
    self.pageViewController = [[SCPageViewController alloc] init];
    [self.pageViewController setDataSource:self];
    [self.pageViewController setDelegate:self];
    
    [self addChildViewController:self.pageViewController];
    [self.pageViewController.view setFrame:self.view.bounds];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    
    //layouter
    [self.pageViewController setLayouter:[[SCPageLayouter alloc] init] animated:NO completion:nil];
    [self.pageViewController setPagingEnabled:YES];
    
    // Ignore navigation contraints (bounce between pages)
    [self.pageViewController setContinuousNavigationEnabled:YES];
}

- (NSUInteger)numberOfPagesInPageViewController:(SCPageViewController *)pageViewController {
    return self.pageCount;
}

- (UIViewController *)pageViewController:(SCPageViewController *)pageViewController viewControllerForPageAtIndex:(NSUInteger)pageIndex {
    MainViewController *viewController = [[MainViewController alloc] init];
    [viewController.view setFrame:self.view.bounds];
    [viewController setDelegate:self];
    [viewController.view setBackgroundColor:[UIColor colorWithRed:0.7 green:0.6 blue:0.6 alpha:0.3]];
    
    [viewController setLabelUsingIndexNumber:pageIndex];
    
    return viewController;
}


- (void)mainViewControllerRequestPageDeletion:(MainViewController *)mainViewController {
    self.pageCount--;
    [self.pageViewController reloadData];
}

- (void)mainViewControllerRequestPageInsertion:(MainViewController *)mainViewController {
    self.pageCount++;
    [self.pageViewController reloadData];
}

@end
