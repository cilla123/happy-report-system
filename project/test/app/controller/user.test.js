const { app, mock, assert } = require('egg-mock/bootstrap');

/**
 * UserController测试
 */
describe('test/app/controller/user.test.js', () => {

  /**
   * 查询用户是否存在
   */
  describe('Get /user/is_exist', () => {
    it('用户存在', async () => {
      const result = await app.httpRequest()
        .get('/user/is_exist?username=cilla123')
        .expect(200)
      console.log(result.body)
    })
  })

  /**
   * 用户注册
   */
  describe.only('Post /register', () => {
    it('用户已经存在，密码不相同', async () => {
      app.mockCsrf()     
      const result = await app.httpRequest()
        .post('/register')
        .send({
          username: 'cilla123',
          password: 'z1234567892',
          password2: 'z123456789',          
        })
        .expect(200)
      console.log(result.body)
    })

    it('用户已经存在，密码相同', async () => {
      app.mockCsrf()
      const result = await app.httpRequest()
        .post('/register')
        .send({
          username: 'cilla123',
          password: 'z123456789',
          password2: 'z123456789',
        })
        .expect(200)
      console.log(result.body)
    })

    it('用户不存在，密码不相同', async () => {
      app.mockCsrf()
      const result = await app.httpRequest()
        .post('/register')
        .send({
          username: 'cilla1234',
          password: 'z1234567892',
          password2: 'z123456789',
        })
        .expect(200)
      console.log(result.body)
    })

    it.only('用户不存在，密码相同', async () => {
      app.mockCsrf()
      const result = await app.httpRequest()
        .post('/register')
        .send({
          username: 'cilla1234',
          password: 'z123456789',
          password2: 'z123456789',
        })
        .expect(200)
      console.log(result.body)
    })
  })
  
  /**
   * 获取用户信息
   */
  describe('GET /user/:id', () => {
    it('查询用户信息', async () => {
      const result = await app.httpRequest()
        .get('/user/1')
        .expect(200)
      console.log(result.body)
    })
  })


})

