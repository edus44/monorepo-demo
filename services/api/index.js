const {get} = require('@package/models')
const {set} = require('@package/tools')
const app = require('express')()

app.use((req,res)=>{
  res.send({api:1,msg:get()+set()})
})

app.listen(5000,()=>{
  console.log('listening 5000')
})