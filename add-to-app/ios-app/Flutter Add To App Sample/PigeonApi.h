// Autogenerated from Pigeon (v1.0.15), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class PersonMessageModel;

@interface PersonMessageModel : NSObject
@property(nonatomic, copy, nullable) NSString * name;
@end

/// The codec used by FlutterApi.
NSObject<FlutterMessageCodec> *FlutterApiGetCodec(void);

@interface FlutterApi : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (void)displayPersonPerson:(PersonMessageModel *)person completion:(void(^)(NSError *_Nullable))completion;
@end
/// The codec used by NativeApi.
NSObject<FlutterMessageCodec> *NativeApiGetCodec(void);

@protocol NativeApi
- (nullable PersonMessageModel *)getPersonWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void NativeApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<NativeApi> *_Nullable api);

NS_ASSUME_NONNULL_END