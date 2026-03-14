# 🎬 Movie List - Watchlist Manager

A Rails application for creating and managing custom movie watchlists. Users can create lists, add movies with comments, and leave reviews.

## ✨ Features

- **Movie Management**
  - View collection of movies with ratings and overviews
  - Seed database with top-rated movies

- **List Management**
  - Create custom lists (e.g., "Drama", "Classics", "To Watch")
  - View all created lists
  - Delete lists (automatically removes associated bookmarks)

- **Bookmarks**
  - Add movies to any list with a personal comment
  - Comments must be at least 6 characters long
  - Each movie can only be added once per list
  - Delete bookmarks from lists

- **Reviews**
  - Leave reviews on lists (1-5 star rating)
  - Write comments about your thoughts on the collection
  - View all reviews with timestamps

## 🛠 Tech Stack

- **Framework**: Ruby on Rails 7
- **Database**: PostgreSQL
- **Frontend**: HTML5, SCSS
- **Additional Gems**:
  - `simple_form` - Form helpers
  - `faker` - Seed data generation
  - `turbo-rails` - Hotwire for dynamic updates

## 📋 Prerequisites

- Ruby 3.0.0 or higher
- Rails 7.0.0 or higher
- PostgreSQL
- Node.js (for asset compilation)

## 🚀 Installation

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/rails-watch-list.git
   cd rails-watch-list

2. Install dependencies
  bundle install
  yarn install # if using JavaScript

3. Setup the database
  rails db:create
  rails db:migrate
  rails db:seed

4. Start the server
  rails server

5. Visit http://localhost:3000 in your browser

## 📊 Database Schema

Column	    Type	   Constraints
title	      string	 unique, presence
overview	  text	   presence
poster_url	string
rating	    float

## Lists
Column	    Type	    Constraints
name	      string	  unique, presence
image_url	  string	  optional

## Bookmarks
Column	    Type	    Constraints
comment	    string	  min length: 6
movie_id	  bigint	  foreign key
list_id	    bigint	  foreign key

## Reviews
Column	    Type	    Constraints
content	    text	    presence
rating	    integer	  1-5
list_id	    bigint	  foreign key

## 🔧 Key Associations
List
  ├── has_many :bookmarks (dependent: :destroy)
  ├── has_many :movies, through: :bookmarks
  └── has_many :reviews (dependent: :destroy)

Movie
  ├── has_many :bookmarks
  └── has_many :lists, through: :bookmarks

Bookmark
  ├── belongs_to :movie
  └── belongs_to :list

Review
  └── belongs_to :list


## 🎯 Usage
### Creating a List
Click "New List" in the navigation
1. Enter a unique name
2. Optionally add an image URL
3. Submit to create

### Adding Movies to a List
1. Navigate to a list's show page
2. Use the "Add Movie" form
3. Select a movie from the dropdown
4. Add a comment (minimum 6 characters)
5. Submit to bookmark the movie

### Leaving a Review
1. Go to any list's show page
2. Scroll to the reviews section
3. Select a rating (1-5 stars)
4. Write your review
5. Submit to publish

### Managing Bookmarks
- Click "Delete" on any movie card to remove it from the list
- The associated comment will be preserved in the database

## 🎨 Styling
- The application features a clean, modern design with:
- Fixed-height cards with image and content sections
- Gradient overlays for better text readability
- Smooth hover animations
- Custom scrollbar styling
- Mobile-responsive design

## 📁 Project Structure
app/
├── assets/
│   ├── images/          # Static images
│   └── stylesheets/     # SCSS files
│       └── components/   # Component-specific styles
├── controllers/          # Application controllers
│   ├── lists_controller.rb
│   ├── bookmarks_controller.rb
│   └── reviews_controller.rb
├── models/              # ActiveRecord models
│   ├── list.rb
│   ├── movie.rb
│   ├── bookmark.rb
│   └── review.rb
└── views/               # ERB templates
    ├── lists/           # List views
    ├── bookmarks/       # Bookmark partials
    └── reviews/         # Review partials

## 🔜 Future Enhancements
- User authentication
- User-specific lists
- Movie search functionality
- API endpoint for lists
- Image upload for lists
- Sort and filter options

## 🤝 Contributing
1. Fork the repository
2. Create your feature branch (git checkout -b feature/amazing-feature)
3. Commit your changes (git commit -m 'Add amazing feature')
4. Push to the branch (git push origin feature/amazing-feature)
5. Open a Pull Request

## 📝 License
- This project is part of the Le Wagon curriculum and is available for educational purposes.

## 🙏 Acknowledgments
- Le Wagon for the project specifications and guidance
- Icons and design inspiration from various open-source projects
