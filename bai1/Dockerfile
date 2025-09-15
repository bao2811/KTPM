# Base image
FROM archlinux:latest

# Cập nhật và cài đặt gói cần thiết
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm openssh tigervnc xorg-xinit xfce4 xfce4-goodies sudo && \
    pacman -Scc --noconfirm

# Tạo user bình thường
RUN useradd -m -s /bin/bash user && \
    echo "user:user" | chpasswd && \
    echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Tạo thư mục .vnc và password mặc định cho user
RUN mkdir -p /home/user/.vnc && \
    echo "123456" | vncpasswd -f > /home/user/.vnc/passwd && \
    chown -R user:user /home/user/.vnc && \
    chmod 600 /home/user/.vnc/passwd

# Copy xstartup script
COPY vnc/xstartup /home/user/.vnc/xstartup
RUN chown user:user /home/user/.vnc/xstartup && chmod +x /home/user/.vnc/xstartup

# Tạo SSH host keys
RUN ssh-keygen -A

# Copy script khởi động SSH + VNC
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose SSH và VNC
EXPOSE 22 5901

# Khởi động container
CMD ["/start.sh"]
