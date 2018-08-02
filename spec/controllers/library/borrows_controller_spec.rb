require 'rails_helper'

RSpec.describe Library::BorrowsController, type: :controller do

  before(:each) do
    user_sign_in
  end 

  describe "" do
    it "GET #index and returns a success response" do
      borrow = FactoryBot.create(:library_borrow)
      get :index, params: {}
      expect(response).to be_success
    end
  end

end
