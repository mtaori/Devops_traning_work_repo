#!/bin/bash
LOG_FILE="/var/log/syslog.log"
REPORT_FILE="/home/einfochips/Desktop/report_$(date +'%Y%m%d_%H%M%S').txt"  
THRESHOLD_CPU=90  
THRESHOLD_MEM=90  

if [ "$(id -u)" != "0" ]; then
    echo "Script must be run as root."
    exit 1
fi
dependencies=( "awk" "grep" "sed" "df" "top" "netstat" "service" "ping" )
for cmd in "${dependencies[@]}"; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "$cmd command not found. Please install $cmd."
        exit 1
    fi
done
monitor_cpu() {
    echo "### CPU Usage ###" >> "$REPORT_FILE"
    top -b -n 1 | head -n 20 >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}
monitor_memory() {
    echo "### Memory Usage ###" >> "$REPORT_FILE"
    free -h >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}
monitor_disk() {
    echo "### Disk Usage ###" >> "$REPORT_FILE"
    df -h >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}
monitor_network() {
    echo "### Network Statistics ###" >> "$REPORT_FILE"
    netstat -s >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}
capture_top_processes() {
    echo "### Top Processes ###" >> "$REPORT_FILE"
    ps aux --sort=-%cpu | head -n 10 >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}
parse_logs() {
    echo "### System Log Analysis ###" >> "$REPORT_FILE"
    tail -n 100 /var/log/syslog | grep -i "error\|failed" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}
check_services() {
    echo "### Service Status ###" >> "$REPORT_FILE"
    service apache2 status >> "$REPORT_FILE"
    service mysql status >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}
check_connectivity() {
    echo "### Connectivity Check ###" >> "$REPORT_FILE"
    ping -c 5 google.com >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}
send_alert() {
    subject="ALERT: High resource utilization on $(hostname)"
    # mail -s "$subject" mtaori197@gmail.com < "$REPORT_FILE"
}
generate_report_filename() {
    REPORT_FILE="/home/einfochips/Desktop/system_report_$(date +'%Y%m%d_%H%M%S').txt"
}

generate_report() {
    generate_report_filename  # Call the function to generate new filename
    echo "### System Monitoring Report ###" > "$REPORT_FILE"
    monitor_cpu
    monitor_memory
    monitor_disk
    monitor_network
    capture_top_processes
    parse_logs
    check_services
    check_connectivity
    echo "Report generated on $(date)" >> "$REPORT_FILE"
}
main() {
    generate_report
    cpu_usage=$(top -b -n 1 | awk '/^%Cpu/{print 100 -$8}')
    mem_usage=$(free | awk '/Mem/{print $3/$2 * 100.0}')
    
    if (( $(bc <<< "$cpu_usage >= $THRESHOLD_CPU") )); then
        send_alert
    fi
    
    if (( $(bc <<< "$mem_usage >= $THRESHOLD_MEM") )); then
        send_alert
    fi
}
main
exit 0
