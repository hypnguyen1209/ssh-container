#!/bin/sh

CONF_DIR="/etc/dropbear"
SSH_KEY_DSS="${CONF_DIR}/dropbear_dss_host_key"
SSH_ECDSA="/etc/dropbear/dropbear_ecdsa_host_key"
SSH_ED2="/etc/dropbear/dropbear_ed25519_host_key"
SSH_KEY_RSA="${CONF_DIR}/dropbear_rsa_host_key"

# Check if conf dir exists
if [ ! -d ${CONF_DIR} ]; then
    mkdir -p ${CONF_DIR}
fi
chown root:root ${CONF_DIR}
chmod 755 ${CONF_DIR}

# Check if keys exists
if [ ! -f ${SSH_KEY_DSS} ]; then
    dropbearkey  -t dss -f ${SSH_KEY_DSS}
fi
chown root:root ${SSH_KEY_DSS}
chmod 600 ${SSH_KEY_DSS}

if [ ! -f ${SSH_KEY_RSA} ]; then
    dropbearkey  -t rsa -f ${SSH_KEY_RSA} -s 2048
fi
chown root:root ${SSH_KEY_RSA}
chmod 600 ${SSH_KEY_RSA}

if [ ! -f ${SSH_ED2} ]; then
    dropbearkey  -t ed25519 -f ${SSH_ED2}
fi
chown root:root ${SSH_ED2}
chmod 600 ${SSH_ED2}

if [ ! -f ${SSH_ECDSA} ]; then
    dropbearkey  -t ecdsa -f ${SSH_ECDSA}
fi
chown root:root ${SSH_ECDSA}
chmod 600 ${SSH_ECDSA}

exec /usr/sbin/dropbear -F
