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

#require 'rails_helper'

#RSpec.describe Library::Book, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end
