# == Schema Information
#
# Table name: library_books
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  author_id  :integer
#  lead       :text(65535)
#  is_active  :boolean
#  aasm_state :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Library::Book < ApplicationRecord
  include AASM

  validates :name, :lead, :author, presence: true

  belongs_to :author, class_name: "User"
  has_many :boorows, class_name: '::Library::Borrow'

  default_scope { order(created_at: :desc) }

  aasm do
    state :available, :initial => true
    state :borrowed, :before_enter => :resuply_stock

    event :borrow do
      transitions :from => :available, :to => :borrowed
    end

    event :return do
      transitions :from => :borrowed, :to => :available
    end

  end

end
