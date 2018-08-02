# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#

class User < ApplicationRecord

  validates :email, :name, presence: true

  devise :database_authenticatable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :books, class_name: '::Library::Book', foreign_key: 'author_id'
  has_many :boorows, class_name: '::Library::Borrow'

  def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first

      unless user
          user = User.create(name: data['name'],
             email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user
  end

  def to_s
    name
  end

end
