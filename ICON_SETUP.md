# Настройка иконки приложения "Карандаш"

## Быстрый способ (рекомендуется)

### Шаг 1: Скачайте иконку карандаша

Выберите один из вариантов:

**Вариант A: Flaticon (бесплатно с атрибуцией)**
1. Перейдите на https://www.flaticon.com/search?word=pencil
2. Выберите понравившуюся иконку карандаша
3. Скачайте в формате PNG, размер 512x512 или 1024x1024
4. Сохраните как `assets/images/app_icon.png`

**Вариант B: Icons8 (бесплатно)**
1. Перейдите на https://icons8.com/icons/set/pencil
2. Выберите иконку
3. Скачайте PNG 512x512 или больше
4. Сохраните как `assets/images/app_icon.png`

**Вариант C: Material Icons**
1. Используйте готовую иконку Material: https://fonts.google.com/icons?icon.query=pencil
2. Экспортируйте как PNG 1024x1024
3. Сохраните как `assets/images/app_icon.png`

### Шаг 2: Установите зависимости и сгенерируйте иконки

```bash
flutter pub get
flutter pub run flutter_launcher_icons
```

### Шаг 3: Перезапустите приложение

```bash
flutter run
```

## Альтернативный способ: Создание простой иконки

Если у вас установлен Python с библиотеками:

```bash
pip install pillow
python scripts/download_icon.py
```

Или используйте онлайн-генератор:
- https://appicon.co/
- https://www.favicon-generator.org/

## Проверка

После генерации иконок проверьте:

- **Android**: `android/app/src/main/res/mipmap-*/ic_launcher.png`
- **iOS**: `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
- **Web**: `web/icons/Icon-*.png` и `web/favicon.png`

## Требования к иконке

- Формат: PNG
- Размер: минимум 512x512, рекомендуется 1024x1024
- Фон: прозрачный или белый
- Форма: квадратная
- Содержание: карандаш или связанная с рисованием иконка

