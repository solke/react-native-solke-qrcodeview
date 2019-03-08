//
//  QRCodeGenerateManager.m
//  RNQrcodeview
//


#import "QRCodeGenerateManager.h"

@implementation QRCodeGenerateManager
+ (UIImage *)generateWithColorQRCodeValue:(NSString *)value backgroundColor:(CIColor *)backgroundColor foregroundColor:(CIColor *)foregroundColor{
    
    // 1、创建滤镜对象
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 恢复滤镜的默认属性
    [filter setDefaults];
    
    // 2、设置数据
    NSString *string_data = value;
    // 将字符串转换成 NSdata
    NSData *qrImageData = [string_data dataUsingEncoding:NSUTF8StringEncoding];
    
    // 设置过滤器的输入值, KVC赋值
    [filter setValue:qrImageData forKey:@"inputMessage"];
    
    // 3、获得滤镜输出的图像
    CIImage *ciImage = [filter outputImage];
    
    // 图片小于(27,27),我们需要放大
    ciImage = [ciImage imageByApplyingTransform:CGAffineTransformMakeScale(9, 9)];
    
    // 4、创建彩色过滤器(彩色的用的不多)
    CIFilter * color_filter = [CIFilter filterWithName:@"CIFalseColor"];
    
    // 设置默认值
    [color_filter setDefaults];
    
    // 5、KVC 给私有属性赋值
    [color_filter setValue:ciImage forKey:@"inputImage"];
    
    // 6、前景色、背景色
    [color_filter setValue:foregroundColor forKey:@"inputColor0"];
    [color_filter setValue:backgroundColor forKey:@"inputColor1"];
    
    // 7、设置输出
    CIImage *colorImage = [color_filter outputImage];
    
    return [UIImage imageWithCIImage:colorImage];
}


@end
