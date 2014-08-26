window.app = app = {}
oo = ko.observable
oa = ko.observableArray
co = ko.computed

mongoose = require('./rpc/mongoose')

window.Message = Message = new mongoose({
  io: io
  name_space: 'message'
})

class MessageVM
  constructor: ()->

    @content = oo('')

    @list = oo(Message.find({}))

  create: ()->
    Message.create {content: @content()}

  remove: (content)->
    Message.remove {content: content}

app.message = new MessageVM()

ko.applyBindings(app)
