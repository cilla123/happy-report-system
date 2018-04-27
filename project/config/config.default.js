'use strict';

module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1524117942585_5284';

  // add your config here
  config.middleware = [];

  config.onerror = {
    all(err, ctx) {
      ctx.body = 'error';
      ctx.status = 500;
    },
    html(err, ctx) {
      // html hander
      ctx.body = '<h3>error</h3>';
      ctx.status = 500;
    },
    json(err, ctx) {
      // json hander
      ctx.body = { message: 'error' };
      ctx.status = 500;
    }
  }

  return config;
};
