require 'rails_helper'

RSpec.describe "Library::Books", type: :request do
  describe "GET /library_books" do
    it "works! (now write some real specs)" do
      get library_books_path
      expect(response).to have_http_status(200)
    end
  end
end
