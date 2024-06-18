#!/bin/bash
# Script to manage a Service in Linux

# Service name
service_name="snapd"

# Systemctl service command options
echo "Enter you choice for service: start | stop | restart | status"

read -r user_input

case $user_input in
start)
    echo "Starting $service_name "
    systemctl start $service_name
    echo "$service_name started"
    ;;
stop)
    echo "Stoppig $service_name"
    systemctl stop $service_name
    echo "$service_name stopped"
    ;;
restart)
    echo "Restarting $service_name"
    systemctl restart $service_name
    echo "$service_name restarted"
    ;;
status)
    echo "Status of service $service_name"
    systemctl status $service_name
    ;;
*)
    echo "Enter correct option: start , stop , restart , status "
    ;;
esac
