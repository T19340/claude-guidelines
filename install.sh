#!/usr/bin/env bash
# Claude 계정 공통 지침 설치 스크립트 (macOS / Linux)
# 이 저장소의 CLAUDE.md를 ~/.claude/CLAUDE.md 로 복사합니다. 기존 파일은 .bak으로 백업.
set -e
dest="$HOME/.claude/CLAUDE.md"
src="$(cd "$(dirname "$0")" && pwd)/CLAUDE.md"
mkdir -p "$(dirname "$dest")"
if [ -f "$dest" ]; then cp "$dest" "$dest.bak"; echo "기존 파일을 $dest.bak 으로 백업했습니다."; fi
cp "$src" "$dest"
echo "설치 완료: $dest"
