# StateCheckModel

`StateCheck` 사용자의 상태체크를 기록하는 용도로 사용되는 모델

| Field           | Type       | Description    |          |
|:----------------|:-----------|:---------------|:---------|
| `id`            | `String`   | 유니크 아이디 (UUID) | Not NULL |
| `createdAt`     | `DateTime` | 생성일시           | Not NULL |
| `user_id`       | `String`   | 생성자 아이디 (UUID) | NULL     |
| `user_nickname` | `String`   | 생성자 닉네임        | NULL     |
| `state`         | `String`   | 체크한 상태 구분      | Not NULL |
| `content`       | `String`   | 체크한 상태 내용      | NULL     |
| `note`          | `String`   | 추가 작성된 메모 내용   | NULL     |

## Example JSON

```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "createdAt": "2023-10-27T10:00:00Z",
  "user_id": "user-1234-5678",
  "user_nickname": "홍길동",
  "state": "통증",
  "content": "허리 통증",
  "note": "아침에 일어날 때 평소보다 더 아픔"
}
```