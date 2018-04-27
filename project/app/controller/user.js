'use strict';

const { Controller } = require('egg');

class UserController extends Controller {


	/**
	 * 登录
	 */
	async login(){

	}

	/**
	 * 注册
	 */
	async register(){



		const ctx = this.ctx
	}

	/**
	 * 退出登录
	 */
	async loginOut(){

	}


	/**
	 * 获取用户信息
	 */
  async getUserInfo() {
    this.ctx.body = {
			"code": 200
		}
  }

	/**
	 * 获取用户是否存在
	 */
	async getUserIsExist(){
		const ctx = this.ctx
		try {
			const { username } = ctx.query
			const user = await ctx.service.user.findUsername(username)
			ctx.helper.sendSuccessJSON({
				data: user ? true : false,
				msg: '查询成功'
			})
		} catch (error) {
			ctx.helper.sendErrorJSON('查询失败')
		}
	}

}

module.exports = UserController;
