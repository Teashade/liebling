FROM ghost:3.22.1

# config options
# https://github.com/TryGhost/Ghost-CLI/blob/master/lib/tasks/configure/options.js
# https://github.com/docker-library/ghost/issues/77#issuecomment-321247145

ARG URL_SITE
ARG URL_ADMIN
ARG MAIL_NAME
ARG MAIL_HOST
ARG MAIL_PASS

RUN ghost config url $URL_SITE
RUN ghost config adminUrl $URL_ADMIN

RUN ghost config mail SMTP
RUN ghost config mailport 465
RUN ghost config mail $MAIL_NAME
RUN ghost config mailservice $MAIL_HOST
RUN ghost config mailuser $MAIL_USER
RUN ghost config mailpass $MAIL_PASS

RUN ls

COPY . /var/lib/ghost/content/themes/liebling

RUN echo 'update settings set value='liebling' where key = "activeTheme";' | sqlite3 /var/lib/ghost/content/data/ghost.db

CMD ["node", "current/index.js"]
