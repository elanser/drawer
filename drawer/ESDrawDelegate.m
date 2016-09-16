//
//  ESDrawDelegate.m
//  drawer
//
//  Created by Anvar Eldarov on 16.09.16.
//  Copyright © 2016 Anvar Eldarov. All rights reserved.
//

#import "ESDrawDelegate.h"
#import "ESStack.h"

@interface ESDrawDelegate()

- (void) hiddenLineDraw:(ESStack*) pointsStack  withContext:(CGContextRef) context;
- (void) updateView:(UIView*) view;

@end

@implementation ESDrawDelegate 

-(void) setStrokeWidth:(CGFloat) width
{
    self.strokeWidth = width;
}

- (void) updateView:(UIView*) view
{
    [view setNeedsDisplay];
}

- (void) hiddenLineDraw:(ESStack*) pointsStack  withContext:(CGContextRef) context
{
    @synchronized (pointsStack) {
        NSLog(@"pointsStack count=%d",pointsStack.count);
        CGPoint p1 = [[[pointsStack toArray] firstObject] CGPointValue];
        //while(pointsStack.count>0)
       // {
        
        for (int i=1;i<pointsStack.count;i++)
        {
            CGPoint p2 = [[[pointsStack toArray]objectAtIndex:i ] CGPointValue];
            [self drawLine:p1 toPoint:p2 withColor:[UIColor blueColor] forContext:context];
            p1=CGPointMake(p2.x, p2.y);
        }
//            CGPoint p2 = [[pointsStack pop] CGPointValue];
//            [self drawLine:p1 toPoint:p2 withColor:[UIColor blueColor] forContext:context];
//            p1=CGPointMake(p2.x, p2.y);
       // }
    }
}


-(void) draw:(ESStack*) pointsStack onView:(UIView*) view withContext:(CGContextRef) context;
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [self performSelector:@selector(hiddenLineDraw:withContext:) withObject:pointsStack withObject:(__bridge id)(context)];
        [self performSelectorOnMainThread:@selector(updateView:) withObject:view waitUntilDone:YES];
    });
}



//-(void) drawPoint:(CGPoint) point withColor:(UIColor*) color forContext:(CGContextRef) context
//{
//    // stub
//}

-(void) drawLine:(CGPoint) fromPoint toPoint:(CGPoint) toPoint withColor:(UIColor*) color forContext:(CGContextRef) context
{
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, 5);//self.strokeWidth);
    CGContextMoveToPoint(context, fromPoint.x, fromPoint.y);
    CGContextAddLineToPoint(context, toPoint.x, toPoint.y);
    CGContextStrokePath(context);
}

//-(void) drawCircle:(CGPoint) centerPoint radius:(CGFloat) radius withColor:(UIColor*) color forContext:(CGContextRef) context
//{
//    // stub
//}

@end
