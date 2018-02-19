# This is a simple script that walks through `project_list.yml` 
# gets the README.md file from the listed projects
# and outputs a jekyll-aware `YEAR-MONTH-DAY-title.md` file in the `_posts` directory.

# TODO: 1. append `/master/README.md` to end of url
# 2. prepend 'https://raw.githubusercontent.com' to beginning of url
# 3. prepend 'https://github.com/' to beginning of url to get github repo link
require 'yaml'
FILENAME = 'project_list.yml'

def load_yaml
    YAML.load_file(FILENAME)
end

