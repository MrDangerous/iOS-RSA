//
//  ViewController.m
//  RSA加密
//
//  Created by XWQ on 15/4/14.
//  Copyright (c) 2015年 _Name.im_. All rights reserved.
//

#import "ViewController.h"
#import "RSA.h"
#import "NSString+Base64.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RSA *rsa = [RSA shareInstance];
    [rsa generateKeyPairRSACompleteBlock:^{
        if (1) {
            //encrypt     加密
            
            NSString *encode = @"谢文强";
            NSData *encryptData = [rsa RSA_EncryptUsingPublicKeyWithData:[encode dataUsingEncoding:NSUTF8StringEncoding]];
            
            NSString *str = [[NSString alloc]initWithData:[encryptData base64EncodedDataWithOptions:encryptData] encoding:NSUTF8StringEncoding];
            
            
            NSLog(@"-----%@",str);
            
            
            
            //decrypt     解密
            NSData *decryptData = [rsa RSA_DecryptUsingPrivateKeyWithData:encryptData];
            NSString *originString = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
            NSLog(@"-----%@",originString);
            
        }
    }];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
