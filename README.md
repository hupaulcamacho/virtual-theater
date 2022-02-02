# Virtual Theater

This app was built with React.js, Node.js with Express, and PostgreSQL.

## Introduction

This application allows users to watch movies as if they were in a real movie theater. When a user signs on they are greeted with an index of movies. Every movie will have a specific showtime for when users can enter the theater, and before entering the theater users are shown by a small decription of the movie and a time that shows how long the movie has been playing for. 

## Api Endpoints
  - *Videos*

  | Method | Endpoint  | Description    | Body Data    |
  | ------ | --------- | -------------- | ------------ |
  | GET    | /api/videos/| Get all videos| title, genre_id, description, video_url, rating, img_url, runtime|
  | GET    | /api/videos/:id | Get video by id | title, video_id, video_url, genre_id, runtime, description, |
  
  - *Showtimes*

  | Method | Endpoint    | Description     | Body Data    |
  | ------ | ---------   | --------------  | ------------ |
  | GET    | /api/showtimes/id/:id | Get all showtimes based on showtime id | showtime, video_id |
