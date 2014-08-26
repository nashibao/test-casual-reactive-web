
Cursor = require('./cursor')

_ = require('lodash')

class RPC
  constructor: (options)->

    @io = options.io

    @name_space = options.name_space || '__'

    @target = options.target

    @room_name = options.room_name || '__'

    @socket = @io.connect '/' + @name_space

    @_tailer = []

    @socket.on @room_name + '_update', (data)=>
      @_tailer.map (cursor)->
        cursor.update()

  tail: (cb)->
    @_tailer.push(cb)

  method: (method, args, options, cursor)->

    if not cursor?
      cursor = new Cursor({
        rpc: @
        method: method
        args: args
        options: options
      })

      if options?.tailable
        @_tailer.push(cursor)

    ack_cb = ()->
      return if arguments.length == 0
      err = arguments[0]
      return if arguments.length == 1
      val = arguments[1]
      if _.isArray(val)
        cursor.vals(val)
      else
        cursor.val(val)

    req = {
      method: method
      args: args
      options: options
    }
    @socket.emit @room_name + '_apply', req, ack_cb

    return cursor


module.exports = RPC