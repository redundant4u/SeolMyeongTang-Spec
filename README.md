# SeolMyeongTang-Spec

SeolMyeongTang 작업은 이 저장소를 워크스페이스 루트로 사용하고, 그 하위에 클라이언트/서버/인프라 레포를 함께 두는 방식으로 진행한다.

## 시작하기

### 1. `uv` 설치

```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
uv --version
```

### 2. `spec-kit` 초기화

```sh
uvx --from git+https://github.com/github/spec-kit.git specify init .
```

### 3. init-workspace 스크립트 실행

아래 스크립트는 다음 작업을 자동으로 수행한다.

- `constitution.md`를 `.specify/memory/constitution.md`로 동기화
- `SeolMyeongTang`, `SeolMyeongTang-Server`, `SeolMyeongTang-Infrastructure`를 현재 `SeolMyeongTang-Spec` 하위에 `--depth 1`로 clone

```sh
./init-workspace.sh

./init-workspace.sh --sync-only
./init-workspace.sh --clone-only
./init-workspace.sh --help
```
