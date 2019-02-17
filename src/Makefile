EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
EXTRA_CFLAGS += -O1
#EXTRA_CFLAGS += -O3
#EXTRA_CFLAGS += -Wall
#EXTRA_CFLAGS += -Wextra
#EXTRA_CFLAGS += -Werror
#EXTRA_CFLAGS += -pedantic
#EXTRA_CFLAGS += -Wshadow -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes

EXTRA_CFLAGS += -Wno-unused-variable
EXTRA_CFLAGS += -Wno-unused-value
EXTRA_CFLAGS += -Wno-unused-label
EXTRA_CFLAGS += -Wno-unused-parameter
EXTRA_CFLAGS += -Wno-unused-function
EXTRA_CFLAGS += -Wno-unused
#EXTRA_CFLAGS += -Wno-uninitialized

GCC_VER_49 := $(shell echo `$(CC) -dumpversion | cut -f1-2 -d.` \>= 4.9 | bc )
ifeq ($(GCC_VER_49),1)
EXTRA_CFLAGS += -Wno-date-time	# Fix compile error && warning on gcc 4.9 and later
endif

EXTRA_CFLAGS += -I$(src)/include

EXTRA_LDFLAGS += --strip-debug

CONFIG_AUTOCFG_CP = n

########################## WIFI IC ############################
CONFIG_RTL8192E = y
######################### Interface ###########################
CONFIG_USB_HCI = y
########################## Features ###########################
CONFIG_MP_INCLUDED = y
CONFIG_POWER_SAVING = y
CONFIG_USB_AUTOSUSPEND = n
CONFIG_HW_PWRP_DETECTION = n
CONFIG_WIFI_TEST = n
CONFIG_BT_COEXIST = y
CONFIG_INTEL_WIDI = n
CONFIG_WAPI_SUPPORT = n
CONFIG_EFUSE_CONFIG_FILE = y
CONFIG_EXT_CLK = n
CONFIG_TRAFFIC_PROTECT = n
CONFIG_LOAD_PHY_PARA_FROM_FILE = y
CONFIG_TXPWR_BY_RATE_EN = n
CONFIG_TXPWR_LIMIT_EN = n
CONFIG_RTW_CHPLAN = 0xFF
CONFIG_RTW_ADAPTIVITY_EN = disable
CONFIG_RTW_ADAPTIVITY_MODE = normal
CONFIG_SIGNAL_SCALE_MAPPING = n
CONFIG_80211W = n
CONFIG_REDUCE_TX_CPU_LOADING = n
CONFIG_BR_EXT = y
CONFIG_TDLS = n
CONFIG_WIFI_MONITOR = n
CONFIG_MCC_MODE = n
CONFIG_APPEND_VENDOR_IE_ENABLE = n
CONFIG_RTW_NAPI = y
CONFIG_RTW_GRO = y
CONFIG_RTW_IPCAM_APPLICATION = n
CONFIG_RTW_REPEATER_SON = n
########################## Debug ###########################
CONFIG_RTW_DEBUG = y
# default log level is _DRV_INFO_ = 4,
# please refer to "How_to_set_driver_debug_log_level.doc" to set the available level.
CONFIG_RTW_LOG_LEVEL = 4
######################## Wake On Lan ##########################
CONFIG_WOWLAN = n
CONFIG_WAKEUP_TYPE = 0x7 #bit2: deauth, bit1: unicast, bit0: magic pkt.
CONFIG_GPIO_WAKEUP = n
CONFIG_WAKEUP_GPIO_IDX = default
CONFIG_HIGH_ACTIVE = n
CONFIG_PNO_SUPPORT = n
CONFIG_PNO_SET_DEBUG = n
CONFIG_AP_WOWLAN = n
######### Notify SDIO Host Keep Power During Syspend ##########
CONFIG_RTW_SDIO_PM_KEEP_POWER = y
###################### MP HW TX MODE FOR VHT #######################
CONFIG_MP_VHT_HW_TX_MODE = n
###################### Platform Related #######################
CONFIG_PLATFORM_I386_PC = n
CONFIG_PLATFORM_TURRIS_OMNIA = y
###############################################################

CONFIG_DRVEXT_MODULE = n

########### COMMON  #################################

