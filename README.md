# Mi Band 10 Date Weekday Lua

Mi Band 10용 날짜·요일 전용 Lua 워치페이스 프로젝트입니다.

화면 전체를 검은 배경으로 유지하고, Helvetica 계열의 큰 흰색 글자로 다음 정보만 표시합니다.

```text
YYYY.MM.DD
요일
```

바이너리 클락은 이 프로젝트에 포함하지 않습니다. 바이너리 클락은 별도 저장소인 [mi-band-10-binary-dot-clock-lua](https://github.com/kris-atelier/mi-band-10-binary-dot-clock-lua)에서 관리합니다.

## 표시 원칙

- 날짜: `YYYY.MM.DD`
- 요일: 영어 3글자 약어 (`Sun`–`Sat`)
- 일요일 `Sun`: 빨간색, 토요일 `Sat`: 파란색, 평일: 흰색
- 글꼴: `Helvetica-Bold`
- 화면 방향: `90°` 또는 `270°`만 허용하며, 회전 후 위에서 아래로 날짜와 요일을 읽는 배치
- 검은 배경, 흰색 텍스트
- 날씨, 메시지, 걸음 수, 심박 수, 배터리 등은 표시하지 않음
- `dateDay` 데이터 소스를 갱신 트리거로 사용하고 날짜 값은 기기 로컬 시간에서 읽음

## 프로젝트 구성

```text
app/lua/main.lua             # Helvetica 날짜·요일 화면
src/preview.html             # 브라우저 미리보기
src/watchface-config.json    # 화면·폰트 설정
vendor/MiWatchLuaWatchfaces/ # m0tral Lua 예제 submodule
MiBand10DateWeekday.fprj     # Lua 앱을 가리키는 프로젝트 초안
```

예제 submodule까지 받으려면 다음처럼 clone합니다.

```text
git clone --recurse-submodules https://github.com/kris-atelier/mi-band-10-date-weekday-lua.git
```

이미 clone한 경우:

```text
git submodule update --init --recursive
```

## 현재 상태

이 프로젝트는 초기 개발본입니다. 공개된 예제에서 일반 Mi Band 10의 확정 `DeviceType`과 Helvetica 폰트 리소스 등록 방식이 함께 확인되지 않았으므로 `.fprj`에는 대상 식별자 placeholder를 남겼습니다. EasyFace/Mi Create의 실제 대상 기기 설정에서 `DeviceType`과 폰트 이름을 확인한 뒤 빌드해야 합니다.

검증되지 않은 `.face` 바이너리는 포함하지 않습니다.

미리보기 방향:

```text
src/preview.html?rotation=90
src/preview.html?rotation=270
```

참고 저장소:

- [m0tral/MiWatchLuaWatchfaces](https://github.com/m0tral/MiWatchLuaWatchfaces)
- [m0tral/EasyFace](https://github.com/m0tral/EasyFace)
