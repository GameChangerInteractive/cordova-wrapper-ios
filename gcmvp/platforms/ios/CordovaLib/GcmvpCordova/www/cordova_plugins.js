cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
    {
        "id": "cordova-plugin-audioinput.AudioInput",
        "file": "plugins/cordova-plugin-audioinput/www/audioInputCapture.js",
        "pluginId": "cordova-plugin-audioinput",
        "clobbers": [
            "audioinput"
        ]
    },
    {
        "id": "cordova-plugin-flashlight.Flashlight",
        "file": "plugins/cordova-plugin-flashlight/www/Flashlight.js",
        "pluginId": "cordova-plugin-flashlight",
        "clobbers": [
            "window.plugins.flashlight"
        ]
    },
    {
        "id": "cordova-plugin-insomnia.Insomnia",
        "file": "plugins/cordova-plugin-insomnia/www/Insomnia.js",
        "pluginId": "cordova-plugin-insomnia",
        "clobbers": [
            "window.plugins.insomnia"
        ]
    },
    {
        "id": "cordova-plugin-vibration.notification",
        "file": "plugins/cordova-plugin-vibration/www/vibration.js",
        "pluginId": "cordova-plugin-vibration",
        "merges": [
            "navigator.notification",
            "navigator"
        ]
    },
    {
        "id": "cordova-plugin-dialogs.notification",
        "file": "plugins/cordova-plugin-dialogs/www/notification.js",
        "pluginId": "cordova-plugin-dialogs",
        "merges": [
            "navigator.notification"
        ]
    },
    {
        "id": "cordova-plugin-inappbrowser.inappbrowser",
        "file": "plugins/cordova-plugin-inappbrowser/www/inappbrowser.js",
        "pluginId": "cordova-plugin-inappbrowser",
        "clobbers": [
            "cordova.InAppBrowser.open",
            "window.open"
        ]
    }
];
module.exports.metadata = 
// TOP OF METADATA
{
    "cordova-plugin-whitelist": "1.3.2",
    "cordova-plugin-compat": "1.2.0",
    "cordova-plugin-audioinput": "0.3.0",
    "cordova-plugin-flashlight": "3.2.0",
    "cordova-plugin-insomnia": "4.3.0",
    "cordova-plugin-vibration": "2.1.5",
    "cordova-plugin-dialogs": "1.3.3",
    "cordova-plugin-inappbrowser": "1.7.1",
    "cordova-plugin-ios-camera-permissions": "1.2.0",
    "cordova-plugin-remote-injection": "0.5.2",
    "cordova-plugin-ios-microphone-permissions": "1.0.0"
};
// BOTTOM OF METADATA
});