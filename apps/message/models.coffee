mongoose = require("mongoose")

MessageSchema = new mongoose.Schema({
  content:
    type: String
    required: true
    unique: true
})

exports.Message = Message = mongoose.model("Message", MessageSchema)
