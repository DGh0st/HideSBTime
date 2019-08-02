export ARCHS = armv7 arm64
export TARGET = iphone:clang:8.1:5.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HideSBTime
HideSBTime_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
