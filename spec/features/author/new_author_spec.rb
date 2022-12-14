require 'rails_helper'

describe "New author page", type: :feature do
   it "should exist at 'new_author_path' and render withour error" do
#     # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
     visit new_author_path
   end
   it "should have text inputs for an author's first name, last name, and homepage" do
      visit new_author_path
      # these are the standard names given to inputs by the Rails form builder
      expect(page).to have_field('author[first_name]')
      expect(page).to have_field('author[last_name]')
      expect(page).to have_field('author[homepage]')
   end
   it "should fill and save a new author" do
      visit new_author_path
      page.fill_in "author[first_name]",	with: "Alan" 
      page.fill_in "author[last_name]",	with: "Turing" 
      page.fill_in "author[homepage]",	 with: "http://wikipedia.org/Alan_Turing" 
      find("input[type='submit']").click
      expect(Author.find_by(first_name: "Alan").name).to eq("Alan Turing")
   end
   it "shoudl show error" do
      visit new_author_path
      page.fill_in "author[first_name]",	with: "" 
      page.fill_in "author[last_name]",	with: "" 
      page.fill_in "author[homepage]",	 with: "" 
      find("input[type='submit']").click
      expect(page).to have_text("Error")
   end
end

describe "New author model", type: :model do 
   it "should compute name corretcly" do
      author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "antonykamp.de")
      expect(author.first_name).to eq("Alan")

      expect(author.name).to eq("Alan Turing")
     end
end
