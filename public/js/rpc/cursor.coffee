
oo = ko.observable
oa = ko.observableArray


_ = require('lodash')

class Cursor
  constructor: (options)->

    @rpc = options.rpc

    @method = options.method

    @args = options.args

    @options = options.options

    @err = oo(false)

    @val = oo(false)

    @vals = oa([])

  update: (args)->

    @args = args if args?

    @rpc.method @method, @args, @options, @

module.exports = Cursor