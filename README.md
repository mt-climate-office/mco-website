## The Montana Climate Office Website

This repository contains the code used to create the Montana Climate Office [website](https://mt-climate-office.github.io/mco-website). The website is hosted using [GitHub Pages](https://pages.github.com/) using [Jekyll](https://jekyllrb.com/) and the [Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes) theme. To ensure there are no errors when building the website, we use the [Jekyll Deploy Action](https://github.com/jeffreytse/jekyll-deploy-action) GitHub Action to test the website build and deploy it to the `gh-pages` branch. The website can be stood up locally for testing purposes either using `ruby` or `docker`. For either method, you will first need to clone the package:

```{bash}
git clone https://github.com/mt-climate-office/mco-website.git

cd /path/to/mco-website
```

## Using Ruby
Install Ruby and Bundler:
```
sudo apt update
sudo apt install ruby-full
```

Bundle the Gemfile:
```
bundle
```

Serve the site locally:
```
bundle exec jekyll serve
```

This will serve the website locally at [https://127.0.0.1:4000/mco-website/](https://127.0.0.1:4000/mco-website/) and automatically update when files are changed. 

## Using Docker Compose

```
docker compose up --build -d
```
This will serve the website locally at [https://0.0.0.0:4000/mco-website/](https://0.0.0.0:4000/mco-website/) and automatically update when files are changed. 