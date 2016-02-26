//
//  CheckUserAuthority.h
//  KaixinketangForTeacher
//
//  Created by tztddong on 16/2/24.
//  Copyright © 2016年 TZTD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckUserAuthority : NSObject
/**
 *  检查是否有使用相机的权限
 */
+ (BOOL)checkCameraAuthority;
/**
 *  检查是否有使用照片的权限
 */
+ (BOOL)checkImageAuthority;
/**
 *  检查是否有使用麦克风的权限
 */
+ (BOOL)checkRecordAuthority;
/**
 *  是否第一次启动APP
 */
+ (BOOL)isFirstOpenApp;
@end
