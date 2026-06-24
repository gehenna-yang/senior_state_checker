# UserModel

`StateCheck` 사용자의 상태체크를 기록하는 용도로 사용되는 모델

| Field       | Type       | Description    |                   |
|:------------|:-----------|:---------------|:------------------|
| `id`        | `String`   | 유니크 아이디 (UUID) | Not NULL          |
| `createdAt` | `DateTime` | 생성일시           | Not NULL          |
| `password`  | `String`   | 비밀번호           | Not NULL          |
| `nickname`  | `String`   | 사용자 닉네임        | Not NULL          |
| `position`  | `String`   | 사용자 직책/역할      | default `general` |
| `note`      | `String`   | 추가 작성된 메모 내용   | NULL              |

## Example JSON

```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "createdAt": "2023-10-27T10:00:00Z",
  "password": "hashed_password_string",
  "nickname": "홍길동",
  "position": "관리자",
  "note": null
}
```

## Position Enum
* general // 일반 사용자
* guadian // 보호자
