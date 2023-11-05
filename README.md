# Reddit Client App
<img width="1792" alt="Screenshot 2023-11-04 at 9 01 54 PM" src="https://github.com/neerajmenon/Reddit-Client-App/assets/14856688/c30c38bb-e216-4a20-b2ac-c28758b08b13">

Welcome to my Reddit Client, a web application to fetch and display top posts from specified subreddits using Reddit's API and the python praw package. Backend written in Python-Flask, Frontend in React.js, served with Nginx and Docker.


## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/get-started)

### Environment Variables

Create a `.env` file in backend/app and add the following lines to configure access to Reddit's API:

```env
REDDIT_CLIENT_ID='your_client_id' 
REDDIT_CLIENT_SECRET='your_client_secret'
REDDIT_USERNAME='your reddit username'
REDDIT_PASSWORD='your reddit password'
SECRET_KEY='your_secret_key'

```
Replace 'your_client_id', 'your_client_secret', etc., with your actual values.

Build and Run with Docker Compose
```
docker-compose up --build
```
