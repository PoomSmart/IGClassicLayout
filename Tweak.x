#import <Foundation/Foundation.h>

int (*IGExposePanoramaV2Variant)(id);
%hookf(int, IGExposePanoramaV2Variant, id arg1) {
    return 0;
}

%hook IGDiscoveryTopReelsModel
+ (id)valueWithJSONDictionary:(id)arg1 objectStores:(id)arg2 error:(id *)arg3 {
    return nil;
}
%end

%ctor {
    NSString *frameworkPath = [NSString stringWithFormat:@"%@/Frameworks/FBSharedFramework.framework/FBSharedFramework", NSBundle.mainBundle.bundlePath];
    MSImageRef ref = MSGetImageByName([frameworkPath UTF8String]);
    IGExposePanoramaV2Variant = (int (*)(id))MSFindSymbol(ref, "_IGExposePanoramaV2Variant");
    %init;
}