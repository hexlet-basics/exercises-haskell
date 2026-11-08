Реализуйте функцию `parseQuantity` с сигнатурой `String -> Either String Integer`. Она получает текстовое количество товара и возвращает допустимое целое количество либо сообщение об ошибке.

Используйте `Text.Read.readMaybe` с явно выбранным результатом `Maybe Integer`. Различайте следующие исходы.

- Если прочитать целое число не удалось, верните `Left "Invalid integer"`.
- Если число прочитано, но находится вне диапазона от `1` до `100` включительно, верните `Left "Quantity out of range"`.
- Если число находится в допустимом диапазоне, верните его через `Right`.

Используйте стандартные правила `readMaybe` для `Integer`. Они допускают пробельные символы вокруг числа, скобки и шестнадцатеричную запись. Например, `"0x10"` обозначает количество `16`. Не вводите дополнительное ограничение только на десятичные цифры.

Примеры показывают точные результаты и сообщения.

```haskell
parseQuantity "12"     -- Right 12
parseQuantity " 12 "   -- Right 12
parseQuantity "(12)"   -- Right 12
parseQuantity "0x10"   -- Right 16
parseQuantity "0"      -- Left "Quantity out of range"
parseQuantity "-3"     -- Left "Quantity out of range"
parseQuantity "- 3"    -- Left "Quantity out of range"
parseQuantity "12x"    -- Left "Invalid integer"
parseQuantity "+3"     -- Left "Invalid integer"
parseQuantity ""       -- Left "Invalid integer"
```

Пустая строка и строка только из пробельных символов не содержат числа. Посторонний текст после числа тоже означает ошибку записи. Сообщения должны совпадать с указанными строками, включая регистр букв.
