THEOS_DEVICE_IP=192.168.0.199
THEOS_DEVICE_PORT=22

ARCHS = arm64
SDKVERSION = 9.3

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = iosqqhook
iosqqhook_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 QQ"