_OS_INTFS_FILES :=	os_dep/osdep_service.o \
			os_dep/linux/os_intfs.o \
			os_dep/linux/usb_intf.o \
			os_dep/linux/usb_ops_linux.o \
			os_dep/linux/ioctl_linux.o \
			os_dep/linux/xmit_linux.o \
			os_dep/linux/mlme_linux.o \
			os_dep/linux/recv_linux.o \
			os_dep/linux/ioctl_cfg80211.o \
			os_dep/linux/rtw_cfgvendor.o \
			os_dep/linux/wifi_regd.o \
			os_dep/linux/rtw_android.o \
			os_dep/linux/rtw_proc.o

ifeq ($(CONFIG_MP_INCLUDED), y)
_OS_INTFS_FILES += os_dep/linux/ioctl_mp.o
endif

_HAL_INTFS_FILES :=	hal/hal_intf.o \
					hal/hal_com.o \
					hal/hal_com_phycfg.o \
					hal/hal_phy.o \
					hal/hal_dm.o \
					hal/hal_dm_acs.o \
					hal/hal_btcoex_wifionly.o \
					hal/hal_btcoex.o \
					hal/hal_mp.o \
					hal/hal_mcc.o \
					hal/hal_hci/hal_usb.o \
					hal/led/hal_usb_led.o \
					hal/HalPwrSeqCmd.o \
					hal/rtl8192e/Hal8192EPwrSeq.o\
					hal/rtl8192e/rtl8192e_xmit.o\
					hal/rtl8192e/rtl8192e_sreset.o \
					hal/rtl8192e/rtl8192e_hal_init.o \
					hal/rtl8192e/rtl8192e_phycfg.o \
					hal/rtl8192e/rtl8192e_rf6052.o \
					hal/rtl8192e/rtl8192e_dm.o \
					hal/rtl8192e/rtl8192e_rxdesc.o \
					hal/rtl8192e/rtl8192e_cmd.o \
					hal/rtl8192e/hal8192e_fw.o \
					hal/rtl8192e/usb/usb_halinit.o \
					hal/rtl8192e/usb/rtl8192eu_led.o \
					hal/rtl8192e/usb/rtl8192eu_xmit.o \
					hal/rtl8192e/usb/rtl8192eu_recv.o \
					hal/rtl8192e/usb/usb_ops_linux.o \
					hal/efuse/rtl8192e/HalEfuseMask8192E_USB.o

EXTRA_CFLAGS += -I$(src)/platform
_PLATFORM_FILES := platform/platform_ops.o

EXTRA_CFLAGS += -I$(src)/hal/btc
_BTC_FILES += hal/btc/halbtc8723bwifionly.o \
				hal/btc/halbtc8822bwifionly.o \
				hal/btc/halbtc8821cwifionly.o
ifeq ($(CONFIG_BT_COEXIST), y)
_BTC_FILES += hal/btc/halbtc8192e1ant.o  hal/btc/halbtc8192e2ant.o
endif

EXTRA_CFLAGS += -I$(src)/hal/phydm

_PHYDM_FILES := hal/phydm/phydm_debug.o	\
				hal/phydm/phydm_antdiv.o\
				hal/phydm/phydm_soml.o\
				hal/phydm/phydm_smt_ant.o\
				hal/phydm/phydm_antdect.o\
				hal/phydm/phydm_interface.o\
				hal/phydm/phydm_phystatus.o\
				hal/phydm/phydm_hwconfig.o\
				hal/phydm/phydm.o\
				hal/phydm/phydm_dig.o\
				hal/phydm/phydm_pathdiv.o\
				hal/phydm/phydm_rainfo.o\
				hal/phydm/phydm_dynamictxpower.o\
				hal/phydm/phydm_adaptivity.o\
				hal/phydm/phydm_cfotracking.o\
				hal/phydm/phydm_noisemonitor.o\
				hal/phydm/phydm_acs.o\
				hal/phydm/phydm_beamforming.o\
				hal/phydm/phydm_dfs.o\
				hal/phydm/txbf/halcomtxbf.o\
				hal/phydm/txbf/haltxbfinterface.o\
				hal/phydm/txbf/phydm_hal_txbf_api.o\
				hal/phydm/phydm_adc_sampling.o\
				hal/phydm/phydm_ccx.o\
				hal/phydm/phydm_psd.o\
				hal/phydm/phydm_primary_cca.o\
				hal/phydm/phydm_cck_pd.o\
				hal/phydm/phydm_rssi_monitor.o\
				hal/phydm/phydm_auto_dbg.o\
				hal/phydm/phydm_math_lib.o\
				hal/phydm/phydm_api.o\
				hal/phydm/phydm_pow_train.o\
				hal/phydm/halrf/halrf.o\
				hal/phydm/halrf/halphyrf_ce.o\
				hal/phydm/halrf/halrf_powertracking_ce.o\
				hal/phydm/halrf/halrf_powertracking.o\
				hal/phydm/halrf/halrf_kfree.o \
				hal/phydm/rtl8192e/halhwimg8192e_mac.o\
				hal/phydm/rtl8192e/halhwimg8192e_bb.o\
				hal/phydm/rtl8192e/halhwimg8192e_rf.o\
				hal/phydm/halrf/rtl8192e/halrf_8192e_ce.o\
				hal/phydm/rtl8192e/phydm_regconfig8192e.o\
				hal/phydm/rtl8192e/phydm_rtl8192e.o

