# == Schema Information
#
# Table name: library_borrows
#
#  id          :integer          not null, primary key
#  book_id     :integer
#  user_id     :integer
#  borrow_date :datetime
#  draw_date   :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Library::Borrow < ApplicationRecord



  belongs_to :user
  belongs_to :book, class_name: "::Library::Book"

  default_scope { order(created_at: :desc) }

  scope :not_returned, -> {where('draw_date IS NULL')}

  def can_be_returned?
    return self.draw_date.blank? ? true : false
  end

end
