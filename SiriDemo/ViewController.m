//
//  ViewController.m
//  SiriDemo
//
//  Created by semyon on 2018/9/20.
//  Copyright © 2018年 cm. All rights reserved.
//

#import "ViewController.h"
#import <Intents/Intents.h>
#import <IntentsUI/IntentsUI.h>
#import "GotoPageIntent.h"

@interface ViewController ()<INUIAddVoiceShortcutViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addShortCut];
}

- (void)addShortCut {
//    NSUserActivity *activity = [[NSUserActivity alloc] initWithActivityType:@"type"];
//    INShortcut *suggestions = [[INShortcut alloc] initWithUserActivity:activity];

//    GotoPageIntent *intent = [[GotoPageIntent alloc] init];
//    intent.suggestedInvocationPhrase = @"快捷";
//    INShortcut *shortcurt = [[INShortcut alloc] initWithIntent:intent];
//
//    [[INVoiceShortcutCenter sharedCenter] setShortcutSuggestions:@[shortcurt]];
    
//    INInteraction *interaction = [[INInteraction alloc] initWithIntent:nil response:nil];

    [[INVoiceShortcutCenter sharedCenter] getAllVoiceShortcutsWithCompletion:^(NSArray<INVoiceShortcut *> * _Nullable voiceShortcuts, NSError * _Nullable error) {
        NSLog(@"vscu %@", voiceShortcuts);
    }];
    
}


- (IBAction)gotoAddVoicePage:(id)sender {
    GotoPageIntent *intent = [[GotoPageIntent alloc] init]; // GotoPageIntent为我们自定义的Intent，找不到看上面
    intent.suggestedInvocationPhrase = @"打开app"; // 这是建议的提示语，会展示在页面上
    INShortcut *shortcurt = [[INShortcut alloc] initWithIntent:intent];
    
    INUIAddVoiceShortcutViewController *addvc = [[INUIAddVoiceShortcutViewController alloc] initWithShortcut:shortcurt];
    addvc.delegate = self;
    [self presentViewController:addvc animated:YES completion:nil];
}

#pragma mark - INUIAddVoiceShortcutViewControllerDelegate

/*!
 @abstract Called after the user finishes the setup flow for the voice shortcut, with either the successfully-added voice shortcut, or an error.
 @discussion Your implementation of this method should dismiss the view controller.
 */
- (void)addVoiceShortcutViewController:(INUIAddVoiceShortcutViewController *)controller didFinishWithVoiceShortcut:(nullable INVoiceShortcut *)voiceShortcut error:(nullable NSError *)error; {
    if (!error) {
        [[INVoiceShortcutCenter sharedCenter] setShortcutSuggestions:@[voiceShortcut]]; // 这个写不写呢？？
        [controller dismissViewControllerAnimated:YES completion:nil];
    }
}

/*!
 @abstract Called if the user cancels the setup flow; the voice shortcut was not added.
 @discussion Your implementation of this method should dismiss the view controller.
 */
- (void)addVoiceShortcutViewControllerDidCancel:(INUIAddVoiceShortcutViewController *)controller; {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
