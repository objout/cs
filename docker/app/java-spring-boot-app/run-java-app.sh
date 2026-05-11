#!/bin/bash

SERVER_NAME=app
readonly APP_HOME=/app
# config/ 后面的 / 必须有, 这样才能被 spring 识别为目录而非文件
readonly CONFIG_HOME="$APP_HOME/config/"
readonly LIB_HOME="$APP_HOME/lib"
readonly LOGS_HOME="$APP_HOME/logs"
readonly PID_FILE="$LOGS_HOME/application.pid"
readonly APP_MAIN_CLASS="app.jar"
readonly LOG_CONFIG="$CONFIG_HOME/logback-spring.xml"
readonly JAVA_RUN="-Dlogs.home=$LOGS_HOME -Dlogging.config=$LOG_CONFIG \
-Dspring.config.location=file:$CONFIG_HOME -Dspring.pid.file=$PID_FILE \
-Dspring.pid.fail-on-write-error=true"
readonly JAVA_OPTS="-server -Xms128m -Xmx320m $JAVA_RUN"
readonly JAVA="java"

mkdir -p $LOGS_HOME
mkdir -p $LIB_HOME
mkdir -p $CONFIG_HOME

JAVA_CMD="$JAVA $JAVA_OPTS -jar $APP_HOME/$APP_MAIN_CLASS"

sh -c "$JAVA_CMD"
