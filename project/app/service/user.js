'use strice';

const { Service } = require('egg');

const USER_TABLE = 'system_user';

/**
 * 用户
 */
class UserService extends Service {

  /**
   * 查找用户
   */
  async findUser(data) {
    const { username, id } = data
    const mysql = this.app.mysql;
    let user = ''
    if (username) {
      user = await mysql.get(USER_TABLE, { username });      
    }else {
      user = await mysql.get(USER_TABLE, { id: id });
    }
    return user;
  }

  /**
   * 创建用户
   */
  async createUser(data){
    const mysql = this.app.mysql;
    const { username, password, token } = data;
    const ctx = this.ctx;
    const nowTime = ctx.helper.getCurrentTime();
    const user = await mysql.insert(USER_TABLE, { 
      username, 
      password,
      token: ctx.helper.createUserToken(username, password, nowTime),
      create_time: nowTime,
      update_time: nowTime, 
    });
    return user;
  }

}

module.exports = UserService;
