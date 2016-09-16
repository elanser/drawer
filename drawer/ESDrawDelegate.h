//
//  ESDrawDelegate.h
//  drawer
//
//  Created by Anvar Eldarov on 16.09.16.
//  Copyright © 2016 Anvar Eldarov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESViewDraw.h"

@interface ESDrawDelegate : NSObject <ESViewDrawDelegate>

@property (assign,nonatomic)    CGFloat strokeWidth;
@property (weak,nonatomic)      UIColor *currentColor;

@end
