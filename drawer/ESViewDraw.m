//
//  ESViewDraw.m
//  drawer
//
//  Created by Anvar Eldarov on 16.09.16.
//  Copyright © 2016 Anvar Eldarov. All rights reserved.
//

#import "ESViewDraw.h"

@interface ESViewDraw()

@property (assign,nonatomic) CGPoint beginPoint;
@property (strong,nonatomic) NSMutableArray *pointsForDraw;

@end

@implementation ESViewDraw

#pragma mark - Touch handlers

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    NSLog(@"touchesBegan p=%@",NSStringFromCGPoint(touchPoint));
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    NSLog(@"touchesMoved p=%@",NSStringFromCGPoint(touchPoint));
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    
}

- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet * _Nonnull)touches
{
    
}

#pragma mark - Draw methods

- (void)drawRect:(CGRect)rect
{
    
}

@end
