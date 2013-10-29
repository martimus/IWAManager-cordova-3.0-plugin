//
//  IWAManager.m
//  HelloWorld
//
//  Created by obigo on 13. 10. 29..
//
//

#import "IWAManager.h"

@implementation IWAManager

-(void) login:(CDVInvokedUrlCommand *) command
{
    // login process
    NSDictionary* iwaProperties = [self loginOperation];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                  messageAsDictionary:iwaProperties];
    
    
    // after login callback
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
    NSString *resultJS = [pluginResult toSuccessCallbackString:command.callbackId];
    NSLog(@"%@",resultJS);
}

-(NSDictionary *) loginOperation
{
    NSMutableDictionary* iwaProps = [NSMutableDictionary dictionaryWithCapacity:4];
    
    [iwaProps setObject:@"iOS" forKey:@"platform"];
    [iwaProps setObject:@"1.0" forKey:@"version"];
    
    NSDictionary* iwaReturn = [NSDictionary dictionaryWithDictionary:iwaProps];
    return iwaReturn;
}

@end
