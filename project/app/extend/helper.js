const { ERROR_ERR, ERROR_OK } = require('../constants')

module.exports = {
  
  sendSuccessJSON({ data, msg }){
    this.ctx.body = {
      data,
      msg,
      code: ERROR_OK
    }
  },

  sendErrorJSON(msg){
    this.ctx.body = {
      msg,
      code: ERROR_ERR
    }
  }

};
