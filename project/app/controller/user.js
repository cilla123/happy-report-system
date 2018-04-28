'use strict';

const { Controller } = require('egg');

/**
 * 用户
 */
class UserController extends Controller {


  /**
	 * 登录
	 */
  async login() {

  }

  /**
	 * 注册
	 */
  async register() {
    const ctx = this.ctx;
    try {
      const { password, password2, username } = ctx.request.body;
      const userService = ctx.service.user

      // 1.检查注册字段是否符合规则
      ctx.validate({
        username: { required: true, type: 'string', min: 6, max: 20 },
        password: { required: true, type: 'password', min: 6, max: 20 },
        password2: { required: true, type: 'password', min: 6, max: 20 }
      }, ctx.request.body);

      // 2.检查用户是否存在
      const user = await userService.findUsername(username);
      if (!user) {
        // 3.判断密码是否相同
        if (password2 === password) {
          const hashPassword = ctx.helper.createHashPassword(password)
          const result = userService.createUser({ username, password: hashPassword })
          console.log(result)
          ctx.helper.sendSuccessJSON({ data: true, msg: '注册成功' })
        }else {
          throw new Error('两次密码不相同')
        }
      }else {
        throw new Error('用户已经存在')
      }
    } catch (error) {
      ctx.helper.sendErrorJSON(new String(error));
    }
  }

  /**
	 * 退出登录
	 */
  async loginOut() {

  }


  /**
	 * 获取用户信息
	 */
  async getUserInfo() {
    this.ctx.body = {
      code: 200,
    };
  }

  /**
	 * 获取用户是否存在
	 */
  async getUserIsExist() {
    const ctx = this.ctx;
    try {
      const { username } = ctx.query;
      const user = await ctx.service.user.findUsername(username);
      ctx.helper.sendSuccessJSON({
        data: !!user,
        msg: '查询成功',
      });
    } catch (error) {
      ctx.helper.sendErrorJSON('查询失败');
    }
  }

}

module.exports = UserController;
