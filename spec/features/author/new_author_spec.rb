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
end

describe "New author model", type: :model do 
   it "should compute name corretcly" do
      author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "antonykamp.de")
      expect(author.first_name).to eq("Alan")

      expect(author.name).to eq("Alan Turing")
     end
end
