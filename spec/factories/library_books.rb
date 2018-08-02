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
    name "MyString"
    author_id 1
    lead "MyText"
    is_active false
    aasm_state "MyString"
  end
end
