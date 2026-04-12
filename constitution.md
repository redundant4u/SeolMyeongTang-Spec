<!--
Sync Impact Report:
- Version change: 1.0.0
- Modified principles:
- Removed duplicated sync/source-of-truth rules from Operational Rules
- Restricted constitution references back to AGENTS.md-only guidance sources
- Removed explicit alternate-agent file mentions from constitution text
- Removed mandatory per-scope environment rule for client+server features
- Removed sections: None
- Templates requiring updates: None
- Follow-up TODOs:
  - TODO(RATIFICATION_DATE): original adoption date not found
-->

# SeolMyeongTang Spec Constitution

## Purpose

SeolMyeongTang의 서버/클라이언트/인프라 설계와 구현이 일관되게 유지되도록 하는
비협상 규칙을 정의한다.

## Scope

- `specs/` 하위 모든 스펙에 적용한다.
- `SeolMyeongTang`, `SeolMyeongTang-Server`, `SeolMyeongTang-Infrastructure` 워크스페이스 운영 규칙에 적용한다.
- 서버, 클라이언트, 인프라 작업 모두에 적용한다.

## Core Principles

### I. Spec-First (Non-Negotiable)

- 스펙은 단일 진실의 원천이다.
- 동작 변경 시 스펙을 먼저 수정한다.
- 승인 기준은 관찰 가능한 행위로 정의한다.

### II. Documentation Structure

- 스펙 문서는 `specs`에만 작성한다.
- 공통 스펙은 기능 루트의 `spec.md`를 기준으로 한다.
- client, server, infra 기능은 `client/`, `server/`, `infra/` 디렉터리로 분리한다.
- 구현 가이드와 작업 라우팅의 원본 지침은 `AGENTS.md`와 `.specify/memory/constitution.md`에 둔다.

### III. Repository Boundaries

- 워크스페이스 루트는 작업용 래퍼 디렉터리이며 구현 레포가 아니다.
- 제품 코드나 스펙 문서를 워크스페이스 루트에 직접 추가하지 않는다.
- 스펙, 계획, 태스크 문서는 `specs`에만 둔다.
- 클라이언트 구현 코드는 `SeolMyeongTang`에만 둔다.
- 서버 구현 코드는 `SeolMyeongTang-Server`에만 둔다.
- 인프라 구현 코드는 `SeolMyeongTang-Infrastructure`에만 둔다.
- 저장 위치가 애매한 변경은 먼저 어느 레포가 소유하는지 결정한 뒤 작업한다.
- 레포 내부 디렉터리/레이어링 규칙은 각 레포의 로컬 `AGENTS.md`가 정의한다.

### IV. Coding Standards

- 가독성을 최우선으로 한다.
- 명확한 변수/함수 이름을 사용한다.
- 주석보다 자기 문서화 코드를 선호한다.
- 포맷팅 규칙을 일관되게 유지한다.
- KISS: 작동하는 가장 단순한 해결책을 우선한다.
- DRY: 공통 로직은 함수/컴포넌트/유틸리티로 추출한다.
- YAGNI: 필요하기 전까지 기능을 만들지 않는다.
- 조기 최적화를 금지한다.

### V. Verification Requirements

- 핵심 비즈니스 로직 변경은 자동화 테스트를 반드시 포함한다.
- 핵심 사용자 흐름 변경은 E2E 테스트를 반드시 추가하거나 기존 E2E를 갱신한다.
- 테스트 추가가 현실적으로 불가능한 경우, 불가 사유와 대체 검증 방법을 명시한다.
- 핵심 로직과 핵심 사용자 흐름의 구체 범위는 각 레포의 로컬 `AGENTS.md`가 정의한다.

### VI. Backend Constraints

- RESTful API 구조를 따른다.
- 레포지토리/서비스/미들웨어 패턴을 준수한다.
- 응답 엔벨로프와 에러 코드는 반드시 정의한다.
- 인증/인가: JWT 검증과 역할 기반 접근 제어를 적용한다.
- 데이터베이스: 쿼리 최적화, N+1 방지, 페이지네이션을 필수로 한다.
- 트랜잭션 경계는 명시적으로 관리한다.
- 의미 있는 상태 변경은 감사 로그를 남긴다.

### VII. Frontend Constraints

- Tailwind-only: inline/custom CSS를 금지한다.
- 컴포넌트 패턴: 상속보다 합성을 우선한다.
- 복합 컴포넌트, Render Props, 커스텀 훅 패턴을 적절히 사용한다.
- 상태 관리 훅/비동기 데이터 페칭 훅/디바운스 훅 등은 재사용 가능한 형태로 작성한다.
- 공통 컴포넌트 단일 정의를 유지한다.
- 프론트엔드는 비즈니스 규칙을 소유하지 않는다.

### VIII. Safety and Explicitness

- 실패를 숨기지 않는다.
- 자동 submit/save를 금지한다.

## Operational Rules

- 스펙 폴더 이름은 `###-short-name` 형식을 사용하며 `###`는 전역 단일 시퀀스다.
- 새 스펙 번호는 `specs` 내 기존 `###-*`의 최대값 + 1을 사용한다.
- short-name은 번호 산정 기준이 아니며, 같은 short-name이라도 번호는 항상 증가해야 한다.
- 번호 충돌(중복 `###`)이 발생하면 스펙 생성은 실패해야 한다.
- 새 스펙 생성 시 동일한 브랜치명(`###-short-name`)을 `SeolMyeongTang-Spec`, `SeolMyeongTang`, `SeolMyeongTang-Server`에 모두 생성하고 해당 브랜치로 체크아웃해야 한다.
- 3개 레포 중 하나라도 브랜치 생성/체크아웃에 실패하면 스펙 생성을 실패로 처리한다.
- 새 스펙 생성 시 `INDEX.md`는 자동 갱신되어야 한다.

## Commit Convention

- 커밋 메시지는 `feat`, `chore`, `fix`, `refactor`, `docs` 중 하나로 시작한다.

## Governance

- 이 헌법은 다른 모든 지침보다 우선한다.
- 예외는 문서화하고 명시적 승인을 받아야 한다.
- 버전 규칙은 SemVer를 따른다.

## Usage

- Feature spec은 본 문서를 직접 참조하거나 동일한 제약을 포함해야 한다.
- plan/task 문서에서 예외 사항은 명시적으로 기록한다.

**Version**: 1.0.0 | **Ratified**: TODO(RATIFICATION_DATE): original adoption date not found | **Last Amended**: 2026-04-12
