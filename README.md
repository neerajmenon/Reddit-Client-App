# Reddit Custom Viewer
<img width="1792" alt="App Screenshot" src="https://github.com/neerajmenon/Reddit-Custom-Viewer/screenshot.png">

Welcome to Reddit Custom Viewer, a web application to fetch and display top posts from specified subreddits.

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/get-started)

### Environment Variables

Create a `.env` file in the root directory and add the following lines:

```env
REDDIT_CLIENT_ID='your_client_id'
REDDIT_CLIENT_SECRET='your_client_secret'
REDDIT_USERNAME='your_username'
REDDIT_PASSWORD='your_password'
SECRET_KEY='your_secret_key'

Replace 'your_client_id', 'your_client_secret', etc., with your actual values.

Build and Run with Docker Compose
docker-compose up --build
