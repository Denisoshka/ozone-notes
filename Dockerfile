# Базовый образ
FROM python:3.13-slim

# Установить системные зависимости
RUN apt-get update && apt-get install -y \
    libpq-dev gcc && \
    apt-get clean

# Копировать файл зависимостей
COPY requirements.txt /app/requirements.txt

# Установить зависимости Python
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt

# Копировать приложение
COPY . /app

# Указать команду запуска
CMD ["python3", "main.py"]

