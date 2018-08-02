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

FactoryBot.define do
  factory :user do
    name 'Testowy User'
    email 'test@garwo.pl'
    password 'password'

    initialize_with { User.find_or_create_by(id: 1)}

    after :create do |user, evaluator|
      create_list(:library_book, 3, author: user)
    end

  end
end
