#import "RNQRcodeView.h"
#import "QRCodeGenerateManager.h"
@interface RNQRcodeView ()

@property (nonatomic, copy)NSString *qrValue;
@property (nonatomic, assign)NSNumber* size;
@property (nonatomic, copy)NSString *backgroundColor;
@property (nonatomic, copy)NSString *foregroundColor;
@end
@implementation RNQRcodeView
{
    UIImageView *_qrcodeView;
}

- (void)setQrOptions:(NSDictionary *)qrOptions
{
    if (![_qrOptions isEqualToDictionary:qrOptions]) {
        _qrOptions = [qrOptions copy];
        [self visitOptions];
    }
}

- (void)visitOptions
{
    // Check for Options
    NSString *qrValue = _qrOptions[@"value"];
    if(qrValue != NULL){
        _qrValue = qrValue;
    }
    NSNumber *size = _qrOptions[@"size"];
    if(size != NULL){
        _size = size;
    }
    NSString *backgroundColor = _qrOptions[@"backgroundColor"];
    if(backgroundColor != NULL){
        _backgroundColor = backgroundColor;
    }
    NSString *foregroundColor = _qrOptions[@"foregroundColor"];
    if(foregroundColor != NULL){
        _foregroundColor = foregroundColor;
    }
//    UIImage *qrCodeImg = [QRCodeGenerateManager generateWithDefaultQRCodeData:_qrValue imageViewWidth:400];
    UIImage *qrCodeImg = [QRCodeGenerateManager generateWithColorQRCodeValue:qrValue backgroundColor:[self colorWithHexString:backgroundColor] foregroundColor:[self colorWithHexString:foregroundColor]];
    _qrcodeView.image = qrCodeImg;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        super.backgroundColor = [UIColor clearColor];
        _qrcodeView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [self addSubview:_qrcodeView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _qrcodeView.frame = self.bounds;
}

- (CIColor *)colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [CIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [CIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    NSLog(@"color:%@::%@::%@",rString,gString,bString);
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [CIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end

