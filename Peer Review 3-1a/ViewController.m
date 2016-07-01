//
//  ViewController.m
//  Peer Review 3-1a
//
//  Created by Ewa Czekalska on 18/06/2016.
//  Copyright © 2016 Ewa Czekalska. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>
@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    self.convertButton.enabled=NO;
    self.req =[[CRCurrencyRequest alloc]init];
    self.req.delegate = self;
    [self.req start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies {
   
     self.convertButton.enabled=YES;
    double inputValue = [self.inputField.text floatValue];
    double euroValue = inputValue*currencies.EUR;
    NSString *tempEuro = [NSString stringWithFormat:@"%.2f", euroValue];
    self.currencyA.text = tempEuro;
    double poundValue = inputValue*currencies.GBP;
    NSString *tempPound = [NSString stringWithFormat:@"%.2f", poundValue];
    self.currencyB.text = tempPound;
    double zlotyValue = inputValue*currencies.PLN;
    NSString *tempZloty = [NSString stringWithFormat:@"%.2f", zlotyValue];
    self.currencyC.text = tempZloty;
}

@end
