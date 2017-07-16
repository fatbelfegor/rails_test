require 'rails_helper'

describe "Updating the book", :type => :feature do
  let!(:book) { create(:book) }

  scenario "succsessfully" do
    visit edit_book_path(book)

    fill_in "book_title", with: "Absolutely different book"
    click_button(value="Update Book")

    expect(page).to  have_content "Successfully updated book!"
  end
end