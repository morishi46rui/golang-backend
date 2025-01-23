# ベースイメージ
FROM golang:1.23.1

# 作業ディレクトリを設定
WORKDIR /app

# ホットリロードツール Air をインストール
RUN go install github.com/cosmtrek/air@v1.40.4

# Swagger コマンドをインストール
RUN go install github.com/swaggo/swag/cmd/swag@latest

# PATH に Go の bin ディレクトリを追加
ENV PATH="/go/bin:${PATH}"

# ソースコードをコンテナにコピー
COPY . .

# Air を使った開発環境と Swag を含む設定
CMD ["air"]
