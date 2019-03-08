//
//  RNQRcodeViewManager.m
//  RNQrcodeview
//


#import "RNQRcodeViewManager.h"
#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>
#import <React/UIView+React.h>
#import "RNQRcodeView.h"
@implementation RNQRcodeViewManager
RCT_EXPORT_MODULE()
- (UIView *)view
{
    RNQRcodeView *qrView = [RNQRcodeView new];
    
    return qrView;
}

RCT_EXPORT_VIEW_PROPERTY(qrOptions, NSDictionary);
@end
