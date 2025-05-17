#!/bin/bash

xbps-install -Syu
xbps-install git curl wget meson ninja cmake pkg-config
xbps-isntall ghostty qutebrowser

xbps-install nvidia
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

if grep GRUB_TIMEOUT /etc/default/grub; then
	# not found
	echo "GRUB_TIMEOUT=0" >> /etc/default/grub	
else
	# found
	sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
fi

if grep GRUB_CMDLINE_LINUX_DEFAULT /etc/default/grub; then
	# not found
	echo 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nvidia_drm modeset=1 nvidia-drm.modeset=1"' >> /etc/default/grub
else
	# found
	sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="(.*)/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nvidia_drm modeset=1 nvidia-drm.modeset=1 \1/' /etc/default/grub
fi

sed -i 's/GETTY_ARGS="(.*)/GETTY_ARGS="--autologin oliver \1' /etc/sv/agetty-tty1/conf

su -c "echo 'export LD_LIBRARY_PATH=/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig' >> ~/.bashrc" oliver

su -c "echo '
if [ -z \"\$DISPLAY\" ] && [ -n \"\$XDG_VTNR\" ] && [ \"\$XDG_VTNR\" -eq 1 ]; then
	WLR_RENDERER=vulkan exec ./dev/dwl/dwl
fi
' >> ~/.bash_profile" oliver

ln -s /etc/sv/elogind/ /var/service
ln -s /etc/sv/dbus/ /var/service
sv start dbus
sv start elogind
sv start sshd

mkdir /usr/include/EGL
mkdir /usr/include/KHR
mkdir /usr/include/GLES2

wget -P /usr/include/EGL https://registry.khronos.org/EGL/api/EGL/egl.h
wget -P /usr/include/EGL https://registry.khronos.org/EGL/api/EGL/eglext.h
wget -P /usr/include/EGL https://registry.khronos.org/EGL/api/EGL/eglplatform.h
wget -P /usr/include/KHR https://registry.khronos.org/EGL/api/KHR/khrplatform.h
wget -P /usr/include/GLES2 https://registry.khronos.org/OpenGL/api/GLES2/gl2.h
wget -P /usr/include/GLES2 https://registry.khronos.org/OpenGL/api/GLES2/gl2ext.h
wget -P /usr/include/GLES2 https://registry.khronos.org/OpenGL/api/GLES2/gl2platform.h

echo 'prefix=/usr
includedir=\${prefix}/include
libdir=\${prefix}/lib

Name: egl
Description: Userspace interface to kernel DRM services
Version: 1.5
Libs: -L\${libdir} -lEGL
Cflags: -I\${includedir}' > /usr/lib/pkgconfig/egl.pc

echo 'prefix=/usr
includedir=\${prefix}/include
libdir=\${prefix}/lib

Name: glesv2
Description: Userspace interface to kernel DRM services
Version: 1.2
Libs: -L\${libdir} -lGLESv2
Cflags: -I\${includedir}' > /usr/lib/pkgconfig/glesv2.pc

ln -s /usr/lib/libEGL.so.1 /usr/lib/libEGL.so
ln -s /usr/lib/libGLESv2.so.2.1.0 /usr/lib/libGLESv2.so

xbps-install libffi-devel expat-devel libxml2-devel graphviz doxygen libxslt xmlto libdrm-devel libxkbcommon-devel pixman-devel wayland-protocols mesa vulkan-loader-devel glslang libseat-devel libdisplay-info-devel libinput-devel

su -c 'mkdir ~/dev' oliver

su -c 'cd ~/dev
git clone https://gitlab.freedesktop.org/wayland/wayland.git
cd wayland
meson build/
yes | ninja -C build/ install' oliver

su -c 'cd ~/dev
git clone https://gitlab.freedesktop.org/wlroots/wlroots.git
cd wlroots
git checkout 0.18
meson setup build/ --wipe -D backends=libinput,drm -D renderers=vulkan,gles2
yes | ninja -C build/ install' oliver

su -c 'cd ~/dev
git clone https://codeberg.org/dwl/dwl.git
cd dwl
git checkout 0.7
make' oliver

