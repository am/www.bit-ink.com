module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-nested'),
    require('postcss-gridlover'),
    require('postcss-normalize'),
    require('postcss-preset-env')({stage: 0}),
    require('lost')
 ]
}
