//
//  ViewController.m
//  drawer
//
//  Created by Anvar Eldarov on 16.09.16.
//  Copyright © 2016 Anvar Eldarov. All rights reserved.
//

#import "ViewController.h"
#import "ESViewDraw.h"
#import "ESStack.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ESViewDraw *viewDraw;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *colorViews;
@property (weak, nonatomic) IBOutlet UIView *viewPanel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewDraw.currentPointArray = [[NSMutableArray alloc] init];
    [self.viewDraw setUserInteractionEnabled:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
