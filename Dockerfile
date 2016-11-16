FROM java:7
COPY . /hathi-client
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq krb5-user \
    && rm -rf /var/lib/apt/lists/* \
    && /hathi-client/bin/get.sh hadoop \
    && echo 'eval $(/hathi-client/bin/env.sh)' > /etc/profile.d/10-hathi.sh
ENTRYPOINT [ "/bin/bash", "-l" ]
