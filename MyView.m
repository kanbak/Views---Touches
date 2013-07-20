//
//  MyView.m
//  Views
//
//  Created by Umut Kanbak on 7/18/13.
//  Copyright (c) 2013 Umut Kanbak. All rights reserved.
//

#import "MyView.h"


@implementation MyView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"MyView"); }
    self.backgroundColor = [UIColor whiteColor];
    return self;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"tag = %i", self.tag);
    self.backgroundColor = [UIColor purpleColor];
    [delegate didChooseView:self];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"moved!");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
