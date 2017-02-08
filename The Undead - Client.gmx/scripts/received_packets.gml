var buffer = argument[0];
var msgid = buffer_read(buffer, buffer_u8);

switch(msgid) {
   case 1: // Ping
      var time = buffer_read(buffer, buffer_u32);
      ping = current_time - time;
   break;
}
