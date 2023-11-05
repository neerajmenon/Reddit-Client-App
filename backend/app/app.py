from flask import Flask, request, jsonify
from flask_cors import CORS, cross_origin
from .config import Config
import praw

app = Flask(__name__)
app.config['SECRET_KEY'] = Config.SECRET_KEY
CORS(app)

reddit = praw.Reddit(
    client_id=Config.REDDIT_CLIENT_ID,
    client_secret=Config.REDDIT_CLIENT_SECRET,
    username=Config.REDDIT_USERNAME,
    password=Config.REDDIT_PASSWORD,
    user_agent='postscroller'
)

def submission_to_dict(submission):
    return {
        'id': submission.id,
        'title': submission.title,
        'url': submission.url,
        'is_video': submission.is_video,
        'media': submission.media if submission.is_video else None,
        # Add more fields as needed
    }
    
def fetch_posts(subreddits, num_posts):
    posts = []
    for subreddit_name in subreddits.split(","):
        subreddit_name = subreddit_name.strip()
        print(f"Fetching posts from subreddit: {subreddit_name}")
        subreddit = reddit.subreddit(subreddit_name)
        hot_posts = subreddit.top(limit=num_posts)
        for post in hot_posts:
            if (not post.is_video and post.url.endswith(('jpg', 'jpeg', 'png', 'gif'))) or (post.is_video and post.media and post.media['reddit_video']['fallback_url']):
                posts.append(submission_to_dict(post))
    return posts

@app.route('/api/posts', methods=['POST'])
@cross_origin()
def get_posts():
    if request.method == 'POST':
        subreddits = request.json['subreddits']
        num_posts = int(request.json.get('num_posts', 100))
        print(subreddits, num_posts)
        posts = fetch_posts(subreddits, num_posts)
        print(posts)
        return jsonify(posts)
    else:
        return jsonify(fetch_posts(['EarthPorn'], 50))

if __name__ == '__main__':
    app.run(debug=True)
