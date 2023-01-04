FROM bwks/shazam:v0.1.63

# Build Args
ARG APP_NAME
ARG APP_USER
ARG APP_USER_ID
ARG APP_GROUP_ID
ARG APP_OWNER
ARG APP_OWNER_EMAIL
ARG HOME_DIR

# Create app user and group
RUN addgroup -S ${APP_USER} -g ${APP_GROUP_ID}  && adduser -u ${APP_USER_ID} -S ${APP_USER} -G ${APP_USER} -s /bin/ash

RUN cp /opt/shazam ${HOME_DIR}/shazam
RUN cp /opt/tailwindcss ${HOME_DIR}/tailwindcss
RUN cp /opt/reflex ${HOME_DIR}/reflex
RUN cp /opt/overmind ${HOME_DIR}/overmind

# Set directory ownership
RUN chown -R ${APP_USER_ID}:${APP_GROUP_ID} ${HOME_DIR}

WORKDIR ${HOME_DIR}

USER ${APP_USER}

RUN ./shazam init --name ${APP_NAME} --owner "${APP_OWNER}" --owner-email ${APP_OWNER_EMAIL}

EXPOSE 3000
CMD ["./overmind", "s", "-f", "Procfile"]