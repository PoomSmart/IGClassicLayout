#import <Foundation/Foundation.h>

int (*IGExposePanoramaV2Variant)(id);
%hookf(int, IGExposePanoramaV2Variant, id arg1) {
    return 0;
}

int (*IGExposePanoramaV2ReelsTabEnabled)(id, id);
%hookf(int, IGExposePanoramaV2ReelsTabEnabled, id arg1, id arg2) {
    return 0;
}

int (*IGExposeHasDirectTab)(id);
%hookf(int, IGExposeHasDirectTab, id arg1) {
    return 1;
}

int (*IGYGatingShoppingDisabled)(id, id);
%hookf(int, IGYGatingShoppingDisabled, id arg1, id arg2) {
    return 1;
}

%hook IGDiscoveryTopReelsModel
+ (id)valueWithJSONDictionary:(id)arg1 objectStores:(id)arg2 error:(id *)arg3 {
    return nil;
}
%end

%ctor {
    NSString *frameworkPath = [NSString stringWithFormat:@"%@/Frameworks/FBSharedFramework.framework/FBSharedFramework", NSBundle.mainBundle.bundlePath];
    MSImageRef ref = MSGetImageByName([frameworkPath UTF8String]);
    IGExposePanoramaV2Variant = MSFindSymbol(ref, "_IGExposePanoramaV2Variant");
    IGExposePanoramaV2ReelsTabEnabled = MSFindSymbol(ref, "_IGExposePanoramaV2ReelsTabEnabled");
    IGExposeHasDirectTab = MSFindSymbol(ref, "_IGExposeHasDirectTab");
    IGYGatingShoppingDisabled = MSFindSymbol(ref, "_IGYGatingShoppingDisabled");
    %init;
}