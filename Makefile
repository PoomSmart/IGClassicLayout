TARGET = iphone:clang:latest:13.0
ARCHS = arm64
PACKAGE_VERSION = 1.0.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = IGClassicLayout

IGClassicLayout_FILES = Tweak.x
IGClassicLayout_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
