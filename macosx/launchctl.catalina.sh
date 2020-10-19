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
	# 'com.apple.MRTa'
	# 'com.apple.printtool.agent'
	'com.apple.accessibility.AXVisualSupportAgent'
	'com.apple.accessibility.dfrhud'
	'com.apple.accessibility.heard'
	'com.apple.AddressBook.abd'
	'com.apple.AddressBook.ContactsAccountsService'
	'com.apple.AddressBook.SourceSync'
	'com.apple.AirPlayUIAgent'
	'com.apple.AirPortBaseStationAgent'
	'com.apple.amp.mediasharingd'
	'com.apple.AMPDeviceDiscoveryAgent'
	'com.apple.AOSHeartbeat'
	'com.apple.AOSPushRelay'
	'com.apple.ap.adprivacyd'
	'com.apple.ap.adservicesd'
	'com.apple.appleseed.seedusaged'
	'com.apple.appleseed.seedusaged.postinstall'
	'com.apple.assistant_service'
	'com.apple.assistantd'
	'com.apple.atsd.useragent'
	'com.apple.avconferenced'
	'com.apple.CalendarAgent'
	'com.apple.CallHistoryPluginHelper'
	'com.apple.CallHistorySyncHelper'
	'com.apple.cloudd'
	'com.apple.cloudfamilyrestrictionsd-mac'
	'com.apple.cloudpaird'
	'com.apple.cloudphotod'
	'com.apple.cloudphotosd'
	'com.apple.CommCenter-osx'
	'com.apple.coreparsec.silhouette'
	'com.apple.coreservices.sharedfilelistd'
	'com.apple.corespotlightd'
	'com.apple.corespotlightservice'
	'com.apple.DiagnosticReportCleanup'
	'com.apple.DictationIM'
	'com.apple.exchange.exchangesyncd'
	'com.apple.familycircled'
	'com.apple.familycontrols.useragent'
	'com.apple.familynotificationd'
	'com.apple.findmymacmessenger'
	'com.apple.followupd'
	'com.apple.gamed'
	'com.apple.geodMachServiceBridge'
	'com.apple.helpd'
	'com.apple.homed'
	'com.apple.icdd'
	'com.apple.icloud.findmydeviced.findmydevice-user-agent'
	'com.apple.icloud.fmfd'
	'com.apple.icloud.searchpartyuseragent'
	'com.apple.iCloudUserNotifications'
	'com.apple.identityservicesd'
	'com.apple.imagent'
	'com.apple.imautomatichistorydeletionagent'
	'com.apple.imklaunchagent'
	'com.apple.IMLoggingAgent'
	'com.apple.imtransferagent'
	'com.apple.java.InstallOnDemand'
	'com.apple.KeyboardAccessAgent'
	'com.apple.keyboardservicesd'
	'com.apple.knowledge-agent'
	'com.apple.macos.studentd'
	'com.apple.Maps.mapspushd'
	'com.apple.Maps.pushdaemon'
	'com.apple.mediaanalysisd'
	'com.apple.mediaremoteagent'
	'com.apple.mobileassetd'
	'com.apple.NowPlayingTouchUI'
	'com.apple.parentalcontrols.check'
	'com.apple.parsec-fbf'
	'com.apple.parsecd'
	'com.apple.passd'
	'com.apple.personad'
	'com.apple.photoanalysisd'
	'com.apple.photolibraryd'
	'com.apple.protectedcloudstorage.protectedcloudkeysyncing'
	'com.apple.quicklook'
	'com.apple.quicklook.ThumbnailsAgent'
	'com.apple.quicklook.ui.helper'
	'com.apple.rapportd-user'
	'com.apple.rcd'
	'com.apple.remindd'
	'com.apple.RemoteDesktop'
	'com.apple.ReportCrash'
	'com.apple.ReportCrash.Self'
	'com.apple.ReportGPURestart'
	'com.apple.ReportPanic'
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
	'com.apple.sidecar-hid-relay'
	'com.apple.sidecar-relay'
	'com.apple.Siri.agent'
	'com.apple.siriknowledged'
	'com.apple.soagent'
	'com.apple.SocialPushAgent'
	'com.apple.spindump_agent'
	'com.apple.Spotlight'
	'com.apple.SSInvitationAgent'
	'com.apple.suggestd'
	'com.apple.syncdefaultsd'
	'com.apple.telephonyutilities.callservicesd'
	'com.apple.touristd'
	'com.apple.TrustEvaluationAgent'
	'com.apple.UsageTrackingAgent'
	'com.apple.videosubscriptionsd'
	'com.apple.voicememod'
	'com.apple.VoiceOver'
	'com.apple.WebKit.PluginAgent'
)

# for AGENT in "${AGENTS[@]}"; do
# 	if [[ -e "/System/Library/LaunchAgents/$AGENT.plist" ]]; then
# 		launchctl unload -w "/System/Library/LaunchAgents/$AGENT.plist"
# 	fi
# done

for i in ./System/Library/LaunchAgents/*.bak; do
	if test -e "$i"; then
		mv -f "$i" "${i:0:-4}"
	fi
done
for AGENT in "${AGENTS[@]}"; do
	if test -e "./System/Library/LaunchAgents/${AGENT}.plist"; then
		mv -f "./System/Library/LaunchAgents/${AGENT}.plist" "./System/Library/LaunchAgents/${AGENT}.plist.bak"
		echo "👍 [DISABLED] System Library LaunchAgent -> '${AGENT}'"
	fi
done

DAEMONS=(
	# 'com.apple.backupd'
	# 'com.apple.backupd-helper'
	# 'com.apple.MRTd'
	# 'org.cups.cupsd'
	'com.apple.AirPlayXPCHelper'
	'com.apple.analyticsd'
	'com.apple.AOSNotificationOSX'
	'com.apple.appleseed.fbahelperd'
	'com.apple.apsd'
	'com.apple.aslmanager'
	'com.apple.awacsd'
	'com.apple.cmio.AppleCameraAssistant'
	'com.apple.coreduetd.osx'
	'com.apple.coreservices.sharedfilelistd'
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
	'com.apple.locate'
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
	'com.apple.netbiosd'
	'com.apple.osanalytics.osanalyticshelper'
	'com.apple.preferences.timezone.admintool'
	'com.apple.preferences.timezone.auto'
	'com.apple.rapportd'
	'com.apple.RemoteDesktop.PrivilegeProxy'
	'com.apple.remotepairtool'
	'com.apple.ReportCrash.Root'
	'com.apple.rpmuxd'
	'com.apple.screensharing'
	'com.apple.security.FDERecoveryAgent'
	'com.apple.spindump'
	'com.apple.SubmitDiagInfo'
	'com.apple.syslogd'
	'com.apple.systemstats.analysis'
	'ssh'
	'tftp'
)

# for DAEMON in "${DAEMONS[@]}"; do
# 	if [[ -e "/System/Library/LaunchDaemons/$DAEMON.plist" ]]; then
# 		sudo launchctl unload -w "/System/Library/LaunchDaemons/$DAEMON.plist"
# 	fi
# done

for i in ./System/Library/LaunchDaemons/*.bak; do
	if test -e "$i"; then
		mv -f "$i" "${i:0:-4}"
	fi
done
for DAEMON in "${DAEMONS[@]}"; do
	if test -e "./System/Library/LaunchDaemons/${DAEMON}.plist"; then
		mv -f "./System/Library/LaunchDaemons/${DAEMON}.plist" "./System/Library/LaunchDaemons/${DAEMON}.plist.bak"
		echo "👍 [DISABLED] System Library LaunchDaemon -> '${DAEMON}'"
	fi
done
