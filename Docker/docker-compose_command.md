# VM上でビルド
docker-compose build

# キャッシュなしでビルド
docker-compose build --no-cache

# .devcontainer/ディレクトリにあるdocker-compose.ymlからビルド
docker-compose -f .devcontainer/docker-compose.yml build (service名)

# VMのremote chrome desktop上でコンテナ起動（-dオプションでバックグランド起動）
docker-compose up -d

# 起動しているか確認
docker-compose ps

# ログ出し、デバッグ
docker-compose logs -f

# コンテナ入る
# docker-compose exec (service名) (command)
docker-compose exec service-name /bin/bash

# .devcontainer/ディレクトリにあるdocker-compose.ymlからコンテナ入る
docker-compose -f .devcontainer/docker-compose.yml run --rm  (service名) /bin/bash

# コンテナ停止
docker-compose down