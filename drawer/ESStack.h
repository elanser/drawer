//
//  ESStack.h
//  drawer
//
//  Created by Anvar Eldarov on 16.09.16.
//  Copyright © 2016 Anvar Eldarov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESStack : NSObject
{
    NSMutableArray* stack;
}

-(id) pop;
-(void) push:(id)element;
-(void) clear;
-(NSInteger) count;
-(NSArray*) toArray;

@end
