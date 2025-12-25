# Инструкция по созданию иконки карандаша

## Вариант 1: Использование готовой иконки

1. Скачайте иконку карандаша (PNG, 1024x1024) с одного из сайтов:
   - https://www.flaticon.com/search?word=pencil
   - https://icons8.com/icons/set/pencil
   - https://www.iconfinder.com/search?q=pencil

2. Сохраните файл как `assets/images/app_icon.png`

3. Выполните команды:
   ```bash
   flutter pub get
   flutter pub run flutter_launcher_icons
   ```

## Вариант 2: Создание иконки через онлайн-генератор

1. Перейдите на https://www.favicon-generator.org/ или https://appicon.co/
2. Загрузите изображение карандаша
3. Скачайте сгенерированные иконки
4. Поместите основной файл (1024x1024) в `assets/images/app_icon.png`
5. Выполните команды из Варианта 1

## Вариант 3: Использование Material Icons

Если хотите использовать встроенную иконку Flutter, можно создать простую иконку программно.

