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
end