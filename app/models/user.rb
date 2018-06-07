class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # # from      
  # has_many :to_messages, class_name: "Message", foreign_key: "to_id", dependent: :destroy
  # has_many :recived_messages, through: :to_messages, source: :to
  # # to
  # has_many :from_messages, class_name: "Message", foreign_key: "from_id", dependent: :destroy
  # has_many :sent_messages, through: :from_messages, source: :from

  #from
  has_many :active_msgs, foreign_key: "from_id", class_name: "Message"
  has_many :received_users, through: :active_msgs, source: :to
  #to
  has_many :passive_msgs, foreign_key: "to_id", class_name: "Message"
  has_many :sent_users, through: :passive_msgs, source: :from
  
  validates :name, presence: true

  def send_message(other_user, room_id, content)
    self.active_msgs.create!(to_id: other_user.id, room_id: room_id, content: content)
  end
end
