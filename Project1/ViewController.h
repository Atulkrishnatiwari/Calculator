//
//  ViewController.h
//  Project1
//
//  Created by Celestial on 08/11/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int currentOperation;
    
    double holdValue;
    
    double currentNo;
    double result;
    double tempratur;
    
    int variablelength;
}

@property (weak, nonatomic) IBOutlet UIStackView *equalButton;

@property (weak, nonatomic) IBOutlet UILabel *calcLabel;

- (IBAction)cancelOperation:(id)sender;


- (IBAction)currentOperation:(id)sender;


- (IBAction)numberAction:(id)sender;

@end

