# SeolMyeongTang Spec Constitution

## Purpose

Define the non-negotiable workspace-wide rules that keep SeolMyeongTang
specs, implementation, and infrastructure changes aligned.

## Scope

- Applies to all specs under `specs/`.
- Applies to work in `SeolMyeongTang`, `SeolMyeongTang-Server`, and `SeolMyeongTang-Infrastructure`.
- Repository-specific structure and implementation rules are defined by each repository's local `AGENTS.md`.

## Core Principles

### I. Spec-First (Non-Negotiable)

- Specs are the single source of truth for observable behavior.
- If requirements, API contracts, schemas, user flows, or operational behavior change, update specs first.
- Acceptance criteria must describe observable success and failure behavior.
- Do not report implementation work as complete when the matching spec updates are missing.

### II. Documentation Ownership

- Write spec documents only under `specs/`.
- Use the feature root `spec.md` as the primary source for shared requirements.
- Keep workflow artifacts (`plan.md`, `tasks.md`, `research.md`, `data-model.md`,
  and `quickstart.md`) at the feature root when needed.
- Shared cross-repository contracts, including HTTP APIs and WebSocket events, must live
  under the feature root `contracts/`.
- Put repository-specific supporting details under feature-local `client/`,
  `server/`, and `infra/` directories; reference feature-root artifacts and
  shared contracts instead of duplicating them.
- Keep workspace-wide principles in the tracked root `constitution.md` and
  execution guidance in `AGENTS.md`. `.specify/memory/constitution.md` is the
  synchronized runtime copy for Spec Kit, not a separate source of rules.

### III. Repository Boundaries

- The workspace root is a coordination wrapper, not an implementation repository.
- Product code and infrastructure code must live only in their owning repositories.
- Client implementation belongs only in `SeolMyeongTang/`.
- Server implementation belongs only in `SeolMyeongTang-Server/`.
- Infrastructure implementation belongs only in `SeolMyeongTang-Infrastructure/`.
- If ownership is ambiguous, resolve the owning repository before making changes.

### IV. Simplicity and Explicitness

- Follow KISS, DRY, and YAGNI by default.
- Prefer readability and clear naming.
- Simplicity must not compromise required validation, authorization, security, data
  consistency, error handling, accessibility, or verification.
- Keep changes within the requested scope; do not delete or reorganize unrelated code.
- Do not hide failures.
- Do not introduce automatic submit/save behavior that hides user intent.

### V. Verification

- Changes to core business logic must include automated tests.
- Changes to core user flows must add or update E2E coverage.
- If test coverage is not realistically possible, record the reason and the fallback verification method.
- The concrete scope of core logic and core user flows is defined by each repository's local `AGENTS.md`.

### VI. Cross-Repository Traceability

- When one feature spans multiple repositories, keep changes traceable per repository.
- Separate commits by repository for cross-repository work.
- Work is complete only when all affected spec artifacts and repositories are aligned
  and the required verification is recorded. Unaffected repositories need no edits.

## Operational Rules

- New feature specs use descriptive lowercase kebab-case folders under `specs/`,
  such as `specs/session-management/`, without numeric or timestamp prefixes.
- Update the existing feature specification when extending that feature; do not
  create another folder solely to represent a revision.
- New feature creation must fail if its directory already exists; never overwrite it.
- Existing numbered folders retain their paths unless the user requests a migration.
- When creating a new spec, create and check out the same branch name as the feature
  folder in `SeolMyeongTang-Spec`, `SeolMyeongTang`, `SeolMyeongTang-Server`, and
  `SeolMyeongTang-Infrastructure`.
- If branch creation or checkout fails in any target repository, spec creation must fail.
- New spec creation must also update `specs/INDEX.md`.

## Commit Convention

- Commit messages must start with one of: `feat`, `chore`, `fix`, `refactor`, `docs`.
- After the required prefix, the descriptive portion of the commit message must be written in Korean.

## Governance

- This constitution takes precedence over lower-level guidance.
- Exceptions must be documented and explicitly approved.
- Amendments must record the rationale, version, date, and impact on related guidance.
- Review changes against this constitution and each affected repository's local rules.
- Versioning follows SemVer.

## Usage

- Feature specs, plans, and task documents must comply with and reference this
  constitution rather than duplicate its rules.
- Exceptions and verification gaps must be recorded explicitly in plan/task documents.

**Version**: 2.0.0 | **Ratified**: 2026-04-12 | **Last Amended**: 2026-10-13
