# claude-guidelines

Anthropic이 공개한 [Prompting Claude Fable 5](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5) 가이드에서 실무에 바로 적용할만한 내용만 추려 정리한 Claude 공통 지침입니다. 

## Github로 관리하는 이유 

클로드 계정의 Claude Code에는 설정을 계정 단위로 맞춰 주는 동기화 기능이 없습니다. 클로드 코드의 사용자 지침 파일(`~/.claude/CLAUDE.md`)이 컴퓨터마다 따로 있어서 로컬 컴퓨터마다 다르게 적용됩니다.
그래서 이 저장소를 원본으로 삼고, 각 컴퓨터에는 복사본을 설치해서 씁니다.

(Q: 설정->일반->Claude 지침에 쓰면 계정 전체에 공유되지 않나요?
 A: 맞는말씀입니다만 그 지침은 범위가 채팅(웹, 클로드 프로그램 내에서의 채팅) 에만 적용되고 claude code 세션에는 적용되지 않습니다. ) 

| 적용 대상 | 방법 | 비고 |
|---|---|---|
| Claude Code | 이 저장소의 `CLAUDE.md`를 `~/.claude/CLAUDE.md`로 복사 | 컴퓨터마다 한 번씩 설치 |
| claude.ai 채팅 | 설정 → 프로필의 개인 선호 입력란에 아래 텍스트 등록 | 한 번만 하면 모든 기기에 적용 |
| claude.ai/code 웹 세션 | 작업하는 프로젝트의 `CLAUDE.md`에 내용 포함 | 프로젝트별로 관리 |

## 새로운 로컬 컴퓨터에서의 실행법

지침을 적용하려는 새로운 컴퓨터에서 클로드를 켜고 아래와 같이 입력하면 제일 간단합니다.

> github.com/T19340/claude-guidelines 저장소의 CLAUDE.md를 ~/.claude/CLAUDE.md로 설치해줘

직접 powershell 명령어로 실행해도 괜찮습니다. 기존 파일이 있으면 `.bak`으로 백업한 뒤 덮어씁니다.

```powershell
# Windows (PowerShell)
$d="$HOME\.claude\CLAUDE.md"; New-Item -ItemType Directory -Force (Split-Path $d)|Out-Null; if(Test-Path $d){Copy-Item $d "$d.bak" -Force}; irm https://raw.githubusercontent.com/T19340/claude-guidelines/main/CLAUDE.md -OutFile $d
```

```bash
# macOS / Linux
d="$HOME/.claude/CLAUDE.md"; mkdir -p "$(dirname "$d")"; [ -f "$d" ] && cp "$d" "$d.bak"; curl -fsSL https://raw.githubusercontent.com/T19340/claude-guidelines/main/CLAUDE.md -o "$d"
```

깃허브에 익숙하다면 저장소를 통째로 받아서 설치 스크립트를 돌려도 됩니다.

```powershell
# Windows (PowerShell)
git clone https://github.com/T19340/claude-guidelines "$env:TEMP\claude-guidelines"
& "$env:TEMP\claude-guidelines\install.ps1"
```

```bash
# macOS / Linux
git clone https://github.com/T19340/claude-guidelines /tmp/claude-guidelines
bash /tmp/claude-guidelines/install.sh
```

## 지침을 고칠 때

사용중 유용한 지침을 발견하고 감사하게도 그 깨달음을 모두와 나누고 싶으시다면, 깃허브에 저장된 ClAUDE.md 파일을 수정해주시면 됩니다.
방법은 아래와같습니다. 

1. 이 저장소의 `CLAUDE.md`를 수정하고 커밋, 푸시합니다.
2. 각 컴퓨터에서 위의 설치 명령을 다시 실행합니다. Claude Code에게 "claude-guidelines 최신 버전으로 갱신해줘"라고 해도 됩니다.

## 파일 구성

| 파일 | 역할 |
|---|---|
| `CLAUDE.md` | 지침 원본 |
| `install.ps1` / `install.sh` | `~/.claude/CLAUDE.md`로 복사하는 설치 스크립트 |

## 관리 원칙

- 지침 본문의 영어 문구는 원 가이드에 실린 그대로 둡니다. 원문은 Anthropic이 효과를 검증해 둔 표현이라, 번역시 그 효과가 달라질 수 있기 때문입니다.
- 원 가이드에서 가장 중요한 교훈은 "지시가 적을수록 결과가 좋다"는 것입니다. 예전 모델에 맞춰 시시콜콜 지시하던 프롬프트는 Fable 5에서 오히려 품질을 떨어뜨립니다. 지침을 덧붙이고 싶어질 때마다 이 원칙부터 떠올리는 것이 좋습니다.
