//
//  RSA__Tests.m
//  RSA加密Tests
//
//  Created by XWQ on 15/4/14.
//  Copyright (c) 2015年 _Name.im_. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "RSA.h"
@interface RSA__Tests : XCTestCase

@end

@implementation RSA__Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
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

    }];
}

@end
