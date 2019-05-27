const {get} = require('@package/models')
const app = require('express')()

console.log('mgt rev1')

app.use((req,res)=>{
  res.send({mgt:1,msg:get()})
})

app.listen(5100,()=>{
  console.log('listening 5100')
})