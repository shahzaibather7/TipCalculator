//
//  TextFieldView.m
//  TipCalculator
//
//  Created by Mohammad Shahzaib Ather on 2017-08-04.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

#import "TextFieldView.h"

@implementation TextFieldView

- (instancetype)initWithTextView : (UITextView*) textView
{
    self = [super init];
    if (self) {
        _textView = textView;
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
