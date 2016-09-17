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

enum TPointType {PTBeginPoint, PTOrdinaryPoint};
typedef enum TPointType TPointType;

@interface  ESPoint : NSObject

@property (assign,nonatomic) CGPoint point;
@property (assign,nonatomic) TPointType pointType;

@end

@implementation ESPoint

@end

@implementation ESViewDraw

#pragma mark - Touch handlers

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        NSMutableArray *array = [[NSMutableArray alloc]init];
        self.currentPointArray = array;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    ESPoint *point = [[ESPoint alloc] init];
    point.point = CGPointMake(touchPoint.x, touchPoint.y);
    point.pointType = PTBeginPoint;
    [self.currentPointArray addObject:point];//[NSValue valueWithCGPoint:touchPoint]];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{

    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    ESPoint *point = [[ESPoint alloc] init];
    point.point = CGPointMake(touchPoint.x, touchPoint.y);
    point.pointType = PTOrdinaryPoint;
    
    [self.currentPointArray addObject:point];//[NSValue valueWithCGPoint:touchPoint]];
    [self setNeedsDisplay];

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
    CGContextRef context = UIGraphicsGetCurrentContext();
//    for (NSArray* pointArray in self.arraysOfPoints)
//    {
        if (self.currentPointArray.count>0)
        {
            
            ESPoint *p1 = [self.currentPointArray firstObject];
            for (int i=1;i<self.currentPointArray.count;i++)
            {
                ESPoint *p2 = [self.currentPointArray objectAtIndex:i ];
                CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
                CGContextSetLineWidth(context, 5);//self.strokeWidth);
                if (p1.pointType==PTBeginPoint)
                {
                    CGContextMoveToPoint(context, p1.point.x, p1.point.y);
                }
                else if (p2.pointType!=PTBeginPoint) {
                    CGContextMoveToPoint(context, p1.point.x, p1.point.y);
                    CGContextAddLineToPoint(context, p2.point.x, p2.point.y);
                    CGContextStrokePath(context);
                }
                p1=p2;
            }
        }
//    }
}

@end
