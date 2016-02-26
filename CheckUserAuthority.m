//
//  CheckUserAuthority.m
//  KaixinketangForTeacher
//
//  Created by tztddong on 16/2/24.
//  Copyright © 2016年 TZTD. All rights reserved.
//

#import "CheckUserAuthority.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVAudioSession.h>
@implementation CheckUserAuthority


+ (BOOL)checkCameraAuthority{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusAuthorized){
        return YES;
    }else{
        return NO;
    }
}
+ (BOOL)checkImageAuthority{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusAuthorized){
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)checkRecordAuthority{
    
    __block BOOL bCanRecord = YES;
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
    {
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
            [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
                bCanRecord = granted;
            }];
        }
    }
    return bCanRecord;
}

+ (BOOL)isFirstOpenApp{
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
        return YES;
    }else{
        return NO;
    }
}
@end
