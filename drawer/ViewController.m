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
@property (weak, nonatomic) IBOutlet UIView *viewCurrentColor;


@end

@implementation ViewController

#pragma mark - Initialization, dealloc
-(void) initObjects
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
    tapGesture.delegate = self;
    [self.viewPanel addGestureRecognizer:tapGesture];
    
    [NSNotificationCenter defaultCenter ]
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    UIView* touchView = [touch view];
    if (touchView)
    {
        UIColor* backgroundColor = touchView.backgroundColor;
        NSDictionary *dict = [NSDictionary dictionaryWithObject:backgroundColor forKey:ColorChangedKey];
        [[NSNotificationCenter defaultCenter]
                                postNotificationName:ColorChangedNotification
                                object:nil
                                userInfo:dict];
        return YES;
    }
    return NO;
}

-(void) dealloc
{
    
}

#pragma mark - ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObjects];
    [self.viewDraw initMe];
    [self.viewDraw setUserInteractionEnabled:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
