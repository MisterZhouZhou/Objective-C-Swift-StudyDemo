

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>


@interface UIImage (Common)

+(UIImage *)imageWithColor:(UIColor *)aColor;
+(UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame;
-(UIImage*)scaledToSize:(CGSize)targetSize;
-(UIImage*)scaledToSize:(CGSize)targetSize highQuality:(BOOL)highQuality;
-(UIImage*)scaledToMaxSize:(CGSize )size;
-(UIImage*)thumbnailImage:(CGSize)targetSize withImage:(UIImage*)image;
+ (UIImage *)fullResolutionImageFromALAsset:(ALAsset *)asset;
-(NSData *)compressImageToTargrtSize:(CGFloat)targetSize withImage:(UIImage *)image;//传入要压缩的图片和压缩后的大小
@end
