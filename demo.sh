#!/bin/bash

# 定义一个数组，包含要删除的用户列表
USERS=(test1 test2 test3 test4 test5)

# 循环删除用户
for USERNAME in "${USERS[@]}"
do
  echo "Starting to remove user $USERNAME..."

  # 删除用户及其主目录和邮件目录
  # -r 选项用于删除用户的主目录和邮件目录
  # -f 选项用于强制删除，即使用户当前已登录
  sudo userdel -rf "$USERNAME"

  # 检查用户是否成功删除
  if [ $? -eq 0 ]; then
    echo "User $USERNAME has been removed."
  else
    echo "Failed to remove user $USERNAME"
  fi
done

echo "All specified users have been removed."
