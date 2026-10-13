# SeolMyeongTang-Spec Workspace AGENTS

## Naming

- `SMT` and `smt` mean `SeolMyeongTang` across this workspace.
- Treat `smt` as the standard shorthand in code, specs, docs, branch names, and discussions.
- Do not rename existing `smt` usages unless the task explicitly requires it.

## Required Reading Order

- Read the tracked root `constitution.md` before starting any work. It is the
  canonical source of workspace principles; `.specify/memory/constitution.md`
  is its runtime copy for Spec Kit.
- After constitution changes or Spec Kit initialization, run
  `sh ./init-workspace.sh --sync-only` before invoking Spec Kit workflows.
- Update `constitution.md` when amending principles. If a tool edits only the
  runtime copy, reconcile the amendment into the root file and synchronize both
  before reporting completion.
- Read the target repository's local `AGENTS.md` before editing inside that repository.

## Common Working Rules

- Guidance-only work must stay within the requested guidance files. Create feature
  specs, modify product code, or change branches only when those actions are part
  of the authorized task scope.
- Before changing shared code or contracts, inspect their callers and consumers,
  including affected repositories, tests, and fixtures.
- Check existing helpers and installed dependencies before introducing replacements
  or new dependencies; explain why a new dependency is needed.
- Follow each repository's naming, formatting, and lint configuration. Limit
  formatting changes to files touched by the task.
- Read environment-specific values from the actual configuration and deployment
  files; do not maintain copies of current values in agent instructions.
- When environment variables change, update setup documentation with their purpose,
  required status, and defaults, together with affected consumers and deployment wiring.
- Keep credentials, tokens, and secret values out of documentation, committed files,
  logs, and client-facing error messages.

## Verification And Reporting

- Select the smallest relevant checks from the repository's actual scripts and
  tooling. Do not assume a test or lint command exists without checking it.
- Behavior bug fixes must include a minimal regression check that reproduces
  the original failure condition.
- Report the commands run and their results, plus skipped or blocked checks and
  their reasons. Do not describe an unexecuted check as passing.

## Spec Updates

- When unsure whether a change affects requirements, assume that it does and review the relevant spec files.
- Review affected `spec.md`, `data-model.md`, shared `contracts/`, side-specific
  contracts, `plan.md`, and `tasks.md` when present; update only impacted artifacts.

## Spec Kit Workflow

- Use installed Spec Kit skills or their equivalent commands: `speckit-specify`
  for new feature specs, `speckit-plan` for planning, `speckit-tasks` for task
  generation, and `speckit-implement` for generated tasks.
- If a workflow is not registered, look for its installed instructions in this
  workspace's `.agents/skills/`, `.claude/skills/`, or `.claude/commands/` and read
  the matching file. If instructions or required scripts/templates are missing,
  report the missing prerequisites before running that workflow; do not invent
  a replacement workflow or silently skip required steps.
- Use `speckit-clarify` only for unresolved requirements or when requested.
- Pass `SPECIFY_FEATURE_DIRECTORY=specs/<feature-name>` explicitly to
  `speckit-specify`; its default numbering setting does not enforce this policy.
- Do not use `create-new-feature.sh`'s sequential or timestamp generation for SMT
  features. Resolve template paths and branch placeholders to the actual feature
  name even when upstream templates contain numbered examples.
- For new feature branch hooks, pass `GIT_BRANCH_NAME=<feature-name>` explicitly.
- Before creating a feature, check directory collisions and all four repositories'
  working trees and branches. Complete the branch creation/checkouts required by
  the constitution; do not assume the skill creates them.
- On failure, stop and report any partial state; do not reset or discard user changes.
- Preserve existing artifact structure and links when editing specs.

## Authorization

- Live deployments, destructive data changes, secret-value changes, and Git history
  rewrites require explicit user authorization. Do not ask again within an already
  authorized scope.
