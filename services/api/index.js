const {get} = require('@package/models')
const app = require('express')()

app.use((req,res)=>{
  res.send({api:1,msg:get()})
})

app.listen(5000,()=>{
  console.log('listening 5000')
})