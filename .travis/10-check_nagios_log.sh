#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  10.  C H E C K I N G   N A G I O S   L O G"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  10.1 \$NAGIOS_LOG"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 10.1.1 #NAGIOS_LOG=1"
echo "----------------------------------------"
sudo sed -i'' 's/^NAGIOS_LOG=1/#NAGIOS_LOG=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^#NAGIOS_LOG=1/NAGIOS_LOG=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 10.1.2 NAGIOS_LOG=2"
echo "----------------------------------------"
sudo sed -i'' 's/^NAGIOS_LOG=1/NAGIOS_LOG=2/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^NAGIOS_LOG=2/NAGIOS_LOG=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 10.1.3 NAGIOS_LOG=\"wrong\""
echo "----------------------------------------"
sudo sed -i'' 's/^NAGIOS_LOG=1/NAGIOS_LOG="wrong"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^NAGIOS_LOG="wrong"/NAGIOS_LOG=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 10.1.4 NAGIOS_LOG=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/^NAGIOS_LOG=1/NAGIOS_LOG=""/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^NAGIOS_LOG=""/NAGIOS_LOG=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 10.1.5 NAGIOS_LOG=0"
echo "----------------------------------------"
sudo sed -i'' 's/^NAGIOS_LOG=1/NAGIOS_LOG=0/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^NAGIOS_LOG=0/NAGIOS_LOG=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf










echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  10.2 \$NAGIOS_LOGFILE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 10.2.1 #NAGIOS_LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\""
echo "----------------------------------------"
sudo sed -i'' "s|^NAGIOS_LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\"|#NAGIOS_LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOGFILE" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOGFILE" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOGFILE" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' "s|^#NAGIOS_LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\"|NAGIOS_LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 10.2.2 NAGIOS_LOGFILE=\"\""
echo "----------------------------------------"
sudo sed -i'' "s|^NAGIOS_LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\"|NAGIOS_LOGFILE=\"\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOGFILE" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOGFILE" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOGFILE" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' "s|^NAGIOS_LOGFILE=\"\"|NAGIOS_LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 10.2.3 NAGIOS_LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound\""
echo "----------------------------------------"
sudo sed -i'' "s|^NAGIOS_LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\"|NAGIOS_LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"

mds_recreate_datadir
if ! expect_err_msg "mysqldump-secure.nagios.log.notfound" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"

mds_recreate_datadir
if ! expect_err_msg "mysqldump-secure.nagios.log.notfound" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"


mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"

mds_recreate_datadir
if ! expect_err_msg "mysqldump-secure.nagios.log.notfound" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"


sudo sed -i'' "s|^NAGIOS_LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound\"|NAGIOS_LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf






echo
echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  10.3 \$NAGIOS_LOG_CHMOD"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 10.3.1 #NAGIOS_LOG_CHMOD=\"0644\""
echo "----------------------------------------"
echo
sudo sed -i'' 's/^NAGIOS_LOG_CHMOD="0644"/#NAGIOS_LOG_CHMOD="0644"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG_CHMOD" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG_CHMOD" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG_CHMOD" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^#NAGIOS_LOG_CHMOD="0644"/NAGIOS_LOG_CHMOD="0644"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 10.3.2 NAGIOS_LOG_CHMOD=\"0644a\""
echo "----------------------------------------"
echo
sudo sed -i'' 's/^NAGIOS_LOG_CHMOD="0644"/NAGIOS_LOG_CHMOD="0644a"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG_CHMOD" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG_CHMOD" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG_CHMOD" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^NAGIOS_LOG_CHMOD="0644a"/NAGIOS_LOG_CHMOD="0644"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 10.3.3 NAGIOS_LOG_CHMOD=\"abc\""
echo "----------------------------------------"
echo
sudo sed -i'' 's/^NAGIOS_LOG_CHMOD="0644"/NAGIOS_LOG_CHMOD="abc"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG_CHMOD" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG_CHMOD" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG_CHMOD" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^NAGIOS_LOG_CHMOD="abc"/NAGIOS_LOG_CHMOD="0644"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 10.3.4 NAGIOS_LOG_CHMOD=\"\""
echo "----------------------------------------"
echo
sudo sed -i'' 's/^NAGIOS_LOG_CHMOD="0644"/NAGIOS_LOG_CHMOD=""/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG_CHMOD" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG_CHMOD" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$NAGIOS_LOG_CHMOD" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^NAGIOS_LOG_CHMOD=""/NAGIOS_LOG_CHMOD="0644"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 10.3.5 NAGIOS_LOG_CHMOD=\"444\""
echo "----------------------------------------"
echo
sudo sed -i'' 's/^NAGIOS_LOG_CHMOD="0644"/NAGIOS_LOG_CHMOD="444"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo chmod 0644 ${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo chmod 0644 ${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo chmod 0644 ${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo chmod 0644 ${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo chmod 0644 ${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo chmod 0644 ${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo chmod 0644 ${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo chmod 0644 ${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo chmod 0644 ${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo chmod 0644 ${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo chmod 0644 ${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log


sudo sed -i'' 's/^NAGIOS_LOG_CHMOD="444"/NAGIOS_LOG_CHMOD="0644"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf








echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [10] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [10] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
