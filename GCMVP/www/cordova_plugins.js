cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
  {
    "id": "cordova-plugin-file.DirectoryEntry",
    "file": "plugins/cordova-plugin-file/www/DirectoryEntry.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.DirectoryEntry"
    ]
  },
  {
    "id": "cordova-plugin-file.DirectoryReader",
    "file": "plugins/cordova-plugin-file/www/DirectoryReader.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.DirectoryReader"
    ]
  },
  {
    "id": "cordova-plugin-file.Entry",
    "file": "plugins/cordova-plugin-file/www/Entry.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.Entry"
    ]
  },
  {
    "id": "cordova-plugin-file.File",
    "file": "plugins/cordova-plugin-file/www/File.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.File"
    ]
  },
  {
    "id": "cordova-plugin-file.FileEntry",
    "file": "plugins/cordova-plugin-file/www/FileEntry.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.FileEntry"
    ]
  },
  {
    "id": "cordova-plugin-file.FileError",
    "file": "plugins/cordova-plugin-file/www/FileError.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.FileError"
    ]
  },
  {
    "id": "cordova-plugin-file.FileReader",
    "file": "plugins/cordova-plugin-file/www/FileReader.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.FileReader"
    ]
  },
  {
    "id": "cordova-plugin-file.FileSystem",
    "file": "plugins/cordova-plugin-file/www/FileSystem.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.FileSystem"
    ]
  },
  {
    "id": "cordova-plugin-file.FileUploadOptions",
    "file": "plugins/cordova-plugin-file/www/FileUploadOptions.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.FileUploadOptions"
    ]
  },
  {
    "id": "cordova-plugin-file.FileUploadResult",
    "file": "plugins/cordova-plugin-file/www/FileUploadResult.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.FileUploadResult"
    ]
  },
  {
    "id": "cordova-plugin-file.FileWriter",
    "file": "plugins/cordova-plugin-file/www/FileWriter.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.FileWriter"
    ]
  },
  {
    "id": "cordova-plugin-file.Flags",
    "file": "plugins/cordova-plugin-file/www/Flags.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.Flags"
    ]
  },
  {
    "id": "cordova-plugin-file.LocalFileSystem",
    "file": "plugins/cordova-plugin-file/www/LocalFileSystem.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.LocalFileSystem"
    ],
    "merges": [
      "window"
    ]
  },
  {
    "id": "cordova-plugin-file.Metadata",
    "file": "plugins/cordova-plugin-file/www/Metadata.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.Metadata"
    ]
  },
  {
    "id": "cordova-plugin-file.ProgressEvent",
    "file": "plugins/cordova-plugin-file/www/ProgressEvent.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.ProgressEvent"
    ]
  },
  {
    "id": "cordova-plugin-file.fileSystems",
    "file": "plugins/cordova-plugin-file/www/fileSystems.js",
    "pluginId": "cordova-plugin-file"
  },
  {
    "id": "cordova-plugin-file.requestFileSystem",
    "file": "plugins/cordova-plugin-file/www/requestFileSystem.js",
    "pluginId": "cordova-plugin-file",
    "clobbers": [
      "window.requestFileSystem"
    ]
  },
  {
    "id": "cordova-plugin-file.resolveLocalFileSystemURI",
    "file": "plugins/cordova-plugin-file/www/resolveLocalFileSystemURI.js",
    "pluginId": "cordova-plugin-file",
    "merges": [
      "window"
    ]
  },
  {
    "id": "cordova-plugin-file.isChrome",
    "file": "plugins/cordova-plugin-file/www/browser/isChrome.js",
    "pluginId": "cordova-plugin-file",
    "runs": true
  },
  {
    "id": "cordova-plugin-file.iosFileSystem",
    "file": "plugins/cordova-plugin-file/www/ios/FileSystem.js",
    "pluginId": "cordova-plugin-file",
    "merges": [
      "FileSystem"
    ]
  },
  {
    "id": "cordova-plugin-file.fileSystems-roots",
    "file": "plugins/cordova-plugin-file/www/fileSystems-roots.js",
    "pluginId": "cordova-plugin-file",
    "runs": true
  },
  {
    "id": "cordova-plugin-file.fileSystemPaths",
    "file": "plugins/cordova-plugin-file/www/fileSystemPaths.js",
    "pluginId": "cordova-plugin-file",
    "merges": [
      "cordova"
    ],
    "runs": true
  },
  {
    "id": "cordova-plugin-media-capture.CaptureAudioOptions",
    "file": "plugins/cordova-plugin-media-capture/www/CaptureAudioOptions.js",
    "pluginId": "cordova-plugin-media-capture",
    "clobbers": [
      "CaptureAudioOptions"
    ]
  },
  {
    "id": "cordova-plugin-media-capture.CaptureImageOptions",
    "file": "plugins/cordova-plugin-media-capture/www/CaptureImageOptions.js",
    "pluginId": "cordova-plugin-media-capture",
    "clobbers": [
      "CaptureImageOptions"
    ]
  },
  {
    "id": "cordova-plugin-media-capture.CaptureVideoOptions",
    "file": "plugins/cordova-plugin-media-capture/www/CaptureVideoOptions.js",
    "pluginId": "cordova-plugin-media-capture",
    "clobbers": [
      "CaptureVideoOptions"
    ]
  },
  {
    "id": "cordova-plugin-media-capture.CaptureError",
    "file": "plugins/cordova-plugin-media-capture/www/CaptureError.js",
    "pluginId": "cordova-plugin-media-capture",
    "clobbers": [
      "CaptureError"
    ]
  },
  {
    "id": "cordova-plugin-media-capture.MediaFileData",
    "file": "plugins/cordova-plugin-media-capture/www/MediaFileData.js",
    "pluginId": "cordova-plugin-media-capture",
    "clobbers": [
      "MediaFileData"
    ]
  },
  {
    "id": "cordova-plugin-media-capture.MediaFile",
    "file": "plugins/cordova-plugin-media-capture/www/MediaFile.js",
    "pluginId": "cordova-plugin-media-capture",
    "clobbers": [
      "MediaFile"
    ]
  },
  {
    "id": "cordova-plugin-media-capture.helpers",
    "file": "plugins/cordova-plugin-media-capture/www/helpers.js",
    "pluginId": "cordova-plugin-media-capture",
    "runs": true
  },
  {
    "id": "cordova-plugin-media-capture.capture",
    "file": "plugins/cordova-plugin-media-capture/www/capture.js",
    "pluginId": "cordova-plugin-media-capture",
    "clobbers": [
      "navigator.device.capture"
    ]
  },
  {
    "id": "es6-promise-plugin.Promise",
    "file": "plugins/es6-promise-plugin/www/promise.js",
    "pluginId": "es6-promise-plugin",
    "runs": true
  },
  {
    "id": "cordova-plugin-x-socialsharing.SocialSharing",
    "file": "plugins/cordova-plugin-x-socialsharing/www/SocialSharing.js",
    "pluginId": "cordova-plugin-x-socialsharing",
    "clobbers": [
      "window.plugins.socialsharing"
    ]
  },
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
    "id": "cordova-plugin-camera-stream.CameraStream",
    "file": "plugins/cordova-plugin-camera-stream/www/CameraStream.js",
    "pluginId": "cordova-plugin-camera-stream",
    "clobbers": [
            "cordova.plugins.CameraStream"
    ]
  }
];
module.exports.metadata = 
// TOP OF METADATA
{
  "cordova-plugin-whitelist": "1.3.2",
  "cordova-plugin-file": "6.0.1",
  "cordova-plugin-media-capture": "3.0.2",
  "es6-promise-plugin": "4.2.2",
  "cordova-plugin-x-socialsharing": "5.4.1",
  "cordova-plugin-compat": "1.2.0",
  "cordova-plugin-audioinput": "0.3.0",
  "cordova-plugin-flashlight": "3.2.0",
  "cordova-plugin-vibration": "2.1.5",
  "cordova-plugin-dialogs": "1.3.3",
  "cordova-plugin-inappbrowser": "1.7.1",
  "cordova-plugin-insomnia": "4.3.0"
};
// BOTTOM OF METADATA
});
