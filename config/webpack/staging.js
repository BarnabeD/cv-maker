process.env.NODE_ENV = process.env.NODE_ENV || 'staging'

const environment = require('./staging')

module.exports = environment.toWebpackConfig()
