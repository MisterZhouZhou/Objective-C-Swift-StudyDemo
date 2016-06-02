
//
//  ZWViewControllerProducter.m
//  根据控制器名称进行跳转
//
//  Created by rayootech on 16/6/1.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWTurnControllerProducter.h"

@implementation ZWTurnControllerProducter

#pragma mark -
#pragma mark -  不包含基本数据类型的参数方法
/**
 *  根据控制器名进行跳转，无需导入跳转的控制器头文件
 *
 *  @param className  需要跳转的控制器名
 *  @param parameters 想目标控制器跳转所需要的参数，不包含基本数据类型
 *
 *  @return 返回目标控制器
 */
- (UIViewController *)getViewControllerWithClassName:(NSString *)className parameter:(NSDictionary *)parameters
{
    Class class = NSClassFromString(className);
    if (!class) return nil;
    UIViewController *VC = [[class alloc]init];
    //遍历所有参数
    NSDictionary *mapDic = [self attributeMapDictionary:parameters];
    
    for (NSString *key in mapDic) {
        SEL selector = [self stringToSel:mapDic[key]];
        if ([VC respondsToSelector:selector]) {
            id value = parameters[key];
            if (!value || [value isKindOfClass:[NSNull class]]) {
                return nil;
            }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [VC performSelector:selector withObject:value];
#pragma clang diagnostic pop
        }
        else {
            return nil;
        }
    }
    return VC;
}


#pragma mark -
#pragma mark -  包含基本数据类型的参数方法
/**
*  根据控制器名进行跳转，无需导入跳转的控制器头文件
*
*  @param className  需要跳转的控制器名
*  @param parameters 想目标控制器跳转所需要的参数，包含基本数据类型
*
*  @return 返回目标控制器
*/
- (UIViewController *)getViewControllerWithClassName:(NSString *)className allParameter:(NSDictionary *)parameters
{
    Class class           = NSClassFromString(className);
    if (!class) return nil;
    UIViewController *VC  = [[class alloc]init];
    //遍历所有参数
     NSDictionary *mapDic = [self attributeMapDictionary:parameters];
    for (NSString *key in mapDic) {
        SEL selector      = [self stringToSel:mapDic[key]];
        if ([VC respondsToSelector:selector]) {
            id value = parameters[key];
            if (!value || [value isKindOfClass:[NSNull class]]) {
                return nil;
            }
            [VC setValue:value forKey:key];
        }
        else {
            return nil;
        }
    }
    return VC;
}



#pragma mark - action
- (SEL)stringToSel:(NSString *)attName
{
    //截取首字母
    NSString *first = [[attName substringToIndex:1] uppercaseString];
    NSString *end   = [attName substringFromIndex:1];
    NSString *setMethod = [NSString stringWithFormat:@"set%@%@:",first,end];
    //将字符串转成SEL类型
    return NSSelectorFromString(setMethod);
}


- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic
{
    
    NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];
    for (id key in jsonDic) {
        [mapDic setObject:key forKey:key];
    }
    return mapDic;
}


@end
