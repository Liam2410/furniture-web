const express = require('express');
const Router = express.Router();

//Trang chủ
Router.get('/', (req, res) => {

    res.render('employee/index');
    
})

module.exports = Router;