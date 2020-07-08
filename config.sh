#!/bin/bash

[ -z "${URL_SITE}" ] && ghost config url ${URL_SITE};

ghost config --mail SMTP;
ghost config --mailport 465;
[ -z "${MAIL_NAME}" ] && ghost config --mail ${MAIL_NAME};
[ -z "${MAIL_HOST}" ] && ghost config --mailservice ${MAIL_HOST};
[ -z "${MAIL_USER}" ] && ghost config --mailuser ${MAIL_USER};
[ -z "${MAIL_PASS}" ] && ghost config --mailpass ${MAIL_PASS};

node current/index.js
