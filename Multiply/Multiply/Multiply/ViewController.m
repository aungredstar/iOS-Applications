//
//  ViewController.m
//  Multiply
//
//  Created by Aung Ko Ko Win on 6/12/14.
//  Copyright (c) 2014 Redstar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UISlider *multiplierSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    
    int temp = (int)self.multiplierSlider.value;
    self.multiplierLabel.text = [NSString stringWithFormat: @"%d", temp];
}

-(void)showAlertMessage: (NSString *)msgTitle message:(NSString *)msg
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:msgTitle message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    

    [alertView show];
}

- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    
    int number = 0;
    int multiplier = 0;
    int result = 0;
    
    [self.view endEditing:YES];
    
    @try {
        number = self.numberTextField.text.intValue;
    }
    @catch (NSException *exception) {
        
    }
    @finally {
    }
    
    @try {
        multiplier = self.multiplierLabel.text.intValue;
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
    
    if(self.operatorSegmentControl.selectedSegmentIndex == 1)
    {
        result = number / multiplier;
    }
    else
    {
        result =  multiplier * number;
    }
    
    self.answerLabel.text = [NSString stringWithFormat:@"%d", result];
    
    
    self.answerLabel.textColor =
    (result >= 20) ? [UIColor greenColor] : [UIColor whiteColor];
    
    
    if (((result %3) == 0) && ((result % 5) == 0))
    {
        self.answerLabel.text = @"fizzbuzz";
    }
    else if((result %3) == 0)
    {
        self.answerLabel.text = @"fizz";
    }
    else if ((result % 5) == 0)
    {
        self.answerLabel.text = @"buzz";
    }
    
    [self showAlertMessage:@"" message:@"Done !"];
}

@end
