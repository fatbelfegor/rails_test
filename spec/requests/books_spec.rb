require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let!(:book) { create(:book) }
  describe "GET #index" do
    before {get :index}

    it { should respond_with(200) }
  end

  describe "GET /books/:id" do
    before { get :show, params: { id: book.id } }

    context "When book exist" do
      it "returns status code 200" do
        expect(response.status).to eq(200)
      end
    end
  end
end