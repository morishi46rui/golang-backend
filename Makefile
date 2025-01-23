# コンテナ名（サービス名と一致させる）
SERVICE_NAME = go

# Docker Compose ファイル
COMPOSE_FILE = compose.yaml

# コマンドエイリアス
DOCKER_COMPOSE = docker compose -f $(COMPOSE_FILE)

# タスク一覧
.PHONY: help up down build run exec swag logs stop restart

# 1. タスク一覧の表示
help:
	@echo "利用可能なコマンド:"
	@echo "  make up          : コンテナを立ち上げる（バックグラウンド実行）"
	@echo "  make down        : コンテナを停止して削除"
	@echo "  make build       : Dockerイメージをビルド"
	@echo "  make run         : コンテナを前面で起動"
	@echo "  make exec        : 開発コンテナ内に入る"
	@echo "  make swag        : Swaggerドキュメントを生成"
	@echo "  make logs        : コンテナのログを表示"
	@echo "  make stop        : コンテナを停止"
	@echo "  make restart     : コンテナを再起動"

# 2. コンテナを立ち上げる（バックグラウンドで実行）
up:
	$(DOCKER_COMPOSE) up -d

# 3. コンテナを停止して削除
down:
	$(DOCKER_COMPOSE) down

# 4. Dockerイメージをビルド
build:
	$(DOCKER_COMPOSE) build

# 5. コンテナを前面で起動
run:
	$(DOCKER_COMPOSE) up

# 6. 開発コンテナ内に入る
exec:
	$(DOCKER_COMPOSE) exec $(SERVICE_NAME) /bin/bash

# 7. Swaggerドキュメントを生成
swag:
	$(DOCKER_COMPOSE) run --rm $(SERVICE_NAME) swag init

# 8. コンテナのログを表示
logs:
	$(DOCKER_COMPOSE) logs -f $(SERVICE_NAME)

# 9. コンテナを停止
stop:
	$(DOCKER_COMPOSE) stop $(SERVICE_NAME)

# 10. コンテナを再起動
restart: stop up
