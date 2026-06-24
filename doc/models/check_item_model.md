# CheckItemModel

`CheckItem` 사용자가 간편한 상태체크를 위해 등록하는 `StateCheck` 용 아이템

| Field       | Type       | Description    |          |
|:------------|:-----------|:---------------|:---------|
| `id`        | `String`   | 유니크 아이디 (UUID) | Not NULL |
| `createdAt` | `DateTime` | 생성일시           | Not NULL |
| `user_id`   | `String`   | 생성자 아이디 (UUID) | NULL     |
| `user_nickname` | `String`   | 생성자 닉네임        | NULL     |
| `type`      | `String`   | 상태 타입          | Not NULL |
| `item`      | `Array`    | 상태 입력 아이템      | NULL     |
| `note`      | `String`   | 추가 작성된 메모 내용   | NULL     |

## Example JSON

```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "createdAt": "2023-10-27T10:00:00Z",
  "user_id": "user-123-456",
  "type": "PAIN_CHECK",
  "item": [
    "코 감기약 1포",
    "가래 감기약 1포",
    "시럽 20g"
  ],
  "note": "A병원 처방 B약국 제조"
}
```

* `type` 항목에는 갯수 제한이 없음
* `item` 항목에는 갯수 제한이 없음
