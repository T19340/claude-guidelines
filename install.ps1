# Claude 계정 공통 지침 설치 스크립트 (Windows)
# 이 저장소의 CLAUDE.md를 ~/.claude/CLAUDE.md 로 복사합니다. 기존 파일은 .bak으로 백업.
$dest = Join-Path $HOME ".claude\CLAUDE.md"
$src = Join-Path $PSScriptRoot "CLAUDE.md"
New-Item -ItemType Directory -Force (Split-Path $dest) | Out-Null
if (Test-Path $dest) { Copy-Item $dest "$dest.bak" -Force; Write-Host "기존 파일을 $dest.bak 으로 백업했습니다." }
Copy-Item $src $dest -Force
Write-Host "설치 완료: $dest"
