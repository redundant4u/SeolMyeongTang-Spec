#!/bin/sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

SPEC_REPO_NAME="SeolMyeongTang-Spec"
CLIENT_REPO_NAME="SeolMyeongTang"
SERVER_REPO_NAME="SeolMyeongTang-Server"
INFRA_REPO_NAME="SeolMyeongTang-Infrastructure"

SOURCE_FILE="$SCRIPT_DIR/constitution.md"
TARGET_DIR="$SCRIPT_DIR/.specify/memory"
TARGET_FILE="$TARGET_DIR/constitution.md"

MODE="all"

print_help() {
  cat <<EOF
Usage: $(basename "$0") [--sync-only | --clone-only | --help]

Bootstraps the SeolMyeongTang workspace from SeolMyeongTang-Spec.

Actions:
  - Synchronize constitution.md to .specify/memory/constitution.md
  - Clone workspace repositories into:
    - $CLIENT_REPO_NAME
    - $SERVER_REPO_NAME
    - $INFRA_REPO_NAME

Options:
  --sync-only   Synchronize constitution only
  --clone-only  Clone repositories only
  --help        Show this help message

Environment overrides:
  SEOLMYEONGTANG_REPO_URL
  SEOLMYEONGTANG_SERVER_REPO_URL
  SEOLMYEONGTANG_INFRASTRUCTURE_REPO_URL
EOF
}

parse_args() {
  if [ "$#" -gt 1 ]; then
    echo "Only one option may be provided." >&2
    print_help >&2
    exit 1
  fi

  case "${1:-}" in
    "")
      ;;
    --sync-only)
      MODE="sync-only"
      ;;
    --clone-only)
      MODE="clone-only"
      ;;
    --help|-h)
      print_help
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      print_help >&2
      exit 1
      ;;
  esac
}

sync_constitution() {
  if [ ! -f "$SOURCE_FILE" ]; then
    echo "Source file not found: $SOURCE_FILE" >&2
    exit 1
  fi

  mkdir -p "$TARGET_DIR"

  if [ -f "$TARGET_FILE" ] && cmp -s "$SOURCE_FILE" "$TARGET_FILE"; then
    echo "Constitution already synchronized: $TARGET_FILE"
    return
  fi

  cp "$SOURCE_FILE" "$TARGET_FILE"

  echo "Synchronized constitution:"
  echo "  from: $SOURCE_FILE"
  echo "  to:   $TARGET_FILE"
}

resolve_spec_repo_url() {
  if ! git -C "$SCRIPT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Workspace root is not a git repository: $SCRIPT_DIR" >&2
    exit 1
  fi

  SPEC_REPO_URL=$(git -C "$SCRIPT_DIR" config --get remote.origin.url || true)

  if [ -z "$SPEC_REPO_URL" ]; then
    echo "Unable to resolve remote.origin.url for $SPEC_REPO_NAME" >&2
    exit 1
  fi

  printf '%s\n' "$SPEC_REPO_URL"
}

derive_repo_url() {
  REPO_NAME=$1
  SPEC_REPO_URL=$2

  case "$SPEC_REPO_URL" in
    *"/$SPEC_REPO_NAME.git")
      printf '%s/%s.git\n' "${SPEC_REPO_URL%/$SPEC_REPO_NAME.git}" "$REPO_NAME"
      ;;
    *"/$SPEC_REPO_NAME")
      printf '%s/%s\n' "${SPEC_REPO_URL%/$SPEC_REPO_NAME}" "$REPO_NAME"
      ;;
    *)
      echo "Unable to derive repository URL from origin: $SPEC_REPO_URL" >&2
      exit 1
      ;;
  esac
}

clone_repo() {
  REPO_NAME=$1
  REPO_URL=$2
  TARGET_PATH="$SCRIPT_DIR/$REPO_NAME"

  if [ -d "$TARGET_PATH/.git" ]; then
    echo "Repository already cloned: $TARGET_PATH"
    return
  fi

  if [ -e "$TARGET_PATH" ]; then
    echo "Path exists but is not a git repository: $TARGET_PATH" >&2
    exit 1
  fi

  echo "Cloning $REPO_NAME from $REPO_URL with --depth 1"
  git clone --depth 1 "$REPO_URL" "$TARGET_PATH"
}

clone_workspace_repos() {
  SPEC_REPO_URL=$(resolve_spec_repo_url)

  CLIENT_REPO_URL=${SEOLMYEONGTANG_REPO_URL:-$(derive_repo_url "$CLIENT_REPO_NAME" "$SPEC_REPO_URL")}
  SERVER_REPO_URL=${SEOLMYEONGTANG_SERVER_REPO_URL:-$(derive_repo_url "$SERVER_REPO_NAME" "$SPEC_REPO_URL")}
  INFRA_REPO_URL=${SEOLMYEONGTANG_INFRASTRUCTURE_REPO_URL:-$(derive_repo_url "$INFRA_REPO_NAME" "$SPEC_REPO_URL")}

  clone_repo "$CLIENT_REPO_NAME" "$CLIENT_REPO_URL"
  clone_repo "$SERVER_REPO_NAME" "$SERVER_REPO_URL"
  clone_repo "$INFRA_REPO_NAME" "$INFRA_REPO_URL"
}

parse_args "$@"

if [ "$MODE" != "clone-only" ]; then
  sync_constitution
fi

if [ "$MODE" != "sync-only" ]; then
  clone_workspace_repos
fi
