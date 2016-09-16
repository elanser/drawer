//
//  ESViewDraw.h
//  drawer
//
//  Created by Anvar Eldarov on 16.09.16.
//  Copyright © 2016 Anvar Eldarov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ESStack;


#pragma mark - ESViewDrawDelegate
@protocol ESViewDrawDelegate <NSObject>
-(void) draw:(ESStack*) pointsStack onView:(UIView*) view withContext:(CGContextRef) context;
@optional
-(void) setStrokeWidth:(CGFloat) width;
-(void) drawPoint:(CGPoint) point withColor:(UIColor*) color forContext:(CGContextRef) context;
-(void) drawLine:(CGPoint) fromPoint toPoint:(CGPoint) toPoint withColor:(UIColor*) color forContext:(CGContextRef) context;
-(void) drawCircle:(CGPoint) centerPoint radius:(CGFloat) radius withColor:(UIColor*) color forContext:(CGContextRef) context;
@end


#pragma mark - ESViewDraw
@interface ESViewDraw : UIView

@property (strong,nonatomic) ESStack* pointsStack;
@property (strong,nonatomic) id <ESViewDrawDelegate> drawDelegate;

@end
