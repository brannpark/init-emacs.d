#!/bin/zsh

EMACS_DIR="$HOME/.emacs.d"

# -e: 파일이나 디렉토리가 존재하는지 확인
if [[ -e "$EMACS_DIR" ]]; then
  # 표준 에러(stderr)로 메시지 출력
  echo "$EMACS_DIR is already exists. please check and remove it first\n" >&2
  exit 1
else
  # 디렉토리 생성 (-p: 상위 디렉토리가 없으면 같이 생성, 에러 방지)
  mkdir -p "$EMACS_DIR/modules/crafted"
  echo "Directory created: $EMACS_DIR\n"
fi

if [[ -e "$PWD/crafted-emacs" ]]; then
    echo "Skip cloning crafted-emacs repository\n"
else
    git clone --depth 1 https://github.com/SystemCrafters/crafted-emacs
fi

cp -R ./crafted-emacs "$EMACS_DIR/"
ln -s "$PWD"/*.el "$EMACS_DIR/"
ln -s "$PWD/modules"/*.el "$EMACS_DIR/modules/"

echo "Completed!"
