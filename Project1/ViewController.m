
#import "ViewController.h"
//#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
    
//    [/*[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];*/
    
    variablelength=0;
    currentOperation=0;
    holdValue=0;
    tempratur=0;
}


- (IBAction)numberAction:(id)sender
{
    int temp=currentNo;
    while(temp!=0)
    {
        temp=temp/10;
        variablelength++;
    }
    if([sender tag]!=12&&variablelength<=64)
    {
        currentNo=currentNo*10+(double)[sender tag];
        self.calcLabel.text=[NSString stringWithFormat:@"%6.0f",currentNo];
    }
     
//    else if([sender tag]==12)
//    {
//        currentNo=[self hasDot:self.calcLabel.text];
//    }
}

- (IBAction)currentOperation:(id)sender
{
    if(currentOperation==0)
    {
        result=currentNo;
    }
    else
    {
        switch (currentOperation)
        {
            case 1:
                holdValue+=result;
                result=holdValue+currentNo;
                self.calcLabel.text=[NSString stringWithFormat:@"%6.2f",result];
                holdValue=result;
                result=0;
                break;
            case 2:
                holdValue+=result;
                result=holdValue-currentNo;
                self.calcLabel.text=[NSString stringWithFormat:@"%6.2f",result];
                holdValue=result;
                result=0;
                break;
            case 3:
                holdValue+=result;
                result=holdValue*currentNo;
                self.calcLabel.text=[NSString stringWithFormat:@"%6.2f",result];
                holdValue=result;
                result=0;
                break;
            case 4:
                holdValue+=result;
                if (currentNo==0)
                {
                    holdValue=0;
                    currentNo=0;
                    self.calcLabel.text=@"Error";
                }
                else
                {
                    result=holdValue/currentNo;
                    self.calcLabel.text=[NSString stringWithFormat:@"%6.2f",result];
                    holdValue=result;
                    result=0;
                }
                break;
            case 5:
                tempratur=(currentNo-32)/1.8;
                self.calcLabel.text=[NSString stringWithFormat:@"%6.2f",tempratur];
                tempratur=0;
                currentNo=0;
                break;
            case 6:
                tempratur=currentNo* 1.8 + 32;
                self.calcLabel.text=[NSString stringWithFormat:@"%6.2f",tempratur];
                break;
            case 7:
                self.calcLabel.text=[NSString stringWithFormat:@"%6.2f",sqrt(currentNo)];
                tempratur=0;
                currentNo=0;
                break;
            case 9:
                holdValue+=result;
                if (currentNo==0)
                {
                    holdValue=0;
                    currentNo=0;
                    self.calcLabel.text=@"Error";
                }
                else
                {
                    result=fmod(holdValue, currentNo);
                    self.calcLabel.text=[NSString stringWithFormat:@"%6.2f",result];
                    holdValue=result;
                    result=0;
                }
            default:
                break;
        }
    }
    currentOperation =(int)[sender tag];
    currentNo =0;
    variablelength = 0;
    
}

- (IBAction)cancelOperation:(id)sender 
{
    if([sender tag]==0)
    {
        currentNo=0;
        holdValue=0;
        tempratur=0;
        self.calcLabel.text=@"0";
        variablelength=0;
    }
    else if([sender tag]==1)
    {
        int allDigit=[self.calcLabel.text floatValue];
        holdValue=0;
        tempratur=0;
        allDigit=allDigit/10;
        self.calcLabel.text=[NSString stringWithFormat:@"%d",allDigit];
        currentNo=allDigit;
        variablelength=0;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    /////
//    [self checkOrientation];
}


//- (void)orientationChanged:(NSNotification *)notification
//{
//    [self checkOrientation];
//}
//
//- (void)checkOrientation
//{
//    UIWindowScene *windowScene = (UIWindowScene *)[UIApplication.sharedApplication.connectedScenes anyObject];
//    UIInterfaceOrientation orientation = windowScene.interfaceOrientation;
//
//    if (UIInterfaceOrientationIsLandscape(orientation))
//    {
//        FirstViewController *firstViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SecondVC"];
//        [self.navigationController pushViewController:firstViewController animated:YES];
//    }
//}



//- (double)hasDot:(NSString *)str
//{
//    const char *charArray = [str UTF8String];
//    NSUInteger length = strlen(charArray);
//    if (length > 0 && charArray[length - 1] == '.')
//    {
//        return [_calcLabel.text doubleValue];
//    }
//    else
//    {
//        self.calcLabel.text =[str stringByAppendingFormat:@".0"];
//        currentNo=[_calcLabel.text doubleValue];
//        return currentNo;
//    }
//
//}


@end
