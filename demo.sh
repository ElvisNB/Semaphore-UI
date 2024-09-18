#!/bin/bash

# 循环创建用户 test1 到 test5
for i in {1..5}
do
  USERNAME="test${i}"

  # 创建用户
  sudo useradd "$USERNAME"

  # 输出提示信息
  echo "User $USERNAME has been created."

  # （可选）为每个用户设置密码
  echo "Setting a password for the user $USERNAME"
  echo "$USERNAME:password" | sudo chpasswd

  # （可选）创建用户的主目录
  sudo mkdir -p "/home/$USERNAME"
  sudo chown "$USERNAME":"$USERNAME" "/home/$USERNAME"

  # （可选）为用户设置默认shell
  sudo usermod -s /bin/bash "$USERNAME"
done

echo "All users have been created."
