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
#import "ESDrawDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ESViewDraw *viewDraw;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.viewDraw setUserInteractionEnabled:YES];
    
    ESDrawDelegate *delegate = [[ESDrawDelegate alloc]init];
    ESStack *stack = [[ESStack alloc]init];
    self.viewDraw.pointsStack = stack;
    self.viewDraw.drawDelegate = delegate;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
