
RPC = require('./index')

class Mongoose extends RPC
  constructor: (options)->
    super options

  find: (conditions={})->
    return @method 'find', [conditions], {tailable: true}
  create: (doc)->
    return @method 'create', [doc]
  remove: (conditions={})->
    return @method 'remove', [conditions]


module.exports = Mongoose