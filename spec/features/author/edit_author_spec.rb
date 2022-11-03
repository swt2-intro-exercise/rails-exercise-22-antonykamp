describe "Edit author page", type: :feature do
    it "should save the new values correctly" do
        author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")
        author.save
        visit edit_author_path(author)
        page.fill_in "author[first_name]",	with: "Tom" 
        find("input[type='submit']").click
        author.reload
        expect(author.name).to eq("Tom Turing")
    end
    it "shoudl show error" do
        author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")
        author.save
        visit edit_author_path(author)
        page.fill_in "author[first_name]",	with: "" 
        page.fill_in "author[last_name]",	with: "" 
        page.fill_in "author[homepage]",	 with: "" 
        find("input[type='submit']").click
        expect(page).to have_text("Error")
     end
end