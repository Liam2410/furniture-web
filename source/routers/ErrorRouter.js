const express = require('express');
const Router = express.Router();

Router.get('/not-found', (req, res) => {
    return res.render('error/index', {headeTitle: "Oops!", errorTitle: "404 - Không tìm thấy trang", 
    errorMessage: "Trang bạn đang tìm kiếm có thể đã bị xóa, đổi tên hoặc tạm thời không có sẵn."});
})

Router.get('/internal-server-error', (req, res) => {
    return res.render('error/index', {headeTitle: "Oops!", errorTitle: "500 - Lỗi máy chủ", 
    errorMessage: "Server bất ngờ gặp lỗi và không thể hoàn thành yêu cầu của bạn."});
})

Router.get('/unauthorized-error', (req, res) => {
    return res.render('error/index', {headeTitle: "Oops!", errorTitle: "401 - Không có quuyền", 
    errorMessage: "Bạn không có quyền truy cập trang này."});
})

module.exports = Router;