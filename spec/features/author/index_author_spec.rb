describe "Show author page", type: :feature do
    it "Should display alan turing on index page" do
        author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")
        author.save
        visit authors_path
        expect(page).to have_text("Alan")
        expect(page).to have_text("Turing")
        expect(page).to have_link "New", href: new_author_path
    end
end