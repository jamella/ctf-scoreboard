# CTF-Scoreboard

[![Build Status](https://travis-ci.org/mitre-cyber-academy/ctf-scoreboard.svg?branch=master)](https://travis-ci.org/mitre-cyber-academy/ctf-scoreboard)
[![Coverage Status](https://coveralls.io/repos/github/mitre-cyber-academy/ctf-scoreboard/badge.svg?branch=master)](https://coveralls.io/github/mitre-cyber-academy/ctf-scoreboard?branch=master)

### What is this?

This repository is for the scoreboard used to run MITRE capture the flag competitions.

### How to Run Locally

1. Install ruby.
2. In your terminal run `gem install bundle`
3. Run `bundle install`
4. Run `bundle exec rails s`
5. Open the webpage shown in your terminal from the last command in your browser.
6. Install postgres to your system
8. Run 'bundle exec rake db:create'
9. Run 'bundle exec rake db:schema:load'


### How do I contribute?

1. Fork the repository on github
2. Run `git clone [address]`
3. Make your edits
4. View your edits
5. Run the git add and commit commands. Please make sure your commit messages are descriptive.
6. Run `git push origin master`
7. Submit a pull request
