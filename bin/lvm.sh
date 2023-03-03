#!/bin/bash

# 1. pv
    # view
    # works
# 2. vg
    # view
    # works
# 3. lv
    # view
    # works

#===========================
# pv
#===========================
#view

TMP1=/tmp/tmp1
TMP2=/tmp/tmp2
TMP3=/tmp/tmp3
TMP4=/tmp/tmp4


fdisk -l | grep LVM | awk '{print $1}' > $TMP1
pvs | tail -n +2 | awk '{print $1}' > $TMP2

cat << EOF

==================== PV 생성 ==========================

########### PV VIEW ############
cat $TMP1 $TMP2 | sort | uniq -u 
################################

EOF

echo "-you want create PV choice the Volrum-"
echo -n "Vm choice : "
read Volrum

pvcreate $Volrum > /dev/null 2>&1
if [ $? -eq 0 ] ; then
    echo "[ OK ]  Physical volum $Volrum successfully created."
    pvs
else    
    echo "[ FAIL ]  Physical volum $Volrum fail created."
    exit 1
fi

echo -n "VG를 생성하시겠습니까? (y/n) : "
read QCVG

if [ $QCVG == "y" ] ; then
    continue
elif [ $QCVG == "n" ] ; then
    echo "VG를 생성하지 않고 종료합니다."
    exit 2
fi

#===========================
# vg
#===========================
#view
vgs | tail -n +2 | awk '{print $1}' > $TMP3
pvs > $TMP4
for i in $(cat $TMP3)
do
    sed -i "/$i/d" $TMP4
done

cat << EOF
==================== VG 생성 ==========================


################ PV LIST ##################
$(cat $TMP4)
###########################################

EOF

# vg work
echo -n "What is VG name? (ex:vg1) : "
read VGNAME

echo -n "plz write able to choice to PV list : "
read PVLIST

vgcreate $VGNAME $PVLIST
if [ $? -eq 0 ] ; then
    echo "[ OK ]  VG $VGNAME successfully created."
    cat << EOF

    ################ VG LIST ##################
    $(vgs | awk '$7 != '0' {print $0}')
    ###########################################

EOF
else
    echo "[ FAIL ]  VG $VGNAME fail created."
    exit 3
fi




#LV

cat << EOF
==================== LV 생성 ==========================

################ VG LIST ##################
$(vgs | awk '$7 != '0' {print $0}')
###########################################

EOF

#lv work
#lvcreate vg1 -n lv1 -L 500m
echo -n "plz write the LV create to VG name(ex:vg1) :  "
read VGLV

echo -n "create LV name : "
read LVNAME

echo -n "create LV SIZE : "
read LVSIZE

lvcreate $VGLV -n $LVNAME -L $LVSIZE

if [ $? -eq 0 ] ; then
    echo "[ OK ]  VG $LVNAME successfully created."
    cat << EOF
################ VG LIST ##################
$(lvs)
###########################################
EOF

else
    echo "[ FAIL ]  LV fail created."
    exit 4
fi
