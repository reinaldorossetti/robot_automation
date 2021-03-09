FROM fedora:29

RUN dnf upgrade -y && dnf install -y python37

RUN pip3 install \
robotframework>=3.1.2 \
robotframework-seleniumlibrary>=4.1.0 \
robotframework-selenium2library>=3.0.0 \
robotframework-pageobjectlibrary>=1.0.2 \
robotframework-requests

