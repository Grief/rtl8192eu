#
# Copyright (C) 2008-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=rtl8192eu
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/rtl8192eu
  SUBMENU:=Other modules
  TITLE:=Simple GPIO Button Hotplug driver
  FILES:=$(PKG_BUILD_DIR)/8192eu.ko
  DEPENDS:=+kmod-cfg80211 +compat-wireless
  AUTOLOAD:=$(call AutoLoad,30,8192eu,1)
  KCONFIG:=
endef

define KernelPackage/rtl8192eu/description
 rtl8192eu
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
#	 $(MAKE) ARCH="$(LINUX_KARCH)" CROSS_COMPILE="$(TARGET_CROSS)" -C "$(LINUX_DIR)" M="$(PKG_BUILD_DIR)" modules
	$(MAKE) -C $(PKG_BUILD_DIR) \
		ARCH="$(LINUX_KARCH)" \
		$(TARGET_CONFIGURE_OPTS) \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		KERNELVERSION="$(KERNEL)" \
		KERNEL_VERSION="$(LINUX_VERSION)" \
		KERNELDIR="$(LINUX_DIR)" \
		KSRC:="$(LINUX_DIR)" \
		KVERS:="$(LINUX_VERSION)" \
		TOPDIR:="$(TOPDIR)" \
		INCLUDE_DIR:="$(INCLUDE_DIR)" \
		PWD:="$(PKG_BUILD_DIR)" \
		MODULES_EXTRA:="$(DAHDI_MODULES_EXTRA)" \
		-C "$(LINUX_DIR)" M="$(PKG_BUILD_DIR)" modules
endef

$(eval $(call KernelPackage,rtl8192eu))
