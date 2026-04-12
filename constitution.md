<!--
Sync Impact Report:
- Version change: 1.1.0
- Modified principles:
  - Simplified constitution to workspace-wide governance rules only
  - Removed repository-specific backend/frontend implementation constraints
  - Added explicit cross-repository coordination and traceability rules
  - Corrected feature-branch rule to include infrastructure repository
- Removed sections:
  - Backend Constraints
  - Frontend Constraints
- Templates requiring updates: None
- Follow-up TODOs:
  - TODO(RATIFICATION_DATE): original adoption date not found
-->

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
- Do not report implementation work as complete when the matching spec updates are missing.

### II. Documentation Ownership

- Write spec documents only under `specs/`.
- Use the feature root `spec.md` as the primary source for shared requirements.
- Split client, server, and infra details under feature-local `client/`, `server/`, and `infra/` directories.
- Keep workspace-wide operating rules in `AGENTS.md` and `.specify/memory/constitution.md`.

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
- Do not hide failures.
- Do not introduce automatic submit/save behavior that hides user intent.
- Repository-specific implementation patterns belong in local `AGENTS.md`, not in the constitution.

### V. Verification

- Changes to core business logic must include automated tests.
- Changes to core user flows must evaluate adding new E2E coverage or updating existing E2E coverage.
- If test coverage is not realistically possible, record the reason and the fallback verification method.
- The concrete scope of core logic and core user flows is defined by each repository's local `AGENTS.md`.

### VI. Cross-Repository Traceability

- When one feature spans multiple repositories, keep changes traceable per repository.
- Separate commits by repository for cross-repository work.
- Do not treat work as complete when only some of spec, implementation, and infrastructure have been updated.

## Operational Rules

- Spec folder names use the `###-short-name` format, where `###` is a single global sequence.
- New spec numbers use the current max `###-*` under `specs/` plus 1.
- The number must always increase regardless of `short-name`.
- If a number collision occurs, spec creation must fail.
- When creating a new spec, create and check out the same branch name (`###-short-name`) in `SeolMyeongTang-Spec`, `SeolMyeongTang`, `SeolMyeongTang-Server`, and `SeolMyeongTang-Infrastructure`.
- If branch creation or checkout fails in any target repository, spec creation must fail.
- New spec creation must also update `INDEX.md`.

## Commit Convention

- Commit messages must start with one of: `feat`, `chore`, `fix`, `refactor`, `docs`.

## Governance

- This constitution takes precedence over lower-level guidance.
- Exceptions must be documented and explicitly approved.
- Versioning follows SemVer.

## Usage

- Feature specs, plans, and task documents must either reference this constitution directly or include equivalent constraints.
- Exceptions and verification gaps must be recorded explicitly in plan/task documents.

**Version**: 1.1.0 | **Ratified**: TODO(RATIFICATION_DATE): original adoption date not found | **Last Amended**: 2026-04-12
