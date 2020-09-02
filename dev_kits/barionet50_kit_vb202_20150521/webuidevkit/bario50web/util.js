function PortCheck(I){
  d =parseInt(I.value, 10);
  if ( !( d<65536 && d>=0) ) {
    alert('Port value is out of range [0 - 65535]');
    I.value = I.defaultValue;
  }
}

function IntCheck(I){
  d =parseInt(I.value, 10);
  if ( !( d<65536 && d>=0) ) {
    alert('Value is out of range [0 - 65535]');
    I.value = I.defaultValue;
  }
}

function ByteCheck(I){
  d =parseInt(I.value, 10);
  if ( !( d<256 && d>=0) ) {
    alert('Value is out of range [0 - 255]');
    I.value = I.defaultValue;
  }
}

function IPCheck(I){
  d =parseInt(I.value, 10);
  if ( !(d<256 && d>=0) ) {
    alert('IP value is out of range [0 - 255]');
    I.value = I.defaultValue;
  }
}

function IP0to254(I){
  d =parseInt(I.value, 10);
  if ( !(d<255 && d>=0) ) {
    alert('IP value is out of range [0 - 254]');
    I.value = I.defaultValue;
  }
}

function IP1to254(I){
  d =parseInt(I.value, 10);
  if ( !(d<255 && d>0) ) {
    alert('IP value is out of range [1 - 254]');
    I.value = I.defaultValue;
  }
}

function CheckMetric(I){
  d =parseInt(I.value, 10);
  if ( !(d<16 && d>=0) ) {
    alert('Hop count value is out of range [0 - 15]');
    I.value = I.defaultValue;
  }
}

function netMaskCheck(I){
  d =parseInt(I.value, 10);
  if( !(d==0 || d==128 || d==192 || d==224 || d==240 || d==248 || d==252 || d==254 || d==255 )) {
    alert('Incorrect NetMask value!!!');
    I.value = I.defaultValue;
  }
}

function netMaskCheck3(I){
  d =parseInt(I.value, 10);
  if( !(d==0 || d==128 || d==192 || d==224 || d==240 || d==248 || d==252 || d==254 )) {
    alert('Incorrect NetMask value!!!');
    I.value = I.defaultValue;
  }
}

function Go(x) {
   parent.frames[3].location.href = x;
   document.forms[0].reset();
   document.forms[0].elements[0].blur();
}
