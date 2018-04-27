module.exports = app => {
    app.beforeStart(async () => {
        app.database = app.mysql.createInstance(app.config.mysql.client);
    });
};