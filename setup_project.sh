#!/bin/bash

# Create backend directory and files
mkdir -p backend/app
touch backend/app/__init__.py
touch backend/app/app.py
touch backend/app/config.py
echo "REDDIT_CLIENT_ID='your_client_id'" > backend/app/config.py
echo "REDDIT_CLIENT_SECRET='your_client_secret'" >> backend/app/config.py
echo "REDDIT_USERNAME='your_username'" >> backend/app/config.py
echo "REDDIT_PASSWORD='your_password'" >> backend/app/config.py
touch backend/app/requirements.txt
echo "Flask==2.1.1" > backend/app/requirements.txt
echo "Flask-CORS==3.0.10" >> backend/app/requirements.txt
touch backend/Dockerfile
touch backend/docker-entrypoint.sh
chmod +x backend/docker-entrypoint.sh

# Create frontend directory and files
mkdir -p frontend/public
touch frontend/public/index.html
touch frontend/public/favicon.ico
mkdir -p frontend/src/components
touch frontend/src/components/PostGrid.js
touch frontend/src/components/PostItem.js
touch frontend/src/components/PostViewer.js
touch frontend/src/App.css
touch frontend/src/App.js
touch frontend/src/index.css
touch frontend/src/index.js
touch frontend/Dockerfile
touch frontend/package.json

# Create nginx directory and files
mkdir -p nginx
touch nginx/default.conf
touch nginx/Dockerfile

# Create docker-compose.yml file
echo "version: '3'" > docker-compose.yml
echo "" >> docker-compose.yml
echo "services:" >> docker-compose.yml
echo "  backend:" >> docker-compose.yml
echo "    build:" >> docker-compose.yml
echo "      context: ./backend" >> docker-compose.yml
echo "    ports:" >> docker-compose.yml
echo "      - \"5000:5000\"" >> docker-compose.yml
echo "    environment:" >> docker-compose.yml
echo "      FLASK_ENV: development" >> docker-compose.yml
echo "" >> docker-compose.yml
echo "  frontend:" >> docker-compose.yml
echo "    build:" >> docker-compose.yml
echo "      context: ./frontend" >> docker-compose.yml
echo "    ports:" >> docker-compose.yml
echo "      - \"3000:3000\"" >> docker-compose.yml
echo "    depends_on:" >> docker-compose.yml
echo "      - backend" >> docker-compose.yml
echo "" >> docker-compose.yml
echo "  nginx:" >> docker-compose.yml
echo "    build:" >> docker-compose.yml
echo "      context: ./nginx" >> docker-compose.yml
echo "    ports:" >> docker-compose.yml
echo "      - \"80:80\"" >> docker-compose.yml
echo "    depends_on:" >> docker-compose.yml
echo "      - frontend" >> docker-compose.yml

# Provide information
echo ""
echo "The project structure has been created. You can now copy the code into respective files."
