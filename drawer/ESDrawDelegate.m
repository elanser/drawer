//
//  ESDrawDelegate.m
//  drawer
//
//  Created by Anvar Eldarov on 16.09.16.
//  Copyright © 2016 Anvar Eldarov. All rights reserved.
//

#import "ESDrawDelegate.h"


@implementation ESDrawDelegate 

-(void) setStrokeWidth:(CGFloat) width
{
    self.strokeWidth = width;
}

-(void) draw:(NSMutableArray*) pointsArray onView:(UIView*) view withContext:(CGContextRef) context
{
    
    for(int i=0;i<pointsArray.count-1;i++)
    {
        CGPoint p1 = [[pointsArray objectAtIndex:i] CGPointValue];
        CGPoint p2 = [[pointsArray objectAtIndex:i+1] CGPointValue];
        [self drawLine:p1 toPoint:p2 withColor:self.currentColor forContext:context];
    }
}

//-(void) drawPoint:(CGPoint) point withColor:(UIColor*) color forContext:(CGContextRef) context
//{
//    // stub
//}

-(void) drawLine:(CGPoint) fromPoint toPoint:(CGPoint) toPoint withColor:(UIColor*) color forContext:(CGContextRef) context
{
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, self.strokeWidth);
    CGContextMoveToPoint(context, fromPoint.x, fromPoint.y);
    CGContextAddLineToPoint(context, toPoint.x, toPoint.y);
}

//-(void) drawCircle:(CGPoint) centerPoint radius:(CGFloat) radius withColor:(UIColor*) color forContext:(CGContextRef) context
//{
//    // stub
//}

@end
