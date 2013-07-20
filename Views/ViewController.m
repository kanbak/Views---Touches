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
    __weak IBOutlet UIImage *matchImageTag1;
    __weak IBOutlet UIImage *matchImageTag2;
    __weak IBOutlet UIImage *matchImageTag3;
    __weak IBOutlet UIImage *matchImageTag4;
    __weak IBOutlet UIImage *matchImageTag5;
    __weak IBOutlet UIImage *matchImageTag6;
    __weak IBOutlet UIImage *matchImageTag7;
    __weak IBOutlet UIImage *matchImageTag8;
    __weak IBOutlet UIImage *turnedDownImage;

    
    
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
            matchImageTag1 = [UIImage imageNamed:@"matchImageTag1.png"];
            matchImageTag2 = [UIImage imageNamed:@"matchImageTag2.png"];
            matchImageTag3 = [UIImage imageNamed:@"matchImageTag3.png"];
            matchImageTag4 = [UIImage imageNamed:@"matchImageTag4.png"];
            matchImageTag5 = [UIImage imageNamed:@"matchImageTag5.png"];
            matchImageTag6 = [UIImage imageNamed:@"matchImageTag6.png"];
            matchImageTag7 = [UIImage imageNamed:@"matchImageTag7.png"];
            matchImageTag8 = [UIImage imageNamed:@"matchImageTag8.png"];
            turnedDownImage = [UIImage imageNamed:@"turnedDownImage.png"];
            
            
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
        firstCard.backgroundColor = [UIColor whiteColor];
        [missedOrMatchedImage setImage:missedImage];
        missedOrMatchedImage.backgroundColor = [UIColor lightGrayColor];
        lastCard.backgroundColor = [UIColor whiteColor];
    }
    
    if (timesWon == 8)
    {
        for (MyView *subview in self.view.subviews)
            subview.backgroundColor = [UIColor whiteColor];
        matchedMissedCountLabel.backgroundColor = [UIColor lightGrayColor];
        missedOrMatchedImage.backgroundColor = [UIColor lightGrayColor];
        timesWon=0;
    }
    
    
}


- (IBAction)resetGame:(id)sender {
    for (MyView *subview in self.view.subviews)
        subview.backgroundColor = [UIColor whiteColor];
    matchedMissedCountLabel.backgroundColor = [UIColor lightGrayColor];
    resetGameButton.backgroundColor=[UIColor lightGrayColor];
    timesWon=0;
    matchedMissedCountLabel.text=@"Matching Game";
    [missedOrMatchedImage setImage:nil];
    missedOrMatchedImage.backgroundColor = [UIColor lightGrayColor];
    
}
@end
