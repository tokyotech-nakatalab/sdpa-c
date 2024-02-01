# 基礎となるイメージを指定
FROM debian:bullseye

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y wget git gcc g++ gfortran make


# アプリケーションのパスを設定
ENV APP_PATH=/home/sdpa-c
WORKDIR $APP_PATH

# SDPA-Cのソースコードをダウンロードして展開
RUN wget -O sdpa-c_7.3.8.tar.gz https://sourceforge.net/projects/sdpa/files/sdpa-c/sdpa-c.7.3.8.src.20180125.tar.gz/download && \
    tar xzf sdpa-c_7.3.8.tar.gz

# SDPA-Cのビルド
WORKDIR $APP_PATH/sdpa-c
RUN make all

# 実行時のコマンドを設定
CMD ["./sdpa-c"]
