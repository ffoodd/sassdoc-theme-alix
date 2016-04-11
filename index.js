var def = require('./default-configuration.json');

var path          = require('path');
var nunjucks      = require('nunjucks');
var fsp           = require('fs-promise');
var sassdocExtras = require('sassdoc-extras');

var env = nunjucks.configure(path.resolve(__dirname, 'views'));


var renderFile = function renderFile(dest, ctx) {
  return new Promise(function (resolve, reject) {
    env.render(dest, ctx, function (err, res) {
      if (err) reject(err);
      else resolve(res);
    });
  });
};


var applyDefaults = function applyDefaults(ctx) {
  return Object.assign({}, def, ctx, {
    groups: Object.assign(def.groups, ctx.groups),
    display: Object.assign(def.display, ctx.display)
  });
};

module.exports = function (dest, ctx) {
  var ctx = applyDefaults(ctx);
  sassdocExtras(ctx, 'description', 'markdown', 'display', 'groupName', 'shortcutIcon', 'sort', 'resolveVariables');
  ctx.data.byGroupAndType = sassdocExtras.byGroupAndType(ctx.data);
  var initialAssetPath = path.resolve(__dirname, 'assets');
  var finalAssetPath   = path.resolve(dest, 'assets');
  var destination      = path.resolve(dest, 'index.html');
  return Promise.all([
    fsp.copy(initialAssetPath, finalAssetPath),
    renderFile('index.html', ctx)
      .then(function (html) {
        return fsp.writeFile(destination, html);
      })
      .catch(function (err) {
        console.log(err);
      })
      .then(function () {
        console.log('All good');
      })
  ]);
};