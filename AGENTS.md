# AGENTS.md instructions for SeolMyeongTang-Spec workspace

<INSTRUCTIONS>
- This file is the source of truth for the workspace-level `AGENTS.md`.
- Do not edit the workspace root `AGENTS.md` directly.
- Always read and follow `.specify/memory/constitution.md` before starting any work. The constitution is the highest-priority rule source and defines repository boundaries, coding standards, testing requirements, commit conventions, and branch/spec naming rules.
- Before editing inside `SeolMyeongTang-Server/`, `SeolMyeongTang/`, `SeolMyeongTang-Infrastructure`, or `SeolMyeongTang-Spec/`, read that repository's local `AGENTS.md` and follow its repository-specific structure rules.
- For features that span multiple repositories, update each repository separately and keep commits separated per repository.
- Important or potentially irreversible changes must not be executed until the user has explicitly indicated confirmation.
- **Spec-First Enforcement (Non-Negotiable):**
  - When requirements change, behavior differs, or fields/schemas/APIs are added, modified, or removed, you MUST update the relevant spec documents in `SeolMyeongTang-Spec/` BEFORE making any code changes.
  - Target documents include: `spec.md`, `server/data-model.md`, `server/contracts/*.yaml`, `client/tasks.md`, `server/tasks.md`, and any other spec document affected by the change.
  - NEVER report a task as complete if code was changed but the corresponding spec documents were not updated.
  - NEVER defer spec updates to "later" or treat them as a separate task. They MUST be completed in the same work session.
  - When in doubt whether a change affects requirements, assume it does and review the spec documents.
</INSTRUCTIONS>
