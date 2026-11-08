# exercises-haskell

[![Github Actions Status](https://github.com/hexlet-basics/exercises-haskell/actions/workflows/Docker.yml/badge.svg)](https://github.com/hexlet-basics/exercises-haskell/actions)

Курс Haskell как второго языка для программиста на любом языке. Знакомство с функциональным программированием не требуется. В 38 уроках мы изучаем чистые функции, типы, рекурсию, функции как значения, каррирование, сопоставление с образцом, обработку ожидаемых отказов, ленивые вычисления и консольный ввод и вывод.

## Структура

Уроки находятся в _modules/_. Русская теория, условие и метаданные лежат в _ru/README.md_, _ru/EXERCISE.md_ и _ru/data.yml_. Файлы _Solution.hs_ и _Spec.hs_ содержат эталонное решение и Hspec-проверки. Платформа удаляет текст решения между `-- BEGIN` и `-- END` при подготовке упражнения.

Общий модуль _lib/ExerciseTest.hs_ помогает проверять ввод, вывод и результат действия `IO`. Раннер ограничивает время проверки упражнения тридцатью секундами. Переменная `HASKELL_TEST_TIMEOUT` позволяет изменить этот предел для локального прогона.

## How to contribute

- Discuss the project on Telegram: <https://t.me/hexletcommunity/12>

## Develop

```bash
# setup
make
# run
make compose
# check
make ci-check

# run all exercise tests
make compose-test

# run linters and validators
make compose-code-lint
make compose-description-lint
make compose-schema-validate
```

Образ устанавливает GHC и Hspec. Для локальной проверки без копирования уроков в образ можно собрать его цель `toolchain` и примонтировать репозиторий. Полный прогон `make ci-check` собирает образ курса и выполняет проверки метаданных, разметки, общего кода и всех упражнений.

## Hexlet

[![Hexlet Ltd. logo](https://raw.githubusercontent.com/Hexlet/assets/master/images/hexlet_logo128.png)](https://hexlet.io/?utm_source=github&utm_medium=link&utm_campaign=exercises-haskell)

This repository is created and maintained by the team and the community of Hexlet, an educational project. [Read more about Hexlet](https://hexlet.io/?utm_source=github&utm_medium=link&utm_campaign=exercises-haskell).
