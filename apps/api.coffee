
# api
RPC = require('./rpc')

# # 1. simple api
# target = {
#   plus: (a, b, cb)->
#     return cb(null, a + b)
# }
# rpc = new RPC({io: io, target: target})
# rpc.init()

# 2. mongoose api
Message = require('./message/models').Message
message_rpc = new RPC({io: io, target: Message, name_space: 'message'})
message_rpc.init()
