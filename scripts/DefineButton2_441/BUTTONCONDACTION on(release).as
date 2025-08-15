on(release){
   _global.getCurrentAirtower().send("s","lb#sgm",[2],"str",_global.getCurrentShell().getCurrentServerRoomId());
   _parent._parent.hardcoreMode = true;
   _parent._parent.startGame2();
   _parent.start_screen._visible = false;
}
