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
    borrow_date {3.days.ago}
    draw_date {2.days.ago}

    association :book, factory: :library_book
    association :user, factory: :user

    initialize_with { Library::Borrow.find_or_create_by(id: 1)}
  end
end
