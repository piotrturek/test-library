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

  default_scope { order(created_at: :desc) }

end
