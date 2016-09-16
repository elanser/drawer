//
//  ESStack.m
//  drawer
//
//  Created by Anvar Eldarov on 16.09.16.
//  Copyright © 2016 Anvar Eldarov. All rights reserved.
//

#import "ESStack.h"

@implementation ESStack

-(id) init
{
    self = [super init];
    if (self!=nil)
    {
        stack = [[NSMutableArray alloc] init];
    }
    return self;
}

-(id) pop{
    id retObj = nil;
    if (stack.count>0)
    {
        retObj = [stack lastObject];
        [stack removeLastObject];
    }
    return retObj;
}

-(void) push:(id)element{
    [stack addObject:element];
}

-(void) clear{
    [stack removeAllObjects];
}

-(NSInteger) count
{
    return [stack count];
}

-(NSArray*) toArray{
    return stack;
}

@end
