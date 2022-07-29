FROM python:3.8-slim-bullseye

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY requirements-qa.txt ./

ENV VIRTUAL_ENV=/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt \
    requirements-qa.txt

COPY . .

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]