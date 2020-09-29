//
//  QXViewController.m
//  QXHome
//
//  Created by aloow on 09/25/2020.
//  Copyright (c) 2020 aloow. All rights reserved.
//

#import "QXViewController.h"
#import <QXHomeContainerController.h>

@interface QXViewController ()

@end

@implementation QXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)buttonTap:(id)sender {
    
    NSBundle *bundle = [NSBundle bundleForClass:[QXHomeContainerController class]];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"QXHome" bundle:bundle];
    QXHomeContainerController *lcVC =
    [sb instantiateViewControllerWithIdentifier:@"QXHomeContainerController"];
 
    [self.navigationController pushViewController:lcVC animated:true];
    
//    [self presentViewController:lcVC animated:true completion:nil];
    
}


@end
