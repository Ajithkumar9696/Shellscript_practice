#!/bin/bash

echo "test";
echo "Number of args" $#
for ARGS in $*
do
  echo "arguments" $ARGS;
done
echo "argument1 " $1
echo "argument2 " $2
echo "file name " $0
echo "last operatrion status" $?
val=`expr 2 + 2 `
echo "Total value : $val"
a=1
b=10
if [ $# -gt 0 ]
then
  echo "arguments there "
fi
if [ $a -eq $b ]
then
  echo "equal"
else
  echo "not equal"
fi
while [ $a -lt $b ]
do
  echo "loop"
  a=`expr $a + 1`
  break 4
done
umount $1* >/dev/null
sleep 1
dd if=/dev/zero of=$1 bs=4096  count=1
sleep 1
(echo n;echo p;echo 1;echo;echo +64MB;echo n;echo p;echo 2;echo;echo;echo p;echo w) | fdisk $1
partition=1
device=$1$partition
mkfs.vfat $device
sync
sleep 1

partition=2
device=$1$partition
mkfs.ext3 $device
sync
sleep 1

setterm -bold on
echo "partition sucess"
setterm -bold off
