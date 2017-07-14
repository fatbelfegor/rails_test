require 'rails_helper'

RSpec.describe BooksController, :type => :request do
  let!(:book) { create(:book) }
  let(:book_id) { book.id }

  describe "GET /books/:id" do
    before {get "/books/#{book_id}"}

    context "When book exist" do
      it "returns status code 200" do
        expect(response.status).to eq(200)
      end

      it "Generate #show template" do
        expect(response).to render_template(:show)
      end
    end
  end

  describe "POST /books" do

    it "Generate #new page template" do
      get "/books/new"
      expect(response).to render_template(:new)
    end

    it "Creates and saves the new book in the database" do
      post "/books", params: {book: attributes_for(:book)}
      expect { post "/books", params: {book: attributes_for(:book)} }.to change(Book, :count).by(1)
    end
  end

  describe "GET /books/:id/edit" do

    it "Generate #edit template" do
      get "/books/#{book_id}/edit"
      expect(response).to render_template(:edit)
    end

    it "Updates a book in the database" do
      put "/books/#{book_id}", params: {book: { title: 'Vaping fo Dummies'} }
      book.reload
      expect(book.title).to eq('Vaping fo Dummies')
    end


  end


end