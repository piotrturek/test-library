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

require 'rails_helper'

RSpec.describe Library::Borrow, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
