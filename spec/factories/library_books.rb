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

FactoryBot.define do
  factory :library_book, class: 'Library::Book' do
    name "Book title"
    lead "Book lead"
    is_active true
    aasm_state "available"

    association :author, factory: :user

    trait :borrowed do
      aasm_state "borrowed"
      after :create do |book, evaluator|
        create(:library_borrow, book: book, user_id: 1, draw_date: nil)
      end
    end

  end

end
