
# todo: middleware

class SocketRPC
  constructor: (options={})->

    @io = options.io

    @name_space = options.name_space || '__'

    @target = options.target

    @room_name = options.room_name || '__'

  update: ()->
    @channel.emit @room_name + '_update', {}

  init: ()->

    # namespace
    @channel = @io.of('/' +   @name_space)

    # start
    @channel.on 'connection', (socket)=>

      socket.on @room_name + '_apply', (req, ack_cb)=>

        req.method = req.method
        req.args = req.args || []
        tailable = req.options?.tailable
        res = {}

        # check
        return ack_cb(new Error('cant find method')) if not @target[req.method]?.apply? 

        # add callback
        cb = ()=>
          ack_cb.apply(@, arguments)

          @update() if not tailable

        req.args.push cb

        @target[req.method].apply(@target, req.args)

module.exports = SocketRPC
