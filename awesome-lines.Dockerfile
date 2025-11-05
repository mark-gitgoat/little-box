FROM python:3.9.11

WORKDIR /usr/src/app

RUN pip install awscli
RUN aws --version

RUN pip install httpx==0.15.3 # oh no we might have cves ;-)

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

RUN echo "Arnica is awesome!!!"

COPY . .

RUN cat /etc/os-release

CMD ["echo", "hello", "world"]

# ================ ARNICA SECURITY ANNOTATION BLOCK START ================
LABEL org.opencontainers.image.source="https://github.com/mark-gitgoat/little-box"
LABEL org.opencontainers.image.path="awesome-lines.Dockerfile"
# These automated labels, added by the security team, enhance traceability and security.
# For more details, see: https://docs.arnica.io/arnica-documentation/developers/adding-oci-tags-to-docker-images.
# To exclude this file, please replace this change with: #arnica-ignore followed by the dismissal reason.
# A message from the security team: Code comment added by Arnica to provide context for security scans. Do not remove.
# ================ ARNICA SECURITY ANNOTATION BLOCK END ================
