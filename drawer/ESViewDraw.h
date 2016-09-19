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

extern NSString* const ColorChangedNotification;
extern NSString* const ColorChangedKey;


#pragma mark - ESViewDraw
@interface ESViewDraw : UIView

@property (strong,nonatomic) UIColor *currentColor;

-(void) initMe;

@end
