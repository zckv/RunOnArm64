FROM arm64v8/rockylinux:8

RUN dnf install -y python3.11 python3.11-pip git rpm-build rpmdevtools jq

RUN pip3 install poetry pyinstaller


