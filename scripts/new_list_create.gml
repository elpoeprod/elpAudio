global.__newlist=15999+floor(random(16000))//$FFFFFF+random($FFFFFF)
global.__newlisti[global.__newlist]=0
var i;i=0
repeat(1000) {
global.__index[global.__newlist,i]=''//variable_global_array2_set('__index',global.__newlist,i,'')
i+=1
}
return global.__newlist
