//
//  ESViewDraw.m
//  drawer
//
//  Created by Anvar Eldarov on 16.09.16.
//  Copyright © 2016 Anvar Eldarov. All rights reserved.
//

#import "ESViewDraw.h"
#import "ESStack.h"

@interface ESViewDraw()


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
    @synchronized (self.pointsStack) {
        CGPoint touchPoint = [[touches anyObject] locationInView:self];
        NSLog(@"touchesMoved p=%@, count = %d",NSStringFromCGPoint(touchPoint),self.pointsStack.count);
        [self.pointsStack push:[NSValue valueWithCGPoint:touchPoint]];
    }
    [self setNeedsDisplay];

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [self.pointsStack clear];
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
    if (self.pointsStack.count>0)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGPoint p1 = [[[self.pointsStack toArray] firstObject] CGPointValue];
        for (int i=1;i<self.pointsStack.count;i++)
        {
            CGPoint p2 = [[[self.pointsStack toArray]objectAtIndex:i ] CGPointValue];
            CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
            CGContextSetLineWidth(context, 5);//self.strokeWidth);
            CGContextMoveToPoint(context, p1.x, p1.y);
            CGContextAddLineToPoint(context, p2.x, p2.y);
            CGContextStrokePath(context);
            p1=CGPointMake(p2.x, p2.y);
        }
    }
}

@end
