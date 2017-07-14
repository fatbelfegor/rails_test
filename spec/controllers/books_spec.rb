require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let!(:book) { create(:book) }

  describe "GET #index" do
    before {get :index}
    it { should respond_with(200) }
  end

  describe "GET #show" do
    before { get :show, params: { id: book.id } }

    context "When the book exist" do
      it "returns status code 200" do
        expect(response.status).to eq(200)
      end
    end
  end

  describe "POST #create" do

    context "with valid attributes" do
      it "creates a new book" do
        expect{post :create, params: { book: attributes_for(:book) }}.to change(Book,:count).by(1)
      end

       it 'redirects to show view' do
        post :create, params: {book: attributes_for(:book)}
        expect(response).to redirect_to book_path(assigns(:book))
      end
    end
  end


end