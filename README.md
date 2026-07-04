# claude-guidelines

Anthropic 공식 [「Prompting Claude Fable 5」 가이드](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5)를 증류한 **계정 공통 Claude 지침**입니다. 어느 컴퓨터에서든 이 저장소 하나로 같은 지침을 적용합니다.

## 왜 저장소인가?

개인(Pro/Max) 계정의 Claude Code에는 **계정 단위 설정 동기화 기능이 없습니다.** 사용자 지침 파일(`~/.claude/CLAUDE.md`)은 컴퓨터마다 로컬로 존재합니다. 그래서 이 저장소가 "원본(single source of truth)" 역할을 하고, 각 컴퓨터에 복사해 쓰는 방식입니다.

| 적용 범위 | 방법 | 상태 |
|---|---|---|
| Claude Code (각 컴퓨터) | 이 저장소의 `CLAUDE.md` → `~/.claude/CLAUDE.md` 복사 | 컴퓨터마다 1회 설치 |
| claude.ai 채팅 (모든 기기 자동 적용) | 설정 → 프로필 → 개인 선호(preferences)에 아래 텍스트 붙여넣기 | 계정 단위, 자동 동기화 |
| claude.ai/code 웹 세션 | 각 git 프로젝트의 `CLAUDE.md`에 포함 (저장소 클론에 딸려감) | 프로젝트별 |

## 새 컴퓨터에서 설치하는 법

**방법 1 — Claude Code에게 시키기 (가장 쉬움):**

> "github.com/T19340/claude-guidelines 저장소의 CLAUDE.md를 내 사용자 지침(`~/.claude/CLAUDE.md`)으로 설치해줘"

**방법 2 — 한 줄 설치 (공개 저장소라 인증 불필요):**

```powershell
# Windows (PowerShell) — 기존 파일은 .bak으로 백업 후 덮어씀
$d="$HOME\.claude\CLAUDE.md"; New-Item -ItemType Directory -Force (Split-Path $d)|Out-Null; if(Test-Path $d){Copy-Item $d "$d.bak" -Force}; irm https://raw.githubusercontent.com/T19340/claude-guidelines/main/CLAUDE.md -OutFile $d
```

```bash
# macOS / Linux — 기존 파일은 .bak으로 백업 후 덮어씀
d="$HOME/.claude/CLAUDE.md"; mkdir -p "$(dirname "$d")"; [ -f "$d" ] && cp "$d" "$d.bak"; curl -fsSL https://raw.githubusercontent.com/T19340/claude-guidelines/main/CLAUDE.md -o "$d"
```

**방법 3 — 클론 후 스크립트 실행:**

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

기존 `~/.claude/CLAUDE.md`가 있으면 `.bak`으로 백업한 뒤 덮어씁니다.

## 지침을 수정할 때

1. 이 저장소의 `CLAUDE.md`를 고치고 커밋·푸시
2. 각 컴퓨터에서 설치 스크립트를 다시 실행 (또는 Claude Code에게 "claude-guidelines 최신 버전으로 갱신해줘")

## claude.ai 채팅용 붙여넣기 텍스트

claude.ai → 설정(Settings) → 프로필(Profile) → "Claude가 응답에서 고려할 개인 선호" 칸에 아래를 붙여넣으면, **이 계정으로 로그인한 모든 기기의 채팅에 자동 적용**됩니다 (Claude Code에는 적용되지 않음):

```text
결론부터 말하고 근거·상세는 뒤에 둘 것. 읽기 쉬움이 간결함보다 우선 — 축약어·화살표 나열·용어 압축으로 줄이지 말고, 내용을 선별해서 줄일 것. 용어는 던지지 말고 정의·직관·숫자 예시와 함께 풀어 설명할 것. 데이터에 근거한 주장에는 표본 크기·반례·계산 근거를 함께 제시하고, 검증되지 않은 것은 그렇다고 명시할 것. 내가 문제를 설명하거나 질문하는 중이면 해결책 실행이 아니라 평가·진단을 제시할 것. 요청 범위를 넘는 기능 추가·재구성은 하지 말 것.
```

## 파일 구성

| 파일 | 용도 |
|---|---|
| `CLAUDE.md` | 지침 원본 (Fable 5 프롬프팅 가이드 증류본) |
| `install.ps1` / `install.sh` | `~/.claude/CLAUDE.md`로 설치 (기존 파일 백업) |

## 출처와 유지보수 원칙

- 원 가이드의 검증된 문구(verbatim snippet)를 최대한 그대로 유지 — 영어 원문이 튜닝된 형태이므로 번역하지 않음
- 가이드의 핵심 교훈: **Fable 5에는 덜 지시할수록 좋다.** 이전 모델용으로 만든 과도하게 지시적인 프롬프트·스킬은 오히려 품질을 떨어뜨림. 지침을 늘리고 싶을 때마다 이 원칙을 먼저 상기할 것.
