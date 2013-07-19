//
//  ViewController.m
//  Views
//
//  Created by Umut Kanbak on 7/18/13.
//  Copyright (c) 2013 Umut Kanbak. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
@interface ViewController ()
{
    int i;
    int card1;
    int card2;
    bool secondCard;
    MyView *firstCard;
    MyView *lastCard;
    bool isItAWin;
    int timesWon;
    NSMutableArray *wins;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    for(UIView * subView in self.view.subviews)
    {
        if([subView isKindOfClass:[MyView class]])
        {
            MyView * myView = (MyView *)subView;
            myView.delegate = self;
            timesWon = 0;
                    }
        
        {
            wins = [[NSMutableArray alloc]initWithCapacity:8];
            if (isItAWin == YES) {
                
            }
        }
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didChooseView:(MyView*)myView
{
    
    if (secondCard == NO) {
        card1 = myView.tag;
        firstCard = myView;
        secondCard = YES;
        if (timesWon == 8) {
            timesWon=0;

        }
        
    } else {
        card2 = myView.tag;
        lastCard = myView;
        secondCard = NO;
            
        if (firstCard.tag == lastCard.tag) {
            NSLog(@"You Win!");
            isItAWin = YES;
            timesWon++;
            NSLog(@"times won = %i", timesWon);
            firstCard.backgroundColor = [UIColor lightGrayColor];
            lastCard.backgroundColor = [UIColor lightGrayColor];
        }else {
                NSLog(@"You Lose!");
                isItAWin = NO;}
        
}
        }
            



@end
