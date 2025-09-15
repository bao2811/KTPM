#!/bin/bash

# Khởi động SSH daemon
/usr/sbin/sshd

# Khởi động VNC server cho user
su - user -c "vncserver :1 -geometry 1280x800 -depth 24"

# Giữ container luôn chạy
tail -f /dev/null
