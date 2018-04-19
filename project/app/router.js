'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.home.index);


  // 获取用户信息
  router.post('/login', controller.user.login);
  router.post('/register', controller.user.register);
  router.post('/login_out', controller.user.loginOut);  
  router.get('/user/is_exist', controller.user.getUserIsExist);
  router.get('/user/:id', controller.user.getUserInfo);
};
