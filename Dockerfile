ARG python_version=3.12-slim-bookworm
FROM python:${python_version}
RUN python -m venv saasvenv
ENV PATH=saasvenv/bin:$PATH
RUN python -m pip install --upgrade pip

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN apt-get update && apt-get install -y \
    # for postgres
    libpq-dev \
    # for Pillow
    libjpeg-dev \
    # for CairoSVG
    libcairo2 \
    # other
    gcc \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir mycode
COPY requirements.txt /tmp/requirements.txt
RUN  pip install -r /tmp/requirements.txt
WORKDIR mycode
copy ./src .
ARG PROJ_NAME="saas"
RUN chmod +x ./script.sh
RUN apt-get remove --purge -y \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
CMD ./script.sh