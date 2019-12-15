#!/usr/bin/env bash

# IMPORTANT: Don't forget to logout from your Apple ID in the settings before running it!
# IMPORTANT: You will need to run this script from Recovery. In fact, macOS Catalina brings read-only filesystem which prevent this script from working from the main OS.
# This script needs to be run from the volume you wish to use.
# E.g. run it like this: cd /Volumes/Macintosh\ HD && sh /Volumes/Macintosh\ HD/Users/sabri/Desktop/disable.sh
# WARNING: It might disable things that you may not like. Please double check the services in the TODISABLE vars.

# Get active services: launchctl list | grep -v "\-\t0"
# Find a service: grep -lR [service] /System/Library/Launch* /Library/Launch* ~/Library/LaunchAgents

# Agents to disable
# 'com.apple.speech.speechdatainstallerd' 'com.apple.speech.speechsynthesisd' 'com.apple.speech.synthesisserver' will freeze Edit menus
# 'com.apple.bird' will prevent saving prompt from being shown

AGENTS=(
	'com.apple.AddressBook.ContactsAccountsService'
	'com.apple.AirPlayUIAgent'
	'com.apple.AirPortBaseStationAgent'
	'com.apple.AOSPushRelay'
	'com.apple.appleseed.seedusaged'
	'com.apple.assistant_service'
	'com.apple.assistantd'
	'com.apple.atsd.useragent'
	'com.apple.CalendarAgent'
	'com.apple.CallHistoryPluginHelper'
	'com.apple.CallHistorySyncHelper'
	'com.apple.cloudd'
	'com.apple.cloudfamilyrestrictionsd-mac'
	'com.apple.cloudpaird'
	'com.apple.cloudphotosd'
	'com.apple.CommCenter-osx'
	'com.apple.coreparsec.silhouette'
	'com.apple.corespotlightd'
	'com.apple.corespotlightservice'
	'com.apple.DictationIM'
	'com.apple.familycircled'
	'com.apple.familycontrols.useragent'
	'com.apple.familynotificationd'
	'com.apple.followupd'
	'com.apple.gamed'
	'com.apple.geodMachServiceBridge'
	'com.apple.icdd'
	'com.apple.icloud.findmydeviced.findmydevice-user-agent'
	'com.apple.icloud.fmfd'
	'com.apple.iCloudUserNotifications'
	'com.apple.identityservicesd'
	'com.apple.imagent'
	'com.apple.IMLoggingAgent'
	'com.apple.macos.studentd'
	'com.apple.Maps.mapspushd'
	'com.apple.Maps.pushdaemon'
	'com.apple.mediaremoteagent'
	'com.apple.MRTa'
	'com.apple.NowPlayingTouchUI'
	'com.apple.parentalcontrols.check'
	'com.apple.parsecd'
	'com.apple.passd'
	'com.apple.personad'
	'com.apple.photoanalysisd'
	'com.apple.photolibraryd'
	'com.apple.quicklook'
	'com.apple.quicklook.ThumbnailsAgent'
	'com.apple.rapportd-user'
	'com.apple.rcd'
	'com.apple.RemoteDesktop'
	'com.apple.ReportCrash'
	'com.apple.ReportCrash.Self'
	'com.apple.Safari.SafeBrowsing.Service'
	'com.apple.SafariBookmarksSyncAgent'
	'com.apple.SafariCloudHistoryPushAgent'
	'com.apple.safaridavclient'
	'com.apple.SafariHistoryServiceAgent'
	'com.apple.SafariLaunchAgent'
	'com.apple.SafariNotificationAgent'
	'com.apple.SafariPlugInUpdateNotifier'
	'com.apple.screensharing.agent'
	'com.apple.screensharing.menuextra'
	'com.apple.screensharing.MessagesAgent'
	'com.apple.ScreenTimeAgent'
	'com.apple.security.cloudkeychainproxy3'
	'com.apple.security.idskeychainsyncingproxy'
	'com.apple.security.keychain-circle-notification'
	'com.apple.security.keychainsyncingoveridsproxy'
	'com.apple.sharingd'
	'com.apple.Siri.agent'
	'com.apple.soagent'
	'com.apple.SocialPushAgent'
	'com.apple.spindump_agent'
	'com.apple.Spotlight'
	'com.apple.SSInvitationAgent'
	'com.apple.suggestd'
	'com.apple.syncdefaultsd'
	'com.apple.telephonyutilities.callservicesd'
	'com.apple.touristd'
	'com.apple.UsageTrackingAgent'
)