EXTRA_CFLAGS += -DCONFIG_RTL8192E

ifeq ($(CONFIG_USB_AUTOSUSPEND), y)
EXTRA_CFLAGS += -DCONFIG_USB_AUTOSUSPEND
endif

ifeq ($(CONFIG_MP_INCLUDED), y)
EXTRA_CFLAGS += -DCONFIG_MP_INCLUDED
endif

ifeq ($(CONFIG_POWER_SAVING), y)
EXTRA_CFLAGS += -DCONFIG_POWER_SAVING
endif

ifeq ($(CONFIG_HW_PWRP_DETECTION), y)
EXTRA_CFLAGS += -DCONFIG_HW_PWRP_DETECTION
endif

ifeq ($(CONFIG_WIFI_TEST), y)
EXTRA_CFLAGS += -DCONFIG_WIFI_TEST
endif

ifeq ($(CONFIG_BT_COEXIST), y)
EXTRA_CFLAGS += -DCONFIG_BT_COEXIST
endif

ifeq ($(CONFIG_INTEL_WIDI), y)
EXTRA_CFLAGS += -DCONFIG_INTEL_WIDI
endif

ifeq ($(CONFIG_WAPI_SUPPORT), y)
EXTRA_CFLAGS += -DCONFIG_WAPI_SUPPORT
endif


ifeq ($(CONFIG_EFUSE_CONFIG_FILE), y)
EXTRA_CFLAGS += -DCONFIG_EFUSE_CONFIG_FILE

#EFUSE_MAP_PATH
USER_EFUSE_MAP_PATH ?=
ifneq ($(USER_EFUSE_MAP_PATH),)
EXTRA_CFLAGS += -DEFUSE_MAP_PATH=\"$(USER_EFUSE_MAP_PATH)\"
else ifeq (8192eu, 8189es)
EXTRA_CFLAGS += -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_8189e.map\"
else ifeq (8192eu, 8723bs)
EXTRA_CFLAGS += -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_8723bs.map\"
else
EXTRA_CFLAGS += -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_8192eu.map\"
endif

#WIFIMAC_PATH
USER_WIFIMAC_PATH ?=
ifneq ($(USER_WIFIMAC_PATH),)
EXTRA_CFLAGS += -DWIFIMAC_PATH=\"$(USER_WIFIMAC_PATH)\"
else
EXTRA_CFLAGS += -DWIFIMAC_PATH=\"/data/wifimac.txt\"
endif

endif

ifeq ($(CONFIG_EXT_CLK), y)
EXTRA_CFLAGS += -DCONFIG_EXT_CLK
endif

ifeq ($(CONFIG_TRAFFIC_PROTECT), y)
EXTRA_CFLAGS += -DCONFIG_TRAFFIC_PROTECT
endif

ifeq ($(CONFIG_LOAD_PHY_PARA_FROM_FILE), y)
EXTRA_CFLAGS += -DCONFIG_LOAD_PHY_PARA_FROM_FILE
#EXTRA_CFLAGS += -DREALTEK_CONFIG_PATH_WITH_IC_NAME_FOLDER
EXTRA_CFLAGS += -DREALTEK_CONFIG_PATH=\"/lib/firmware/\"
endif

ifeq ($(CONFIG_TXPWR_BY_RATE_EN), n)
EXTRA_CFLAGS += -DCONFIG_TXPWR_BY_RATE_EN=0
else ifeq ($(CONFIG_TXPWR_BY_RATE_EN), y)
EXTRA_CFLAGS += -DCONFIG_TXPWR_BY_RATE_EN=1
else ifeq ($(CONFIG_TXPWR_BY_RATE_EN), auto)
EXTRA_CFLAGS += -DCONFIG_TXPWR_BY_RATE_EN=2
endif

