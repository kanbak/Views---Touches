//
//  MyView.h
//  Views
//
//  Created by Umut Kanbak on 7/18/13.
//  Copyright (c) 2013 Umut Kanbak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MathDelegate.h"

@interface MyView : UIView
@property (strong, nonatomic)id<MathDelegate> delegate;
@end
