FROM python:3
COPY subtractor.py /
ENTRYPOINT ["python", "/subtractor.py"]