ifeq ($(CONFIG_TXPWR_LIMIT_EN), n)
EXTRA_CFLAGS += -DCONFIG_TXPWR_LIMIT_EN=0
else ifeq ($(CONFIG_TXPWR_LIMIT_EN), y)
EXTRA_CFLAGS += -DCONFIG_TXPWR_LIMIT_EN=1
else ifeq ($(CONFIG_TXPWR_LIMIT_EN), auto)
EXTRA_CFLAGS += -DCONFIG_TXPWR_LIMIT_EN=2
endif

ifneq ($(CONFIG_RTW_CHPLAN), 0xFF)
EXTRA_CFLAGS += -DCONFIG_RTW_CHPLAN=$(CONFIG_RTW_CHPLAN)
endif

ifeq ($(CONFIG_CALIBRATE_TX_POWER_BY_REGULATORY), y)
EXTRA_CFLAGS += -DCONFIG_CALIBRATE_TX_POWER_BY_REGULATORY
endif

ifeq ($(CONFIG_CALIBRATE_TX_POWER_TO_MAX), y)
EXTRA_CFLAGS += -DCONFIG_CALIBRATE_TX_POWER_TO_MAX
endif

ifeq ($(CONFIG_RTW_ADAPTIVITY_EN), disable)
EXTRA_CFLAGS += -DCONFIG_RTW_ADAPTIVITY_EN=0
else ifeq ($(CONFIG_RTW_ADAPTIVITY_EN), enable)
EXTRA_CFLAGS += -DCONFIG_RTW_ADAPTIVITY_EN=1
endif

ifeq ($(CONFIG_RTW_ADAPTIVITY_MODE), normal)
EXTRA_CFLAGS += -DCONFIG_RTW_ADAPTIVITY_MODE=0
else ifeq ($(CONFIG_RTW_ADAPTIVITY_MODE), carrier_sense)
EXTRA_CFLAGS += -DCONFIG_RTW_ADAPTIVITY_MODE=1
endif

ifeq ($(CONFIG_SIGNAL_SCALE_MAPPING), y)
EXTRA_CFLAGS += -DCONFIG_SIGNAL_SCALE_MAPPING
endif

ifeq ($(CONFIG_80211W), y)
EXTRA_CFLAGS += -DCONFIG_IEEE80211W
endif

ifeq ($(CONFIG_WOWLAN), y)
EXTRA_CFLAGS += -DCONFIG_WOWLAN -DRTW_WAKEUP_EVENT=$(CONFIG_WAKEUP_TYPE)
endif

ifeq ($(CONFIG_AP_WOWLAN), y)
EXTRA_CFLAGS += -DCONFIG_AP_WOWLAN
endif

ifeq ($(CONFIG_PNO_SUPPORT), y)
EXTRA_CFLAGS += -DCONFIG_PNO_SUPPORT
ifeq ($(CONFIG_PNO_SET_DEBUG), y)
EXTRA_CFLAGS += -DCONFIG_PNO_SET_DEBUG
endif
endif

ifeq ($(CONFIG_GPIO_WAKEUP), y)
EXTRA_CFLAGS += -DCONFIG_GPIO_WAKEUP
ifeq ($(CONFIG_HIGH_ACTIVE), y)
EXTRA_CFLAGS += -DHIGH_ACTIVE=1
else
EXTRA_CFLAGS += -DHIGH_ACTIVE=0
endif
endif

ifneq ($(CONFIG_WAKEUP_GPIO_IDX), default)
EXTRA_CFLAGS += -DWAKEUP_GPIO_IDX=$(CONFIG_WAKEUP_GPIO_IDX)
endif

ifeq ($(CONFIG_RTW_SDIO_PM_KEEP_POWER), y)
endif

ifeq ($(CONFIG_REDUCE_TX_CPU_LOADING), y)
EXTRA_CFLAGS += -DCONFIG_REDUCE_TX_CPU_LOADING
endif

ifeq ($(CONFIG_BR_EXT), y)
BR_NAME = br0
EXTRA_CFLAGS += -DCONFIG_BR_EXT
EXTRA_CFLAGS += '-DCONFIG_BR_EXT_BRNAME="'$(BR_NAME)'"'
endif


ifeq ($(CONFIG_TDLS), y)
EXTRA_CFLAGS += -DCONFIG_TDLS
endif