# iCloud
AGENTS+=(
	'com.apple.cloudd'
	'com.apple.cloudpaird'
	'com.apple.cloudphotod'
	'com.apple.icloud.findmydeviced.findmydevice-user-agent'
	'com.apple.icloud.fmfd'
	'com.apple.icloud.searchpartyuseragent'
	'com.apple.iCloudUserNotifications'
	'com.apple.protectedcloudstorage.protectedcloudkeysyncing'
	'com.apple.security.cloudkeychainproxy3'
)

# Safari useless stuff
AGENTS+=(
	'com.apple.SafariBookmarksSyncAgent'
	'com.apple.SafariCloudHistoryPushAgent'
	'com.apple.WebKit.PluginAgent'
)

# iMessage / Facetime
AGENTS+=(
	'com.apple.avconferenced'
	'com.apple.imagent'
	'com.apple.imautomatichistorydeletionagent'
	'com.apple.imklaunchagent'
	'com.apple.imtransferagent'
)

# Game Center / Passbook / Apple TV / Homekit...
AGENTS+=(
	'com.apple.CommCenter-osx'
	'com.apple.gamed'
	'com.apple.homed'
	'com.apple.Maps.pushdaemon'
	'com.apple.passd'
	'com.apple.videosubscriptionsd'
)

# Ad-related
AGENTS+=(
	'com.apple.ap.adprivacyd'
	'com.apple.ap.adservicesd'
)

# Screensharing
AGENTS+=(
	'com.apple.screensharing.agent'
	'com.apple.screensharing.menuextra'
	'com.apple.screensharing.MessagesAgent'
)

# Siri
AGENTS+=(
	'com.apple.assistant_service'
	'com.apple.assistantd'
	'com.apple.parsec-fbf'
	'com.apple.Siri.agent'
	'com.apple.siriknowledged'
)

# VoiceOver / accessibility-related stuff
AGENTS+=(
	'com.apple.accessibility.AXVisualSupportAgent'
	'com.apple.accessibility.dfrhud'
	'com.apple.accessibility.heard'
	'com.apple.voicememod'
	'com.apple.VoiceOver'
)

# Quicklook
AGENTS+=(
	'com.apple.quicklook'
	'com.apple.quicklook.ThumbnailsAgent'
	'com.apple.quicklook.ui.helper'
)

# Sidecar
AGENTS+=(
	'com.apple.sidecar-hid-relay'
	'com.apple.sidecar-relay'
)

# Debugging process
AGENTS+=(
	'com.apple.DiagnosticReportCleanup'
	'com.apple.ReportCrash'
	'com.apple.ReportGPURestart'
	'com.apple.ReportPanic'
	'com.apple.spindump_agent'
	'com.apple.TrustEvaluationAgent'
)

# Others
AGENTS+=(
	'com.apple.AddressBook.abd'
	'com.apple.AirPlayUIAgent'
	'com.apple.AirPortBaseStationAgent'
	'com.apple.amp.mediasharingd'
	'com.apple.AOSHeartbeat'
	'com.apple.AOSPushRelay'
	'com.apple.appleseed.seedusaged'
	'com.apple.appleseed.seedusaged.postinstall'
	'com.apple.CallHistoryPluginHelper'
	'com.apple.CallHistorySyncHelper'
	'com.apple.exchange.exchangesyncd'
	'com.apple.familycircled'
	'com.apple.familycontrols.useragent'
	'com.apple.familynotificationd'
	'com.apple.findmymacmessenger'
	'com.apple.helpd'
	'com.apple.identityservicesd'
	'com.apple.java.InstallOnDemand'
	'com.apple.KeyboardAccessAgent'
	'com.apple.macos.studentd'
	'com.apple.mediaanalysisd'
	'com.apple.mediaremoteagent'
	'com.apple.parentalcontrols.check'
	'com.apple.parsecd'
	'com.apple.photoanalysisd'
	'com.apple.remindd'
	'com.apple.RemoteDesktop'
	'com.apple.security.keychain-circle-notification'
	'com.apple.sharingd'
	'com.apple.SocialPushAgent'
	'com.apple.suggestd'
	'com.apple.syncdefaultsd'
	'com.apple.telephonyutilities.callservicesd'
	'com.apple.touristd'
)

