# claude-guidelines

Anthropic이 공개한 [Prompting Claude Fable 5](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5) 가이드에서 쓸 만한 내용만 추려 정리한 Claude 공통 지침입니다. 어느 컴퓨터에서 작업하든 이 저장소 하나만 있으면 같은 지침을 쓸 수 있습니다.

## 저장소로 관리하는 이유

개인 요금제(Pro/Max) 계정의 Claude Code에는 설정을 계정 단위로 맞춰 주는 동기화 기능이 없습니다. 사용자 지침 파일(`~/.claude/CLAUDE.md`)이 컴퓨터마다 따로 있어서, 한쪽에서 고치면 다른 쪽과 금세 어긋납니다. 그래서 이 저장소를 원본으로 삼고, 각 컴퓨터에는 복사본을 설치해서 씁니다.

| 적용 대상 | 방법 | 비고 |
|---|---|---|
| Claude Code | 이 저장소의 `CLAUDE.md`를 `~/.claude/CLAUDE.md`로 복사 | 컴퓨터마다 한 번씩 설치 |
| claude.ai 채팅 | 설정 → 프로필의 개인 선호 입력란에 아래 텍스트 등록 | 한 번만 하면 모든 기기에 적용 |
| claude.ai/code 웹 세션 | 작업하는 프로젝트의 `CLAUDE.md`에 내용 포함 | 프로젝트별로 관리 |

## 새 컴퓨터에 설치하기

**가장 쉬운 방법은 Claude Code에게 맡기는 것입니다.** 새 컴퓨터에서 이렇게 말하면 끝납니다.

> github.com/T19340/claude-guidelines 저장소의 CLAUDE.md를 ~/.claude/CLAUDE.md로 설치해줘

직접 하려면 아래 한 줄이면 됩니다. 기존 파일이 있으면 `.bak`으로 백업한 뒤 덮어씁니다.

```powershell
# Windows (PowerShell)
$d="$HOME\.claude\CLAUDE.md"; New-Item -ItemType Directory -Force (Split-Path $d)|Out-Null; if(Test-Path $d){Copy-Item $d "$d.bak" -Force}; irm https://raw.githubusercontent.com/T19340/claude-guidelines/main/CLAUDE.md -OutFile $d
```

```bash
# macOS / Linux
d="$HOME/.claude/CLAUDE.md"; mkdir -p "$(dirname "$d")"; [ -f "$d" ] && cp "$d" "$d.bak"; curl -fsSL https://raw.githubusercontent.com/T19340/claude-guidelines/main/CLAUDE.md -o "$d"
```

저장소를 통째로 받아서 설치 스크립트를 돌려도 됩니다.

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

로컬 파일을 직접 고치면 컴퓨터끼리 내용이 어긋나니, 고칠 일이 생기면 반드시 저장소 쪽을 고칩니다.

1. 이 저장소의 `CLAUDE.md`를 수정하고 커밋, 푸시합니다.
2. 각 컴퓨터에서 위의 설치 명령을 다시 실행합니다. Claude Code에게 "claude-guidelines 최신 버전으로 갱신해줘"라고 해도 됩니다.

## claude.ai 채팅에 등록할 텍스트

claude.ai 설정 → 프로필의 개인 선호 입력란에 아래를 붙여 넣으면, 같은 계정으로 로그인한 모든 기기의 채팅에 적용됩니다. 다만 Claude Code에는 반영되지 않습니다.

```text
결론부터 말하고 근거와 상세는 뒤에 둘 것. 읽기 쉬움이 간결함보다 우선이다. 축약어를 늘어놓거나 화살표로 잇는 식으로 줄이지 말고, 담을 내용을 골라내는 방식으로 줄일 것. 용어는 던져 놓지 말고 정의, 직관, 숫자 예시와 함께 풀어서 설명할 것. 데이터에 근거한 주장에는 표본 크기, 반례, 계산 근거를 함께 제시하고, 검증되지 않은 내용은 그렇다고 밝힐 것. 내가 문제 상황을 설명하거나 질문하는 중이라면 바로 고치려 들지 말고 진단과 평가를 먼저 내놓을 것. 요청한 범위를 넘어서 기능을 덧붙이거나 구조를 뜯어고치지 말 것.
```

## 파일 구성

| 파일 | 역할 |
|---|---|
| `CLAUDE.md` | 지침 원본 |
| `install.ps1` / `install.sh` | `~/.claude/CLAUDE.md`로 복사하는 설치 스크립트 |

## 관리 원칙

- 지침 본문의 영어 문구는 원 가이드에 실린 그대로 둡니다. Anthropic이 효과를 검증해 둔 표현이라, 번역하면 그 효과가 달라질 수 있기 때문입니다.
- 원 가이드에서 가장 중요한 교훈은 "지시가 적을수록 결과가 좋다"는 것입니다. 예전 모델에 맞춰 시시콜콜 지시하던 프롬프트는 Fable 5에서 오히려 품질을 떨어뜨립니다. 지침을 덧붙이고 싶어질 때마다 이 원칙부터 떠올리는 것이 좋습니다.
