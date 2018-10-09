cordova.define("cordova-plugin-close.Close", function(require, exports, module) {
var exec = require('cordova/exec');

exports.close = function () {
    return execPromise('Close', 'close', []);
};
               
function execPromise(service, method, args) {
    return new Promise(function(resolve, reject) {
        exec(resolve, reject, service, method, args);
    });
}
});
