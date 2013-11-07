var flatiron = require('flatiron'),
    path = require('path'),
    app = flatiron.app;

app.config.file({ file: path.join(__dirname, 'config', 'config.json') });

app.use(flatiron.plugins.http);

app.resources = require('./models');

console.log(app.resources);

app.use(require('restful'));

app.router.get('/', function () {
  this.res.json({ 'hello': 'world' })
});

app.start(3000);
