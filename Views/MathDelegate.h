//
//  MathDelegate.h
//  Views
//
//  Created by Umut Kanbak on 7/18/13.
//  Copyright (c) 2013 Umut Kanbak. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MyView;
@protocol MathDelegate <NSObject>

-(void)didChooseView:(MyView *)myView;

@end
