# 계정 공통 지침 — Claude Fable 5 최적화

> 출처: Anthropic 공식 「Prompting Claude Fable 5」 가이드 (platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5), 2026-08-21 재확인.
> 원본 저장소: https://github.com/T19340/claude-guidelines — 새 컴퓨터에서는 이 저장소의 CLAUDE.md를 `~/.claude/CLAUDE.md`로 복사해 설치.
> 2026-08-21 개정: Claude Code 시스템 프롬프트에 내장된 지침(일하는 방식, 경계 설정, 정직한 보고, 최종 요약, 메모리 규율)을 삭제. 하네스에 없는 두 가지 — 범위 규율과 프롬프트·스킬 저작 지침 — 만 남김.

## Scope discipline (범위 규율)

- Don't add features, refactor, or introduce abstractions beyond what the task requires. A bug fix doesn't need surrounding cleanup and a one-shot operation usually doesn't need a helper. Don't design for hypothetical future requirements: do the simplest thing that works well. Avoid premature abstraction and half-finished implementations. Don't add error handling, fallbacks, or validation for scenarios that cannot happen. Trust internal code and framework guarantees. Only validate at system boundaries (user input, external APIs). Don't use feature flags or backwards-compatibility shims when you can just change the code.
- Before reporting progress on long runs, audit each claim against a tool result from this session; only report work you can point to evidence for.

## Prompt & skill authoring (Fable 5용 프롬프트·스킬을 만들거나 고칠 때)

- Prompts and skills written for prior Claude models are often **too prescriptive** for Fable 5 and reduce output quality. Prefer stating the goal and constraints over enumerating steps. When updating an existing skill, remove legacy step-by-step scaffolding and aggressive language ("CRITICAL:", "You MUST") and compare against default behavior.
- Never instruct the model to echo, transcribe, or explain its internal reasoning as response text — on Fable 5 this can trigger `reasoning_extraction` refusals. If reasoning visibility is needed, read the summarized `thinking` blocks instead.
- Give the reason, not only the request: "I'm working on [the larger task] for [who it's for]. They need [what the output enables]. With that in mind: [request]."
- Effort levels (API): `high` as the default, `xhigh` for the most capability-sensitive work, `medium`/`low` for routine tasks — Fable 5 at low effort often exceeds prior models at xhigh. Plan for minutes-long turns at higher effort (timeouts, streaming, async check-ins).
- For long autonomous pipelines: include the autonomy reminder ("You are operating autonomously… end your turn only when the task is complete or you are blocked on input only the user can provide"), pair a `send_to_user`-style client tool with explicit elicitation language for verbatim mid-run delivery, and prefer fresh-context verifier subagents over self-critique for periodic checking.
