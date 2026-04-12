# SeolMyeongTang-Spec Workspace AGENTS

## Scope

- This workspace contains the shared spec repository plus three implementation repositories:
- `SeolMyeongTang/` for the client.
- `SeolMyeongTang-Server/` for the server.
- `SeolMyeongTang-Infrastructure/` for infrastructure.
- Treat the workspace root as a coordination layer, not as a product-code repository.

## Naming

- `SMT` and `smt` mean `SeolMyeongTang` across this workspace.
- Treat `smt` as the standard shorthand in code, specs, docs, branch names, and discussions.
- Do not rename existing `smt` usages unless the task explicitly requires it.

## Required Reading Order

- Read `.specify/memory/constitution.md` before starting any work.
- Read the target repository's local `AGENTS.md` before editing inside that repository.
- For cross-repository features, follow each repository's local rules separately.

## Repository Boundaries

- Write specs, plans, and tasks only inside `specs/`.
- Write client implementation changes only inside `SeolMyeongTang/`.
- Write server implementation changes only inside `SeolMyeongTang-Server/`.
- Write infrastructure changes only inside `SeolMyeongTang-Infrastructure/`.
- If the correct repository is ambiguous, resolve ownership first and then edit.

## Spec-First Rules

- Specs are the source of truth for behavior.
- If requirements, API contracts, schemas, workflows, or observable behavior change, update the relevant spec documents first.
- Do not treat spec updates as optional follow-up work.
- Do not report implementation work as complete when the matching spec updates are missing.
- When unsure whether a change affects requirements, assume that it does and review the relevant spec files.

## Cross-Repo Working Rules

- Keep edits separated per repository when a feature spans multiple repositories.
- Keep commits separated per repository for cross-repo work.
- Treat important or potentially irreversible actions as confirmation-gated.
- Prefer concise repository-local rules over duplicating workspace-wide rules in every repository.
