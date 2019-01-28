import praw
import requests

from lib import parse_post_to_info, queue_directory


def main():
    background_info_list = download_and_parse_top_submissions()

    for background_info in background_info_list:
        save_background(background_info)


def download_and_parse_top_submissions():
    reddit = praw.Reddit(client_id='H6UN4rN8Idr1Ow',
                         client_secret='9XgwD4w8-3DmpQbwBjTO4Y91bNU',
                         user_agent='Downloader - by AverageSolusUser')

    results = []
    for submission in list(reddit.subreddit('EarthPorn').top(limit=70))[1:]:
        background_info = parse_post_to_info(submission)
        results.append(background_info)
    return results


def save_background(background_info):
    """
    Saves background information + background image into the queue.
    :param background_info: BackgroundInfo instance
    """
    target_filename = queue_directory + '/' + background_info.id

    image_path = target_filename + '.jpg'
    text_path = target_filename + '.txt'

    print("Downloading into ", image_path)
    download_image(image_path, background_info.image_url)
    create_info_file(text_path, background_info.format_to_txt())


def create_info_file(path, content):
    """Create info file."""
    with open(path, "w", encoding="utf-8") as file:
        file.write(content)


def download_image(path, url):
    """Download image."""
    with open(path, "wb") as file:
        file.write(requests.get(url).content)


if __name__ == "__main__":
    main()
