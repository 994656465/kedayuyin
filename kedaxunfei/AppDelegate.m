//
//  AppDelegate.m
//  kedaxunfei
//
//  Created by mac on 2021/6/7.
//

#import "AppDelegate.h"
#import "IFlyMSC/IFlyMSC.h"
#define kXunFeiKey @"1f91d992"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //配置语音识别
    //Set log level
    /*!
     *  设置日志msc.log生成路径以及日志等级
     *
     *  | 日志打印等级             | 描述                               |
     *  |------------------------|-----------------------------------|
     *  | LVL_ALL                | 全部打印                           |
     *  | LVL_DETAIL             | 高，异常分析需要的级别                |
     *  | LVL_NORMAL             | 中，打印基本日志信息                  |
     *  | LVL_LOW                | 低，只打印主要日志信息                |
     *  | LVL_NONE               | 不打印                             |
     *
     *  @param level  -[in] 日志打印等级
     */
    [IFlySetting setLogFile:LVL_NONE];
    //Set whether to output log messages in Xcode console
    
    /*!
     *  是否打印控制台log<br>
     *  在软件发布时，建议关闭此log。
     *
     *  @param showLog -[in] YES,打印log;NO,不打印
     */
    [IFlySetting showLogcat:YES];
    // 初始化讯飞应用
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",kXunFeiKey];
    [IFlySpeechUtility createUtility:initString];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
