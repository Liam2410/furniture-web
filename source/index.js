const express = require('express');

const app = express();
app.set('view engine', 'ejs');
app.use(express.static(__dirname + "/publics"));

const AdminRouter = require('./routers/AdminRouter');

app.use('/Admin', AdminRouter);

app.get('/', (req, res) => {
    return res.render("index");
})

const port = process.env.PORT || 8080;
app.listen(port, () => console.log(`http://localhost:${port}`));