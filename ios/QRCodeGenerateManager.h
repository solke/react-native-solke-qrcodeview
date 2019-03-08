
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
NS_ASSUME_NONNULL_BEGIN

@interface QRCodeGenerateManager : NSObject
+ (UIImage *)generateWithColorQRCodeValue:(NSString *)value backgroundColor:(CIColor *)backgroundColor foregroundColor:(CIColor *)foregroundColor;
@end

NS_ASSUME_NONNULL_END
