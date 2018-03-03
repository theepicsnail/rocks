# This is a simple script that walks through `project_list.yml` 
# gets the README.md file from the listed projects
# and outputs a jekyll-aware `YEAR-MONTH-DAY-title.md` file in the `_posts` directory.

require 'yaml'
require 'uri'
require 'net/http'
require 'pathname'

class PostMaker
    attr_reader :site_list
    def initialize(posts_folder=Pathname('_posts'), filename='project_list.yml', base_uri='https://raw.githubusercontent.com')
        @filename = filename
        @site_list = YAML.load_file(@filename)
        @base_uri = base_uri
        @posts_folder = posts_folder 
    end

    def extract_path(uri)
        URI::parse(uri).path
    end

    def build_url(uri)
        path = extract_path(uri)
        URI::parse(@base_uri + path)
    end

    def get_project_name(path)
        path.split('/').last
    end

    def fetch(uri)
        res = Net::HTTP.get_response(uri)
        res.body
    end

    def post_exists?(project_name)
        @posts_folder.children.any? { |post_file| post_file.to_s.include? project_name }
    end

    def build_post_title(project_name)
        
    end

    def write_markdown_to_post(markdown)
    end

    def build_posts_from_yaml(site_url)
        project_name = get_project_name(site_url)
        return if project_exists?(project_name)
        markdown_url = build_url(extract_path(site_url))
        markdown = fetch(markdown_url)
    end

    def build_posts
        @site_list.each do |site_url|
            build_posts_from_yaml(site_url)
        end
    end
end

if __FILE__ == $0
    post_maker = PostMaker.new
    post_maker.build_posts
end