ifeq ($(CONFIG_WIFI_MONITOR), y)
EXTRA_CFLAGS += -DCONFIG_WIFI_MONITOR
endif

ifeq ($(CONFIG_MCC_MODE), y)
EXTRA_CFLAGS += -DCONFIG_MCC_MODE
endif

ifeq ($(CONFIG_RTW_NAPI), y)
EXTRA_CFLAGS += -DCONFIG_RTW_NAPI
endif

ifeq ($(CONFIG_RTW_GRO), y)
EXTRA_CFLAGS += -DCONFIG_RTW_GRO
endif

ifeq ($(CONFIG_RTW_REPEATER_SON), y)
EXTRA_CFLAGS += -DCONFIG_RTW_REPEATER_SON
endif

ifeq ($(CONFIG_RTW_IPCAM_APPLICATION), y)
EXTRA_CFLAGS += -DCONFIG_RTW_IPCAM_APPLICATION
ifeq ($(CONFIG_WIFI_MONITOR), n)
EXTRA_CFLAGS += -DCONFIG_WIFI_MONITOR
endif
endif

ifeq ($(CONFIG_MP_VHT_HW_TX_MODE), y)
EXTRA_CFLAGS += -DCONFIG_MP_VHT_HW_TX_MODE
ifeq ($(CONFIG_PLATFORM_I386_PC), y)
## For I386 X86 ToolChain use Hardware FLOATING
EXTRA_CFLAGS += -mhard-float
else
## For ARM ToolChain use Hardware FLOATING
EXTRA_CFLAGS += -mfloat-abi=hard
endif
endif

ifeq ($(CONFIG_APPEND_VENDOR_IE_ENABLE), y)
EXTRA_CFLAGS += -DCONFIG_APPEND_VENDOR_IE_ENABLE
endif

ifeq ($(CONFIG_RTW_DEBUG), y)
EXTRA_CFLAGS += -DCONFIG_RTW_DEBUG
EXTRA_CFLAGS += -DRTW_LOG_LEVEL=$(CONFIG_RTW_LOG_LEVEL)
endif

EXTRA_CFLAGS += -DDM_ODM_SUPPORT_TYPE=0x04

ifeq ($(CONFIG_PLATFORM_I386_PC), y)
EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
SUBARCH := $(shell uname -m | sed -e s/i.86/i386/)
ARCH ?= $(SUBARCH)
CROSS_COMPILE ?=
KVER  := $(shell uname -r)
KSRC := /lib/modules/$(KVER)/build
MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/net/wireless/
INSTALL_PREFIX :=
STAGINGMODDIR := /lib/modules/$(KVER)/kernel/drivers/staging
endif

ifeq ($(CONFIG_PLATFORM_TURRIS_OMNIA), y)
EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
endif


8192eu-y += core/rtw_cmd.o \
			core/rtw_security.o \
			core/rtw_debug.o \
			core/rtw_io.o \
			core/rtw_ioctl_query.o \
			core/rtw_ioctl_set.o \
			core/rtw_ieee80211.o \
			core/rtw_mlme.o \
			core/rtw_mlme_ext.o \
			core/rtw_mi.o \
			core/rtw_wlan_util.o \
			core/rtw_vht.o \
			core/rtw_pwrctrl.o \
			core/rtw_rf.o \
			core/rtw_recv.o \
			core/rtw_sta_mgt.o \
			core/rtw_ap.o \
			core/rtw_xmit.o	\
			core/rtw_p2p.o \
			core/rtw_rson.o \
			core/rtw_tdls.o \
			core/rtw_br_ext.o \
			core/rtw_iol.o \
			core/rtw_sreset.o \
			core/rtw_btcoex_wifionly.o \
			core/rtw_btcoex.o \
			core/rtw_beamforming.o \
			core/rtw_odm.o \
			core/efuse/rtw_efuse.o

8192eu-$(CONFIG_INTEL_WIDI) += core/rtw_intel_widi.o

8192eu-$(CONFIG_WAPI_SUPPORT) += 	core/rtw_wapi.o \
									core/rtw_wapi_sms4.o

8192eu-y += $(_OS_INTFS_FILES)
8192eu-y += $(_HAL_INTFS_FILES)
8192eu-y += $(_PHYDM_FILES)
8192eu-y += $(_BTC_FILES)
8192eu-y += $(_PLATFORM_FILES)

8192eu-$(CONFIG_MP_INCLUDED) += core/rtw_mp.o

obj-m := 8192eu.o
