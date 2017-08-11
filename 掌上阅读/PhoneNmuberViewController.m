//
//  PhoneNmuberViewController.m
//  掌上阅读
//
//  Created by 易云时代 on 16/3/2.
//  Copyright © 2016年 易云时代_ZXW. All rights reserved.
//

#import "PhoneNmuberViewController.h"
#import "PersonalInformationViewController.h"

@interface PhoneNmuberViewController ()<UITextFieldDelegate>
{
    NSTimer *myTimer;
    int time;
}
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextFeild;
@property (weak, nonatomic) IBOutlet UITextField *securityCode;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation PhoneNmuberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    手机号码填写设置
    _phoneNumberTextFeild.delegate = self;
    _phoneNumberTextFeild.tag = 100;
//    验证码填写设置
    _securityCode.delegate = self;
    _securityCode.tag = 101;
//    倒计时添加方法
    _timeLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sendCode:)];
    [_timeLabel addGestureRecognizer:tap];
    time = 30;
    self.navigationItem.title = @"注册";
}
//验证码触发方法
- (IBAction)sendCode:(id)sender {
    
    NSString *phoneNumberStr = _phoneNumberTextFeild.text;
    //    判断电话号码的格式对不对
    if (phoneNumberStr.length < 11) {//电话号码不足11位
        
        UIAlertController *alterController = [UIAlertController alertControllerWithTitle:@"提示" message:@"手机号长度只能是11位" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alterController addAction:cancelAction];
        [alterController addAction:okAction];
        
        [self presentViewController:alterController animated:YES completion:nil];
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:phoneNumberStr];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:phoneNumberStr];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:phoneNumberStr];
        
        if ((isMatch1 || isMatch2 || isMatch3)) {
            myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(change) userInfo:nil repeats:YES];
        }else{
            //         提示框
            UIAlertController *alterController = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入号码格式不对" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alterController addAction:cancelAction];
            [alterController addAction:okAction];
            
            [self presentViewController:alterController animated:YES completion:nil];
        }
        
    }
    
}
//计时器方法
- (void)change{
 
    if ([_timeLabel.text isEqualToString:@"1秒后重新发送"]) {
        _timeLabel.text = @"重新发送";
        \
        _timeLabel.userInteractionEnabled = YES;
        [myTimer invalidate];
        UITapGestureRecognizer *tapPost = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(againPost)];
        [_timeLabel addGestureRecognizer:tapPost];
    }else{
        _timeLabel.text = [NSString stringWithFormat:@"%d秒后重新发送",time--];
        _timeLabel.userInteractionEnabled = NO;
    }
}
//计时器归零后重新发送的方法
- (void)againPost{
    time = 30;
    myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(change) userInfo:nil repeats:YES];
}
//下一步
- (IBAction)registerBtn:(id)sender {
    
    PersonalInformationViewController *person = [[PersonalInformationViewController alloc]init];
    [self.navigationController pushViewController:person animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//return键的代理方法 (**)
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    UITextField *textField1 = (UITextField *)[self.view viewWithTag:100];
    
    if (textField.tag == textField1.tag) {
        [textField1 resignFirstResponder];
    }
    return YES;
}
//点击别处 键盘隐藏
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITextField * field1 = (UITextField *)[self.view viewWithTag:100];
    [field1 resignFirstResponder];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
