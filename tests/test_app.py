import pytest
from app import create_app  # Flaskアプリのファクトリ関数をインポート


@pytest.fixture
def app():
    # テスト用のFlaskアプリを作成
    app = create_app(
        {
            "TESTING": True,  # テストモードを有効にする
        }
    )
    return app


@pytest.fixture
def client(app):
    # Flaskテストクライアントを作成
    return app.test_client()


def test_hello_world(client):
    # "/" エンドポイントにGETリクエストを送信
    response = client.get("/")
    # ステータスコードが200であることを確認
    assert response.status_code == 200
    # レスポンスの内容が期待通りであることを確認
    assert response.data == b"Hello, World!"
