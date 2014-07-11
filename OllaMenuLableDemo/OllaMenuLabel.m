//
//  OllaMenuLabel.m
//  OllaMenuLableDemo
//
//  Created by nonstriater on 14-7-11.
//  Copyright (c) 2014年 xiaoran. All rights reserved.
//

#import "OllaMenuLabel.h"

@implementation OllaMenuLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self commonInitial];
    }
    return self;
}

- (void)awakeFromNib{
    [self commonInitial];

}

- (void)commonInitial{
    
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandler:)];
    //longPress.minimumPressDuration = 1.2f;
    [self addGestureRecognizer:longPress];
}

- (void)longPressHandler:(UILongPressGestureRecognizer *)gesture{

    [self becomeFirstResponder];
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    [menuController setTargetRect:self.bounds inView:self];
    [menuController setMenuVisible:YES animated:YES];
    
}

// label default is no
- (BOOL)canBecomeFirstResponder{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{

    return (action==@selector(copy:));

}

- (void)copy:(id)sender{
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    board.string = self.text;
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
