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

FactoryBot.define do
  factory :library_borrow, class: 'Library::Borrow' do
    book_id 1
    user_id 1
    borrow_date "2018-07-31 18:31:13"
    draw_date "2018-07-31 18:31:13"
  end
end
