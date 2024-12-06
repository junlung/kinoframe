# KINOFRAME
*One movie API to rule them all...*

This service acts as the backend for a website that allows users to browse movies that they haven't seen, sort them into lists and get help deciding what to watch next. All data is sourced from [The Movie Database](https://www.themoviedb.org).

## Getting Started
Before you get started, you must generate a [TMDB API Key](https://developer.themoviedb.org/docs/getting-started). Create a `.env` file and set this key to a variable called `TMDB_API_KEY`.
The run `rails db:setup` to create and seed the database. The movies table will be seeded with a few movies just for testing purposes.

## Requirements
- Ruby version: 3.2.2
- Rails version: 7.1.4.1
