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
    
    int card1;
    int card2;
    BOOL touch1;
    BOOL touch2;
    MyView *firstCard;
    MyView *lastCard;
    BOOL isItAWin;
    int timesWon;
    __weak IBOutlet UILabel *matchedMissedCountLabel;
    __weak IBOutlet UIButton *resetGameButton;
    __weak IBOutlet UIImageView *missedOrMatchedImage;
    __weak IBOutlet UIImage *missedImage;
    __weak IBOutlet UIImage *matchedImage;
    
}
- (IBAction)resetGame:(id)sender;

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
            matchedMissedCountLabel.text=@"Matching Game";
            [missedOrMatchedImage setImage:nil];
            missedImage = [UIImage imageNamed:@"missed.png"];
            matchedImage = [UIImage imageNamed:@"matched.png"];
            
        }
        
        {
            
            
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
    
    
    if (touch1 == NO)
    {
        card1 = myView.tag;
        firstCard = myView;
        touch1 = YES;
        touch2= NO;
    }
    
    else if(touch1 == YES)
    {
        card2 = myView.tag;
        lastCard = myView;
        touch2 = YES;
        touch1=NO;
    }
    
    if ((card1 == card2) && (touch2==YES))
    {
        matchedMissedCountLabel.text=@"Match!";
        [missedOrMatchedImage setImage:matchedImage];
        NSLog(@"You Win!");
        isItAWin = YES;
        timesWon++;
        NSLog(@"times won = %i", timesWon);
        firstCard.backgroundColor = [UIColor lightGrayColor];
        lastCard.backgroundColor = [UIColor lightGrayColor];
        touch1=NO;
        touch2=NO;
    }
    
    if ((card1!=card2)&&(touch2==YES))
    {
        matchedMissedCountLabel.text=@"Missed!";
        NSLog(@"You Lose!");
        isItAWin = NO;
        [missedOrMatchedImage setImage:missedImage];
        missedOrMatchedImage.backgroundColor = [UIColor lightGrayColor];
    }
    
    if (timesWon == 8)
    {
        for (MyView *subview in self.view.subviews)
            subview.backgroundColor = [UIColor brownColor];
        matchedMissedCountLabel.backgroundColor = [UIColor lightGrayColor];
        missedOrMatchedImage.backgroundColor = [UIColor lightGrayColor];
        timesWon=0;
    }
    
    
}


- (IBAction)resetGame:(id)sender {
    for (MyView *subview in self.view.subviews)
        subview.backgroundColor = [UIColor brownColor];
    matchedMissedCountLabel.backgroundColor = [UIColor lightGrayColor];
    resetGameButton.backgroundColor=[UIColor lightGrayColor];
    timesWon=0;
    matchedMissedCountLabel.text=@"Matching Game";
    [missedOrMatchedImage setImage:matchedImage];
    missedOrMatchedImage.backgroundColor = [UIColor lightGrayColor];
    
}
@end