for i in ./System/Library/LaunchAgents/*.bak; do
	mv -f $i "${i:0:-4}"
done
for AGENT in "${AGENTS[@]}"; do
	if test -f "./System/Library/LaunchAgents/${AGENT}.plist"; then
		mv -f "./System/Library/LaunchAgents/${AGENT}.plist" "./System/Library/LaunchAgents/${AGENT}.plist.bak"
		echo "👍 [DISABLED] System Library LaunchAgent -> '${AGENT}'"
	fi
done

# Daemons to disable
DAEMONS=(
	'com.apple.AirPlayXPCHelper'
	'com.apple.analyticsd'
	'com.apple.AOSNotificationOSX'
	'com.apple.appleseed.fbahelperd'
	'com.apple.apsd'
	'com.apple.aslmanager'
	'com.apple.awacsd'
	'com.apple.cmio.AppleCameraAssistant'
	'com.apple.coreduetd.osx'
	'com.apple.CrashReporterSupportHelper'
	'com.apple.diagnosticextensions.osx.spotlight.helper'
	'com.apple.eapolcfg_auth'
	'com.apple.emond.aslmanager'
	'com.apple.familycontrols'
	'com.apple.FileSyncAgent.sshd'
	'com.apple.findmymac'
	'com.apple.findmymacmessenger'
	'com.apple.GameController.gamecontrollerd'
	'com.apple.icloud.findmydeviced'
	'com.apple.iCloudStats'
	'com.apple.laterscheduler'
	'com.apple.locationd'
	'com.apple.ManagedClient'
	'com.apple.ManagedClient.cloudconfigurationd'
	'com.apple.ManagedClient.enroll'
	'com.apple.ManagedClient.startup'
	'com.apple.mbicloudsetupd'
	'com.apple.mediaremoted'
	'com.apple.metadata.mds'
	'com.apple.metadata.mds.index'
	'com.apple.metadata.mds.scan'
	'com.apple.metadata.mds.spindump'
	'com.apple.MRTd'
	'com.apple.osanalytics.osanalyticshelper'
	'com.apple.preferences.timezone.admintool'
	'com.apple.preferences.timezone.auto'
	'com.apple.rapportd'
	'com.apple.remotepairtool'
	'com.apple.ReportCrash.Root'
	'com.apple.rpmuxd'
	'com.apple.security.FDERecoveryAgent'
	'com.apple.spindump'
	'com.apple.SubmitDiagInfo'
	'com.apple.syslogd'
	'com.apple.systemstats.analysis'
	'ssh'
	'tftp'
)

# iCloud
DAEMONS+=(
	'com.apple.analyticsd'
)

# Others
DAEMONS+=(
	'com.apple.appleseed.fbahelperd'
	'com.apple.apsd'
	'com.apple.eapolcfg_auth'
	'com.apple.locate'
	'com.apple.locationd'
	'com.apple.ManagedClient'
	'com.apple.ManagedClient.cloudconfigurationd'
	'com.apple.ManagedClient.enroll'
	'com.apple.ManagedClient.startup'
	'com.apple.mediaremoted'
	'com.apple.netbiosd'
	'com.apple.preferences.timezone.admintool'
	'com.apple.RemoteDesktop.PrivilegeProxy'
	'com.apple.remotepairtool'
	'com.apple.screensharing'
	'com.apple.security.FDERecoveryAgent'
	'com.apple.SubmitDiagInfo'
	'org.cups.cupsd'
)

for i in ./System/Library/LaunchDaemons/*.bak; do
	mv -f $i "${i:0:-4}"
done
for DAEMON in "${DAEMONS[@]}"; do
	if test -f "./System/Library/LaunchDaemons/${DAEMON}.plist"; then
		mv -f "./System/Library/LaunchDaemons/${DAEMON}.plist" "./System/Library/LaunchDaemons/${DAEMON}.plist.bak"
		echo "👍 [DISABLED] System Library LaunchDaemon -> '${DAEMON}'"
	fi
done
