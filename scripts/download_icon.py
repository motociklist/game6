"""
Скрипт для загрузки иконки карандаша
Требует установки: pip install requests pillow
"""

import requests
from io import BytesIO
from PIL import Image, ImageDraw
import os

def create_simple_pencil_icon():
    """Создает простую иконку карандаша"""
    size = 1024
    img = Image.new('RGBA', (size, size), (255, 255, 255, 0))
    draw = ImageDraw.Draw(img)

    # Рисуем карандаш
    # Корпус карандаша (желтый/оранжевый)
    body_points = [
        (200, 400), (800, 400), (750, 600), (250, 600)
    ]
    draw.polygon(body_points, fill=(255, 200, 0, 255))

    # Наконечник (серый)
    tip_points = [
        (750, 400), (850, 300), (850, 700), (750, 600)
    ]
    draw.polygon(tip_points, fill=(150, 150, 150, 255))

    # Ластик (розовый)
    eraser_points = [
        (200, 400), (250, 400), (250, 600), (200, 600)
    ]
    draw.polygon(eraser_points, fill=(255, 100, 150, 255))

    # Металлическое кольцо
    draw.rectangle([240, 420, 260, 580], fill=(200, 200, 200, 255))

    # Сохраняем
    output_path = 'assets/images/app_icon.png'
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    img.save(output_path)
    print(f"Иконка создана: {output_path}")

if __name__ == '__main__':
    create_simple_pencil_icon()

