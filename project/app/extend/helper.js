const { ERROR_ERR, ERROR_OK } = require('../constants');
const crypto = require("crypto");
const md5 = require('md5')

module.exports = {

  /**
   * 发送JSON
   */
  sendJSON(code, data, msg) {
    this.ctx.body = { code, data, msg };
  },

  /**
   * 发送成功的JSON
   */
  sendSuccessJSON({ data, msg }) {
    this.ctx.body = { data, msg, code: ERROR_OK };
  },

  /**
   * 发送失败的JSON
   */
  sendErrorJSON(msg) {
    this.ctx.body = { msg, code: ERROR_ERR };
  },

  /**
   * 创建加密的密码
   */
  createHashPassword(password) {
    const sha256 = crypto.createHash("sha256");
    return sha256.update(password).digest("hex");
  },

  /**
   * 判断密码是否相同
   */
  comparePassword(password, password2) {
    password = this.createHashPassword(password)
    return password === password2
  },

  /**
   * 获取当前时间
   */
  getCurrentTime(){
    return new Date().getTime()
  },

  /**
   * 加密算法
   */
  signwx(json) {
    var wxkey = 'ZANEWANGWEI123456AGETEAMABmiliH';
    var arr = [];
    var sortJson = {};
    var newJson = json;
    for (var key in json) {
      if (json[key]) {
        arr.push(key);
      }
    }
    arr.sort(function (a, b) {
      return a.localeCompare(b);
    });
    for (var i = 0, len = arr.length; i < len; i++) {
      sortJson[arr[i]] = json[arr[i]]
    }
    var str = "";
    for (var key in sortJson) {
      str += key + "=" + sortJson[key] + '&';
    }
    str += 'key=' + wxkey;
    var md5Str = md5(str);
    var signstr = md5Str.toUpperCase();
    newJson['paySign'] = signstr;
    return newJson;
  },

  /**
   * 生成随机字符串
   */
  randomString(len) {
    len = len || 32;
    const chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
    const maxPos = chars.length;
    let pwd = '';
    for (let i = 0; i < len; i++) {
      pwd += chars.charAt(Math.floor(Math.random() * maxPos));
    }
    return pwd;
  },

  /**
   * 创建Token
   */
  createUserToken(username, password, timestamp){
    return this.signwx({
      username,
      password,
      timestamp,
      random: this.randomString()
    }).paySign;
  }

};
