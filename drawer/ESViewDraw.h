//
//  ESViewDraw.h
//  drawer
//
//  Created by Anvar Eldarov on 16.09.16.
//  Copyright © 2016 Anvar Eldarov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ESViewDrawDelegate <NSObject>
-(void) draw:(NSMutableArray*) pointsArray onView:(UIView*) view withContext:(CGContextRef) context;
@optional
-(void) drawPoint:(CGPoint) point withColor:(UIColor*) color forContext:(CGContextRef) context;
-(void) drawLine:(CGPoint) fromPoint toPoint:(CGPoint) toPoint withColor:(UIColor*) color forContext:(CGContextRef) context;
-(void) drawCircle:(CGPoint) centerPoint radius:(CGFloat) radius withColor:(UIColor*) color forContext:(CGContextRef) context;
@end

@interface ESViewDraw : UIView

@end
