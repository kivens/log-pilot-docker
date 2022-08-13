FROM registry.cn-hangzhou.aliyuncs.com/acs/log-pilot:0.9.7-filebeat
COPY filebeat.tpl /pilot/filebeat.tpl
COPY config.filebeat /pilot/config.filebeat
