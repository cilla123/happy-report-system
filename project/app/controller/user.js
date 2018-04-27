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
		const { username } = ctx.query
		const user = await ctx.service.user.findUsername(username)
		ctx.body = user ? true : false
	}

}

module.exports = UserController;
