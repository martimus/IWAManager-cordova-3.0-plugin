//
//  IWAManagerPlugin.m
//  test123
//
//  Created by obigo on 14. 1. 8..
//
//

#import "IWAManagerPlugin.h"

// NSNotification name
NSString *kSeedSelectedNotiName = @"seedSelectedNoti";

// NSNotification userInfo key
NSString *kSeedSelectedKey = @"seedSelectedKey";
NSString *kSelectedSeedIDKey = @"selectedSeedIDKey";
NSString *kSelectedActivityIDKey = @"selectedActivityIDKey";

@implementation IWAManagerPlugin

-(void) seedSelected:(CDVInvokedUrlCommand *) command
{
    // login process
    NSString* callbackId = command.callbackId;
    NSArray* arguments = command.arguments;
    
    NSDictionary *logInfo = [self makeSeedLogFromArguments:arguments];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kSeedSelectedNotiName
                                                        object:self
                                                      userInfo:logInfo];

    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OK"];
    [self.commandDelegate sendPluginResult:result callbackId:callbackId];
}

-(NSDictionary *) makeSeedLogFromArguments:(NSArray *)arguments
{
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    
    [userInfo setObject:[arguments objectAtIndex:0] forKey:kSelectedSeedIDKey];
    [userInfo setObject:[arguments objectAtIndex:1] forKey:kSelectedActivityIDKey];
    
    return userInfo;
}

@end
