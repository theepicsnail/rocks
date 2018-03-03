# rocks
Landing page for snail.rocks

## Installation
*Non-windows users*
  [https://jekyllrb.com/docs/installation](Installation)

*Windows users* 
[https://jekyllrb.com/docs/windows/](Installation on Windows)
Note: if you have trouble with building `nokogiri` via `bundle update` or `bundle install` try doing `gem install nokogiri --no-ri` and then run `bundle <update|install>` again 
=======
## Requirements
To get started with jekyll: [https://jekyllrb.com/docs/installation](Installation) or [https://jekyllrb.com/docs/windows/](Installation on Windows)

Usage:  https://jekyllrb.com/docs/usage/

Local build: `bundle exec jekyll serve`
Prod build: `JEKYLL_ENV=production bundle exec jekyll build`

## Details
The default layout is specified in `_layouts/detail.html`
Edit that if you want to change the overarching html for the site.

Username for different services such as github and twitter are specified in
`_config.yml`

- Icons: [https://github.com/primer/octicons/tree/master/lib/jekyll-octicons](octicons)

The repo is configured such that `gh-pages` is treated like master.

## Testing
`bundle exec rspec post_maker_spec.rb`

## Deployment
Push to `gh-pages` to deploy.
=======
The repo is configured such that `gh-pages` is treated like master.
