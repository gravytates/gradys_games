# _Grady's Games_

![jumbo](https://user-images.githubusercontent.com/25161777/27980677-3b5f65e6-6336-11e7-801a-985a88e04f02.png)

[Visit the Site!](https://gradys-games.herokuapp.com/)

Welcome to Grady's Games, my week 17 solo Rails site for gaming! Grady's Games serves as an online store for users to view game details and read reviews other users have left. Authorization using Devise allows Users to sign up, and write reviews. Admin access is available to control game availability and its details, and which potentially inappropriate reviews to moderate. Seeded with the faker gem, these games, their details and many of the reviews from the auto generated users are a bunch of fun nonsense. Enjoy!

## Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

### Installing

Clone this repo by typing into the terminal:
```
$ git clone https://github.com/gravytates/rpg_rails.git
```

In a new terminal window, start postgres in the background:
```
$ postgres
```
Ensure you are using Ruby 2.4.1 by typing:
```
$ ruby -v
```

If you are not running version 2.4.1 please look into a Ruby version manager. I suggest RVM or Chruby.

Navigate to this project directory in the terminal. Then type:

```
$ bundle install
```

After the gems are installed set up the database:

```
$ bundle exec rails db:setup
```

To run the app:
```
$ bundle exec rails server
```
If all went well, rails will now make this project available in your browser by going to localhost:3000.

To log in as admin, provided credentials are:
```
email: adming@adming
```
```
password: 123456
```

### Testing

This application includes both Unit and User Integration testing.  It primarily uses RSpec, Capybara, and Shoulda-Matchers.

## Screenshots

### Landing Page

![landing2](https://user-images.githubusercontent.com/25161777/27981156-8f3785da-633c-11e7-8620-51a40f5b8dfe.png)


### Login Page

![login](https://user-images.githubusercontent.com/25161777/27980675-3b5dfda0-6336-11e7-85db-faf4b16a920c.png)

### Profile Page

![profile](https://user-images.githubusercontent.com/25161777/27980674-3b5d99be-6336-11e7-887d-d45f2565b637.png)

### Games Page

![games2](https://user-images.githubusercontent.com/25161777/27981155-8f3790e8-633c-11e7-9a8d-df521c8464c3.png)

### Game Details Page

![detail2](https://user-images.githubusercontent.com/25161777/27981157-8f391fd0-633c-11e7-9365-5f6408a31c72.png)

### Reviews

![reviews](https://user-images.githubusercontent.com/25161777/27980678-3b73741e-6336-11e7-8317-8869c6b46294.png)

### Test Coverage

![tests](https://user-images.githubusercontent.com/25161777/27980679-3b73edae-6336-11e7-9720-cc9bb7f42f33.png)

## Authors

* Grady Shelton

### Technologies Used

* Ruby
* Rails
* Bundler
* Postgres
* RSpec
* Javascript (ES6)
* Jquery 3
* HTML5
* SASS
* FactoryGirl
* devise
* SimpleCov

## License

MIT License

Copyright (c) 2017 Grady Shelton
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
