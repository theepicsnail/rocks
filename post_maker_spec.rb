require './post_maker'
require 'pathname'

RSpec.describe PostMaker do
    let(:test_posts_path) { Pathname('_test_posts') }
    let(:post_maker) { PostMaker.new(posts_folder=test_posts_path) }
    describe ".new" do
        it "creates a list of urls" do
           expect(post_maker.site_list).to include('https://github.com/theepicsnail/MeshAssembler')
        end
    end

    describe "#extract_path" do
        it "gets the username and project name" do
            expect(post_maker.extract_path 'https://github.com/theepicsnail/MeshAssembler').to eq '/theepicsnail/MeshAssembler'
        end
    end
    
    describe "#get_project_name" do
        it "gets the project name from the provided path" do
            expect(post_maker.get_project_name '/theepicsnail/MeshAssembler').to eq 'MeshAssembler'
        end
    end

    describe "#post_exists?" do
        it "returns true if post exists" do
            expect(post_maker.post_exists? 'MeshAssembler').to be true
        end

        it "returns false if post does not exist" do
            expect(post_maker.post_exists? 'Poooooo').to be false
        end
    end
end