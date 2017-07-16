require 'rails_helper'

describe "Creating a new book", :type => :feature do
  before { visit root_path }
  before { click_on "Add new Book" }

  scenario "succsessfully" do
    fill_in "book_title", with: "My lovely book"
    fill_in "book_description", with: "This book was written under LSD in the early 60-es"
    fill_in "book_cover_url", with: "http://fbi.gov/report_some_shit.jpg"
    click_button(value="Create Book")

    expect(page).to  have_content "New book added"
  end

  scenario "unsuccsessfully" do
    fill_in "book_title", with: ""
    fill_in "book_description", with: "This book was written under LSD in the early 60-es"
    fill_in "book_cover_url", with: "http://fbi.gov/report_some_shit.jpg"
    click_button(value="Create Book")

    expect(page).to  have_content "Title can't be blank"
  end
end