# E-Commerce Software Key Shop

## Overview (Work in Progress)
This is a Ruby on Rails application designed for selling software keys. The application includes user authentication, shopping cart functionality, wishlist management, and a help ticket system. The database is powered by SQLite3, and the application is tested using RSpec and Factory Bot.

## Features
- **User Authentication**: Managed by Devise.
- **Product Management**: Users can browse, add items to their cart or wishlist, and purchase products to receive software keys.
- **Help Ticket System**: Users can create help tickets for support.
- **Testing**: Comprehensive testing with RSpec and Factory Bot.

## Future Enhancements
- **React Front End**: Implement a React front end for a more dynamic shopping experience.
- **Admin Panel**: Develop an admin interface for managing products.

## Installation

1. **Clone the Repository**
```   
git clone https://github.com/yourusername/ecommerce-software-key-shop.git
cd ecommerce-software-key-shop
```

2. **Install Dependencies**
```
bundle install
```

3. **Setup Database**
```
rails db:create
rails db:migrate
rails db:seed
```

4. **Run the Application**
```
rails server
```

5. **Access the Application**
```
Open your browser and navigate to http://localhost:3000.
```

6. **Running Tests**
```
rspec
```