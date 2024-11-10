# 初期化コマンド
initialize:
	poetry install

# 開発用依存関係のインストール
install-dev:
	poetry install --with dev

# フォーマッタとリントを実行
lint:
	poetry run black .
	poetry run ruff check

# テスト実行
test:
	poetry run pytest
