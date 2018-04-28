'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;

  const prefix = '/api'

  // 获取用户信息
  router.post(`${prefix}/login`, controller.user.login);
  router.post(`${prefix}/register`, controller.user.register);
  router.post(`${prefix}/login_out`, controller.user.loginOut);
  router.get(`${prefix}/user/is_exist`, controller.user.getUserIsExist);
  router.get(`${prefix}/user`, controller.user.getUserInfo);
};
