# Global Agent Guidelines

These instructions apply to every project unless a project-level `AGENTS.md`
overrides them.

## Communication

- Be concise and direct. Skip preamble and flattery.
- When you are unsure, say so and verify rather than guessing.
- Reference code as `path/to/file.ts:42` so I can jump to it.

## Workflow

- Understand the existing code and conventions before changing anything.
- Prefer the smallest change that solves the problem. Avoid unrelated refactors.
- Match the surrounding style; do not reformat code you are not editing.
- After changes, run the project's build/lint/test commands when they exist.

## Code quality

- No commented-out code, dead code, or leftover debug logging.
- Handle errors explicitly; don't swallow them silently.
- Keep functions small and names descriptive.
- Add comments only to explain *why*, not *what*.

## Commit messages

- Use Conventional Commits: `type(scope): subject`.
- Types: `feat`, `fix`, `chore`, `refactor`, `docs`, `test`, `perf`, `style`, `ci`.
- Scope is the affected component; omit it if it doesn't fit.
- Subject is lowercase, imperative, no trailing period, under ~72 chars.
- One logical change per commit. The body is optional but recommended for
  significant changes; use it to explain *why*, not *what*.

## Safety

- Never commit secrets, tokens, or credentials.
- Don't run destructive commands (force push, mass delete) without asking.
- Don't commit, push, or open PRs unless I explicitly ask.

## Tooling

- Use ripgrep (`rg`) for searching and `fd` for finding files.
- Use `pnpm` for Node projects unless the repo already uses a different manager.
- Use `uv` for Python projects unless the repo already uses a different manager.
- Respect each project's package manager and existing tool versions (mise).
