// Namespaced Header

#ifndef __NS_SYMBOL
// We need to have multiple levels of macros here so that __NAMESPACE_PREFIX_ is
// properly replaced by the time we concatenate the namespace prefix.
#define __NS_REWRITE(ns, symbol) ns ## _ ## symbol
#define __NS_BRIDGE(ns, symbol) __NS_REWRITE(ns, symbol)
#define __NS_SYMBOL(symbol) __NS_BRIDGE(SIGMAPOINT, symbol)
#endif


// Classes
// Functions
// Externs

#ifndef CDVDebug
#define CDVDebug Gcmvp_CDVDebug
#endif

#ifndef CDVJSON_private
#define CDVJSON_private Gcmvp_CDVJSON_private
#endif

#ifndef CDV
#define CDV Gcmvp_CDV
#endif

#ifndef CDVAvailability
#define CDVAvailability Gcmvp_CDVAvailability
#endif

#ifndef CDVAvailabilityDeprecated
#define CDVAvailabilityDeprecated Gcmvp_CDVAvailabilityDeprecated
#endif

#ifndef CDVCommandDelegate
#define CDVCommandDelegate Gcmvp_CDVCommandDelegate
#endif

#ifndef CDVConfigParser
#define CDVConfigParser Gcmvp_CDVConfigParser
#endif

#ifndef CDVInvokedUrlCommand
#define CDVInvokedUrlCommand Gcmvp_CDVInvokedUrlCommand
#endif

#ifndef CDVPlugin
#define CDVPlugin Gcmvp_CDVPlugin
#endif

#ifndef CDVPluginResult
#define CDVPluginResult Gcmvp_CDVPluginResult
#endif

#ifndef CDVScreenOrientationDelegate
#define CDVScreenOrientationDelegate Gcmvp_CDVScreenOrientationDelegate
#endif

#ifndef CDVTimer
#define CDVTimer Gcmvp_CDVTimer
#endif

#ifndef CDVURLProtocol
#define CDVURLProtocol Gcmvp_CDVURLProtocol
#endif

#ifndef CDVUserAgentUtil
#define CDVUserAgentUtil Gcmvp_CDVUserAgentUtil
#endif

#ifndef CDVWebViewEngineProtocol
#define CDVWebViewEngineProtocol Gcmvp_CDVWebViewEngineProtocol
#endif

#ifndef CDVWhitelist
#define CDVWhitelist Gcmvp_CDVWhitelist
#endif

#ifndef CDVWhitelist
#define CDVWhitelist Gcmvp_CDVWhitelist
#endif

#ifndef CDVRemoteInjectionPlugin
#define CDVRemoteInjectionPlugin Gcmvp_CDVRemoteInjectionPlugin
#endif

#ifndef CDVRemoteInjectionUIWebViewDelegate
#define CDVRemoteInjectionUIWebViewDelegate Gcmvp_CDVRemoteInjectionUIWebViewDelegate
#endif

#ifndef CDVRemoteInjectionWebViewBaseDelegate
#define CDVRemoteInjectionWebViewBaseDelegate Gcmvp_CDVRemoteInjectionWebViewBaseDelegate
#endif

#ifndef CDVRemoteInjectionWKWebViewDelegate
#define CDVRemoteInjectionWKWebViewDelegate Gcmvp_CDVRemoteInjectionWKWebViewDelegate
#endif

#ifndef CDVGestureHandler
#define CDVGestureHandler Gcmvp_CDVGestureHandler
#endif

#ifndef CDVHandleOpenURL
#define CDVHandleOpenURL Gcmvp_CDVHandleOpenURL
#endif

#ifndef CDVIntentAndNavigationFilter
#define CDVIntentAndNavigationFilter Gcmvp_CDVIntentAndNavigationFilter
#endif

#ifndef CDVLocalStorage
#define CDVLocalStorage Gcmvp_CDVLocalStorage
#endif

#ifndef CDVUIWebViewDelegate
#define CDVUIWebViewDelegate Gcmvp_CDVUIWebViewDelegate
#endif

#ifndef CDVUIWebViewEngine
#define CDVUIWebViewEngine Gcmvp_CDVUIWebViewEngine
#endif

#ifndef CDVUIWebViewNavigationDelegate
#define CDVUIWebViewNavigationDelegate Gcmvp_CDVUIWebViewNavigationDelegate
#endif

#ifndef CDVAudioInputCapture
#define CDVAudioInputCapture Gcmvp_CDVAudioInputCapture
#endif

#ifndef AudioReceiver
#define AudioReceiver Gcmvp_AudioReceiver
#endif

#ifndef Flashlight
#define Flashlight Gcmvp_Flashlight
#endif

#ifndef Insomnia
#define Insomnia Gcmvp_Insomnia
#endif

#ifndef CDVVibration
#define CDVVibration Gcmvp_CDVVibration
#endif

#ifndef CDVNotification
#define CDVNotification Gcmvp_CDVNotification
#endif

#ifndef CDVAlertView
#define CDVAlertView Gcmvp_CDVAlertView
#endif

#ifndef CDVInAppBrowser
#define CDVInAppBrowser Gcmvp_CDVInAppBrowser
#endif




