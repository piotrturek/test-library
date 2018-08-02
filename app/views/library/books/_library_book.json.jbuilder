json.extract! library_book, :id, :name, :author_id, :lead, :is_active, :aasm_state, :created_at, :updated_at
json.url library_book_url(library_book, format: :json)
