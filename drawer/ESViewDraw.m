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
@property (strong,nonatomic) UIColor *color;

@end

@implementation ESPoint

@end

NSString* const ColorChangedNotification=@"ColorChangedNotification";
NSString* const ColorChangedKey=@"ColorChangedKey";

@implementation ESViewDraw
{
    UIBezierPath *path;
    UIImage *incrementalImage;
}
#pragma mark - Notifications 

-(void) colorChanged:(NSNotification*) notification
{
    self.currentColor = [notification.userInfo objectForKey:ColorChangedKey];
  //  [self erase];
}


#pragma mark - Constructor, destructor

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setUserInteractionEnabled:YES];
        path = [UIBezierPath bezierPath];
        [path setLineWidth:5.0];
        self.currentColor = [UIColor blackColor];
        
        [[NSNotificationCenter defaultCenter]   addObserver:self
                                                   selector:@selector(colorChanged:)
                                                       name:ColorChangedNotification
                                                     object:nil];
    }
    return self;
}

- (void)erase {
    path   = nil;  //Set current path nil
    path   = [UIBezierPath bezierPath]; //Create new path
    incrementalImage = nil;
    [path setLineWidth:5.0];
    [self setNeedsDisplay];
}


- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Touch handlers

- (ESPoint*)CGPoint2ESPoint:(CGPoint) touchPoint withPointType:(TPointType) pointType
{
    ESPoint *point = [[ESPoint alloc] init];
    point.point = CGPointMake(touchPoint.x, touchPoint.y);
    point.pointType = pointType;
    point.color = self.currentColor;
    return point;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path moveToPoint:p];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p];
    [self drawBitmap]; // (3)
    [self setNeedsDisplay];
    [path removeAllPoints]; //(4)
    
}

- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
     [self touchesEnded:touches withEvent:event];
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet * _Nonnull)touches
{
    
}

#pragma mark - Draw methods
- (void)drawBitmap // (3)
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    if (!incrementalImage) { // first draw;
        UIBezierPath *rectpath = [UIBezierPath bezierPathWithRect:self.bounds]; // enclosing bitmap by a rectangle defined by another UIBezierPath object
        [[UIColor clearColor] setFill];
        [rectpath fill]; // fill it
    }
    [incrementalImage drawAtPoint:CGPointZero];
    [self setStrokeColor:self.currentColor];
    [path stroke];
    incrementalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (void)setStrokeColor:(UIColor*) color
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
}
- (void)drawRect:(CGRect)rect
{

    [self setStrokeColor:self.currentColor];
    [incrementalImage drawInRect:rect]; // (3)
    [path stroke];
}


@end
