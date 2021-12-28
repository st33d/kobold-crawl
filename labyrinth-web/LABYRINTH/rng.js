// RNG toolkit
var rng = {
  // shuffle an array
  shuffle: function (v){
    for(var j, x, i = v.length; i; j = parseInt(Math.random() * i), x = v[--i], v[i] = v[j], v[j] = x);
    return v;
  },
  // multipurpose whole random numbers
  value: function(min, max){// max exclusive
    if(max){
      min = min || 0;
    } else if(min){
      max = min;
      min = 0;
    } else {
      // coin flip
      min = 0;
      max = 2;
    }
    return Math.floor(Math.random() * (max - min) + min);
  },
  // pick an item in the list and return it
  pick: function(list){
    return list[this.value(list.length)];
  },
  // remove an item in the list and return it
  pluck: function(list){
    if(list.length == 0) return null;
    return list.splice(this.value(list.length), 1)[0];
  }
};