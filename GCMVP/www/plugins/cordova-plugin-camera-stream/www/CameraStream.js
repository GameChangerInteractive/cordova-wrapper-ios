cordova.define("cordova-plugin-camera-stream.CameraStream", function(require, exports, module) {
var exec = require('cordova/exec');

// Camera: front or back
exports.startCapture = function (camera) {
    return execPromise('CameraStream', 'startCapture', [camera]);
};

exports.stopCapture = function () {
    return execPromise('CameraStream', 'stopCapture', []);
};

exports.capture = function(data){
    /**
     * Just a placeholder, iOS is going to call this
     * directly when the camera stream is ready.
     * 
     * Define this func in your app to use the data.
     * 
     * Example:
     * 
     * var imageData = document.getElementById('<imageId>')
     * 
     * cordova.plugins.CameraBase64.capture = function(data){
     *      image.src = imageData
     * }
     * //Starting the stream
     * cordova.plugins.CameraBase64.startCapture();
     */
};
               
function execPromise(service, method, args) {
    return new Promise(function(resolve, reject) {
                       exec(resolve, reject, service, method, args);
    });
}
});
