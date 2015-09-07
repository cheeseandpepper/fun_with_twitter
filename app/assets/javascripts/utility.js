function Utility () {}

Utility.addCommasToNumbers = function(numberString) {
  numberString += '';
  numberArray = numberString.split('.');
  integers = numberArray[0];
  decimals = numberArray.length > 1 ? '.' + x[1] : '';
  
  var regex = /(\d+)(\d{3})/;
  
  while (regex.test(integers)) {
    integers = integers.replace(regex, '$1' + ',' + '$2');
  }
  
  return integers + decimals;
}
