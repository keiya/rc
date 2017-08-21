export SCRIPT_PATH=$PWD/loginscript.sh
chmod +x loginscript.sh
bash ./org.keiyac.loginscript.plist.sh > org.keiyac.loginscript.plist
cp org.keiyac.loginscript.plist $HOME/Library/LaunchAgents/
launchctl load $HOME/Library/LaunchAgents/org.keiyac.loginscript.plist
