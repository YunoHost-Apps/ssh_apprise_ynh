#!/bin/bash
# Do not stop in case of errors.
# Prevents being blocked out of the server if this script fails.
set +e

SUBJECT="SSH connection on `hostname`"

BODY="
User:        $PAM_USER
User IP Host: $PAM_RHOST
Service/TTY:     $PAM_SERVICE / $PAM_TTY
Date:        `date -Iminutes`
Server:      `hostname`
"

RECIPIENTS="__RECIPIENTS__"

if [ "${PAM_TYPE:-}" = "open_session" ]; then
	__INSTALL_DIR__/venv/bin/apprise -t "${SUBJECT}" -b "${BODY}" "${RECIPIENTS//,/ }"
fi

exit 0