//
//  ViewController.m
//  TipCalculator
//
//  Created by Mohammad Shahzaib Ather on 2017-08-04.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

#import "ViewController.h"
#import "TextFieldView.h"


@interface ViewController () <UITextFieldDelegate>

@property (nonatomic , strong) UITextField *billAmountTextField;
@property (nonatomic ,weak) UIButton *calculateTipButton;
@property (nonatomic ,assign) float fullTipValue;
@property (nonatomic ,assign) float tipPercentFloat;
@property (nonatomic ,weak) UILabel *tipAmountLabel;
@property (nonatomic , strong) UITextField *tipPercentTextField;
@property (nonatomic, strong) UITapGestureRecognizer *backgroundTap;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self createButton];
    [self createQuestionBillLabel];
    [self createQuestionTipLabel];
    self.tipAmountLabel = [self createTipValueLabel];
    [self createTextField];
    [self createTextFieldTipPercent];
    [self createBackgroundTapGestureRecognizer];
    [self calculateTipButton];
    [self tipAmountLabel];
 
    
    
    
}


//METHODS



-(void)createTextField {
   
    self.billAmountTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.center.x-10, 150, 230, 80)];
    _billAmountTextField.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:_billAmountTextField];
    self.billAmountTextField.delegate = self;
    self.billAmountTextField.tag = 1;
    self.billAmountTextField.font = [UIFont systemFontOfSize:20];
    self.billAmountTextField.textColor = [UIColor whiteColor];
    self.billAmountTextField.textAlignment = NSTextAlignmentLeft;
    self.billAmountTextField.keyboardType = UIKeyboardTypeDecimalPad;
}


-(void)createTextFieldTipPercent {
    self.tipPercentTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.center.x-10, 250, 220, 80)];
    _tipPercentTextField.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview: self.tipPercentTextField];
    self.tipPercentTextField.delegate = self;
    self.tipPercentTextField.tag = 2 ;
    self.tipPercentTextField.textColor = [UIColor whiteColor];
    self.tipPercentTextField.font = [UIFont systemFontOfSize:20];
    self.tipPercentTextField.textAlignment = NSTextAlignmentLeft;
    self.tipPercentTextField.keyboardType = UIKeyboardTypeNumberPad;
}

-(void)createBackgroundTapGestureRecognizer
{
    self.backgroundTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroudWasTapped)];
    [self.view addGestureRecognizer:self.backgroundTap];
}


-(void)createButton {
    UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.center.x-100, self.view.center.y, 200, 80)];
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"CALCULATE TIP" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(setCalculateTipButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(UILabel*)createTipValueLabel {
    UILabel *updatedTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.center.y + 100, 500, 100)];
    updatedTipLabel.backgroundColor = [UIColor blueColor];
    updatedTipLabel.textColor = [UIColor whiteColor];
    [self.view addSubview: updatedTipLabel];
    return updatedTipLabel;
}

-(void)setCalculateTipButton:(UIButton *) button {
    
    float floatBillWithTip = [self.billAmountTextField.text floatValue];
    float tipPercent = [self.tipPercentTextField.text floatValue];
    tipPercent = (tipPercent/100);
    self.fullTipValue = tipPercent * floatBillWithTip ;
    self.fullTipValue = self.fullTipValue + floatBillWithTip;
    NSString *updatedTipString = [NSString stringWithFormat:@"Amount owing with tip is: $%.2f" , self.fullTipValue];
    self.tipAmountLabel.text = updatedTipString;
    self.tipAmountLabel.font = [UIFont systemFontOfSize:20];
}


-(void)createQuestionBillLabel {
    UILabel *questionbillLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 200, 80)];
    questionbillLabel.text = @"INPUT BILL AMOUNT : $";
    questionbillLabel.backgroundColor = [UIColor darkGrayColor];
    questionbillLabel.textColor = [UIColor whiteColor];
    [self.view addSubview: questionbillLabel];
}

-(void)createQuestionTipLabel {
    UILabel *questionTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, 200, 80)];
    questionTipLabel.text = @"INPUT TIP AMOUNT : %";
    questionTipLabel.backgroundColor = [UIColor darkGrayColor];
    questionTipLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:questionTipLabel];
}


//Housekeeping Methods

-(void)backgroudWasTapped
{
    [self.view endEditing:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag == 2){
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        return !([newString length] > 2);
    } else{
        return true;
    }
}
@end
