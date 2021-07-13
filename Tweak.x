#import <Foundation/Foundation.h>

int (*IGExposePanoramaV2Variant)(id);
%hookf(int, IGExposePanoramaV2Variant, id arg1) {
    return 0;
}

%ctor {
    NSString *frameworkPath = [NSString stringWithFormat:@"%@/Frameworks/FBSharedFramework.framework/FBSharedFramework", NSBundle.mainBundle.bundlePath];
    MSImageRef ref = MSGetImageByName([frameworkPath UTF8String]);
    IGExposePanoramaV2Variant = (int (*)(id))MSFindSymbol(ref, "_IGExposePanoramaV2Variant");
    %init;
}