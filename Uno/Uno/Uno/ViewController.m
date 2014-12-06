//
//  ViewController.m
//  Uno
//
//  Created by Aung Ko Ko Win on 6/12/14.
//  Copyright (c) 2014 Redstar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *quantityTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *gstTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

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

- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    
    int quantity = 0;
    float price = 0;
    float gst = 0;
    
    @try {
        quantity = self.quantityTextField.text.intValue;
    }
    @catch (NSException *exception) {
        NSLog( @"Invalid quantity." );
        return;
    }
    @finally { }
    
    @try {
        price = self.priceTextField.text.floatValue;
    }
    @catch (NSException *exception) {
        NSLog( @"Invalid price." );
        return;
    }
    @finally { }
    
    @try {
        gst = (self.gstTextField.text.floatValue / 100) + 1;
    }
    @catch (NSException *exception) {
        NSLog( @"Invalid GST input." );
        return;
    }
    @finally { }
    
    float finalAmount = quantity * price * gst;
    
    self.resultLabel.text = [NSString stringWithFormat:@"%f", finalAmount];
    
    self.resultLabel.textColor =[UIColor blueColor];
    
}

@end
