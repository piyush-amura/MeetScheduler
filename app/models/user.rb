# Class User provides model for users table of
# this application
#
# @author Piyush Wani <piyush.wani@amuratech.com>
class User
  include Mongoid::Document
  include Mongoid::Timestamps

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  TYPES = %w[User::Employee User::Admin].freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  ## Database authenticatable
  field :email,              type: String, default: ''
  field :encrypted_password, type: String, default: ''
  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time
  ## Rememberable
  field :remember_created_at, type: Time
  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String
  # Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable
  field :_type,                 type: String
  field :name,                 type: String

  validates :email, length: { maximum: 100 },
                    format: EMAIL_REGEX

  validates :_type, presence: true,
                   inclusion: { in: TYPES,
                                message: '%<value>s restricted from use.' }
  # Validations for name
  validates :name, presence: true

  # many to many Association
  has_and_belongs_to_many :meetings

  # one to many Association (for rich join) and only suggestion is selected
  has_many :suggestions
  # , -> { select(:suggestion) }

  # method provides list of the meetings
  # organised by user
  # returns list of meetings objects
  def organised_meetings
    Meeting.where(organiser_id: id)
  end

# method provides list of all past meetings
# attended by user
# returns list of meetings objects
  def past_meetings(d = Date.today)
    self.meetings.where(date: {"$lte" => Date.today})
  end

  # # method provides list of all past meetings
  # # attended by user
  # # returns list of meetings objects
  def upcoming_meetings(d = Date.today)
    self.meetings.where(date: {"$gte" => Date.today})
  end
                  
end
# class User < ApplicationRecord
#   EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
#   TYPES = %w[User::Employee User::Admin].freeze
#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :trackable, :validatable, :confirmable

#   self.reconfirmable = false
#   # Validations for email using REGEX
#   validates :email, length: { maximum: 100 },
#                     format: EMAIL_REGEX

#   # Validations for type
#   validates :type, presence: true,
#                    inclusion: { in: TYPES,
#                                 message: '%<value>s restricted from use.' }
#   # Validations for name
#   validates :name, presence: true

#   # many to many Association
#   has_and_belongs_to_many :meetings

#   # one to many Association (for rich join) and only suggestion is selected
#   has_many :suggestions, -> { select(:suggestion) }

#   # method provides list of the meetings
#   # organised by user
#   # returns list of meetings objects
#   def organised_meetings
#     Meeting.where(organiser_id: id)
#   end

#   # method provides list of all past meetings
#   # attended by user
#   # returns list of meetings objects
#   def past_meetings(d = Date.today)
#     meetings.where(['date < ?', d])
#   end

#   # method provides list of all past meetings
#   # attended by user
#   # returns list of meetings objects
#   def upcoming_meetings(d = Date.today)
#     meetings.where(['date > ?', d])
#   end
# end
