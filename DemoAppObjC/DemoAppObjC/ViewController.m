//
//  ViewController.m
//  DemoAppObjC
//
//  Created by Anton Boyarkin on 05/12/2019.
//  Copyright © 2019 ABSoftware. All rights reserved.
//

#import "ViewController.h"

@import CardValidator;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CreditCard *card = [[CreditCard alloc] init: @"4929804463622139"];
    NSLog(@"%@", card.number);
    NSLog(@"%@", card.network == CardTypeVisa ? @"Visa" : @"NotVisa");
    NSLog(@"%@", card.isValid ? @"VALID" : @"INVALID");
    
    CardValidator *validator = [[CardValidator alloc] init];
    NSLog(@"4929804463622138 - %@", [validator isValid:@"4929804463622138"] ? @"VALID" : @"INVALID");
    
    NSArray<NSString *> *cardNumbers = @[
        @"4929804463622139",
        @"4929804463622138",
        @"6762765696545485",
        @"4012111111111111",
        @"378282246310005",
        @"371449635398431",
        @"378734493671000",
        @"5610591081018250",
        @"30569309025904",
        @"4111111111111111"
    ];
    NSArray<CreditCard *> *cards = [validator filterWithList:cardNumbers validity:CardValidityValid network:CardTypeVisa];
    
    NSLog(@"%lu Valid Visa Cards", (unsigned long)cards.count);
}

@end
