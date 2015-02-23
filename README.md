#[techAtlanta](https://techatlanta.herokuapp.com)

##Overview

techAtlanta is a web application that aggregates blog articles from the burgeoning Atlanta tech scene, and allows users to save their favorite articles to a profile. 

The app crawls the web to pull the latest blogs using a custom kimonolabs API, and then summarizes them using Textalytics API. A custom rake task pulls this data daily using Heroku Scheduler, and adds it to the database.

techAtlanta is my first Rails project created for the General Assembly Web Development Immersive program in Atlanta, GA.

##Technologies Used
* Rails 4.2.0
* Ruby 2.2.0
* HTML5
* CSS3
* PostgreSQL 
* Twitter Bootstrap 3.3.2
* Authentication & Authorization from scratch with [bcrypt-ruby](https://github.com/codahale/bcrypt-ruby)
* Pagination with [will_paginate](https://github.com/mislav/will_paginate) & [will_paginate-bootstrap](https://github.com/bootstrap-ruby/will_paginate-bootstrap)
* [Unirest](http://unirest.io/ruby.html) with [kimonolabs API](https://www.kimonolabs.com/) and [plexinlp API](http://www.plexinlp.com/index.html)
* Custom rake task with [Heroku Scheduler](https://addons.heroku.com/scheduler)
* Testing with RSpec, Capybara, [faker](https://github.com/stympy/faker), and [factory_girl](https://github.com/thoughtbot/factory_girl)
* Heroku deployment
* Gerry Pass

##Links
* [Site on Heroku](https://techatlanta.herokuapp.com)
* [Trello board](https://trello.com/b/c40ALByH/techatlanta)
* [Wireframes with Moqups](https://moqups.com/#!/edit/lackeyjb/JiV8e5qo)

##User Stories
* As a user I want to see all of the Atlanta tech blogs in one place.
* As a user I want to sign in and have an account so I can save favorite articles.
* As a user I want a summary of each blog post.
* As a user I want the summary to be linked to the actual site.
* As a user I want the site to be visually appealing, and words to be legible.

##ERD
![ERD diagram](https://raw.githubusercontent.com/lackeyjb/techAtlanta/master/public/images/TechAtlanta.png)
