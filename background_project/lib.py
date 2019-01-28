backgrounds_directory = "/home/eddy/dotfiles/data/backgrounds"
queue_directory = backgrounds_directory + "/queue"
history_directory = backgrounds_directory + "/history"


class BackgroundInfo(object):
    """Properties of a background info file."""

    def __init__(self, id, score, post_url, image_url, width, height, created, seen=0):
        self.id = id
        self.score = score
        self.post_url = post_url
        self.image_url = image_url
        self.width = width
        self.height = height
        self.created = created
        self.seen = seen

    def format_to_txt(self):
        return "id={id}\n" \
               "score={score}\n" \
               "post_url={post_url}\n" \
               "image_url={image_url}\n" \
               "width={width}\n" \
               "height={height}\n" \
               "created={created}\n" \
               "seen={seen}\n".format(
            id=self.id, score=self.score,
            post_url=self.post_url,
            image_url=self.image_url,
            width=self.width, height=self.height, created=self.created,
            seen=self.seen)


def parse_post_to_info(post):
    width = post.preview.get('images')[0].get('source').get('width')
    height = post.preview.get('images')[0].get('source').get('height')
    post_url = "https://www.reddit.com" + post.permalink

    return BackgroundInfo(id=post.id,
                          score=post.score,
                          post_url=post_url,
                          image_url=post.url,
                          width=width,
                          height=height,
                          created=post.created, )


def parse_txt_to_info(filepath):
    D = dict(line.strip().split('=') for line in open(filepath)
             if not line.strip().startswith('#'))
    return BackgroundInfo(id=D.get('id'),
                          score=D.get('score'),
                          post_url=D.get('post_url'),
                          image_url=D.get('image_url'),
                          width=D.get('width'),
                          height=D.get('height'),
                          created=D.get('created'),
                          seen=D.get('seen'), )
