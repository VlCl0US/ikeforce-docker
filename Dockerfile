# Используем базовый образ с Python 2
FROM python:2.7

# Устанавливаем необходимые пакеты
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev && \
    apt-get clean

# Устанавливаем Python-модули
RUN pip install --no-cache-dir \
    pyip \
    pycrypto \
    pyopenssl==17.2.0

# Копируем локальные файлы приложения в контейнер
COPY ikeforce /ikeforce

# Устанавливаем рабочую директорию
WORKDIR /ikeforce

# Указываем команду для запуска при старте контейнера
CMD ["python", "ikeforce.py"]
