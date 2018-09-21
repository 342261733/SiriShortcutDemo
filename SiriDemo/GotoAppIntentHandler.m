//
//  GotoAppIntentHandler.m
//  SiriDemo
//
//  Created by semyon on 2018/9/21.
//  Copyright © 2018年 cm. All rights reserved.
//

#import "GotoAppIntentHandler.h"

@implementation GotoAppIntentHandler

- (void)handleGotoPage:(GotoPageIntent *)intent completion:(void (^)(GotoPageIntentResponse *response))completion NS_SWIFT_NAME(handle(intent:completion:)) {
    // GotoPageIntentResponseCodeContinueInApp 打开app
    // GotoPageIntentResponseCodeSuccess 回调成功
    GotoPageIntentResponse *response = [[GotoPageIntentResponse alloc] initWithCode:GotoPageIntentResponseCodeSuccess userActivity:nil];
    completion(response);
}


@end
