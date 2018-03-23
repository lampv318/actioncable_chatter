class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
  end

  def unsubscribed
  end

  def send_message data
    message = current_user.messages.build body: data["message"], chat_room_id: data["chat_room_id"]
    if message.save
      ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel", message: message.body
    end
  end
end
