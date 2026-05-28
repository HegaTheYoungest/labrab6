#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Ошибка: нужно указать один файл"
    echo "Использование: $0 <имя_файла>"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="report.txt"

if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Ошибка: файл '$INPUT_FILE' не найден"
    exit 1
fi

LINES=$(wc -l < "$INPUT_FILE")
WORDS=$(wc -w < "$INPUT_FILE")
CHARS=$(wc -c < "$INPUT_FILE")

{
    echo "         ОТЧЕТ О АНАЛИЗЕ ФАЙЛА"
    echo "Имя файла: $INPUT_FILE"
    echo "Количество строк:   $LINES"
    echo "Количество слов:    $WORDS"
    echo "Количество символов: $CHARS"
    echo "Отчет создан: $(date)"
} > "$OUTPUT_FILE"

echo "Готово! Отчет сохранен в $OUTPUT_FILE"
cat "$OUTPUT_FILE"
