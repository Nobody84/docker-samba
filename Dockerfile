FROM dperson/samba

# install wsdd2
RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add python3 curl && \
    curl https://raw.githubusercontent.com/christgau/wsdd/v0.5/src/wsdd.py -o wsdd.py && \
    apk del curl

COPY entrypoint.sh /

EXPOSE 137/udp 138/udp 139 445

HEALTHCHECK --interval=60s --timeout=15s \
            CMD smbclient -L \\localhost -U % -m SMB3

VOLUME ["/etc", "/var/cache/samba", "/var/lib/samba", "/var/log/samba",\
            "/run/samba"]

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]