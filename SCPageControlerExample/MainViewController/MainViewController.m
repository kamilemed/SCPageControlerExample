//
//  ContentViewController.m
//  SCPageControlerTest
//
//  Created by Kamile Medzeviciute on 26/09/2018.
//  Copyright © 2018 Kamile Medzeviciute. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pageLabel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onAddPage:(id)sender {
    [self.delegate mainViewControllerRequestPageInsertion:self];
}

- (IBAction)onDeletePage:(id)sender {
    [self.delegate mainViewControllerRequestPageDeletion:self];
}

- (void)setLabelUsingIndexNumber:(NSUInteger)index {
    self.pageLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)index];
}

@end
