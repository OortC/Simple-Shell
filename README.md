# Simple-Shell

## 프로젝트 소개
`Simple-Shel`은 리눅스의 `bash` 쉘을 간단하게 구현한 프로젝트입니다.   
사용자로부터 명령어를 입력받아 파싱하고, 프로세스를 실행 및 제어하는 기능을 제공합니다.
또한 직접 구현한 빌트인 함수를 제공하고, 프로세스 간의 파이프 통신을 지원합니다.

### 주요 기능
- 기본적인 명령어 실행 (`ls`, `echo`, `pwd`, `cat`, ... )
- 파이프 (`|`) 지원
- 리다이렉션 (`>`, `>>`, `<`) 지원
- 히어독(heredoc, `<<`) 지원
- 환경 변수(`$HOME`, `$PATH` 등) 파싱 및 확장
- 빌트인 명령어 지원 (`cd`, `echo`, `pwd`, `export`, `unset`, `env`, `exit`)
- 시그널 처리 (`Ctrl + C`, `Ctrl + D`, `Ctrl + \`)
- 여러 명령어를 구분하는 세미콜론(`;`) 지원

## 실행 방법
```bash
# 저장소 클론
git clone https://github.com/OortC/Simple-Shell.git
cd minishell

# 빌드 (macOS만 지원함)
make

# 실행
./minishell
```

### 사용 예시
```bash
mongshell$ echo Hello World
Hello World
mongshell$ ls -l | grep mongshell

```

## 기술 스택 & 구현
- **언어:** C
- **시스템 콜:** `fork`, `execve`, `pipe`, `dup2`, `wait`, `signal`, `readline` 등
- **메모리 관리:** 동적 할당 최소화, 누수 방지
- **파싱:** 토큰화, 따옴표(`'`, `"`) 처리, 환경 변수 치환
- **프로세스 제어:** 부모-자식 프로세스 구조, 파이프 라인 연결

## 프로젝트 성과
- 리눅스 시스템 콜과 쉘 동작 원리에 대한 심화 이해
- 문자열 파싱과 토큰화 알고리즘 구현 경험
- 부모/자식 프로세스 구조와 파이프라인 연결 이해
- 시그널 처리, 메모리 관리 및 인터럽트 제어