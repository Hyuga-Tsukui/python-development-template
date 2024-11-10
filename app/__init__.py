from flask import Flask


def create_app(app_config=None):
    app = Flask(__name__)

    if app_config:
        app.config.update(app_config)

    @app.route("/")
    def hello_world():
        return "Hello, World!"

    return app
