'use strice';

const { Service } = require('egg');

const USER_TABLE = 'system_user'

class UserService extends Service {

    /**
     * 查找用户
     */
    async findUsername(username){
        const mysql = this.app.mysql;
        const user = await mysql.get(USER_TABLE, {  });
        console.log(user)
        return { user };
    }

}

module.exports = UserService