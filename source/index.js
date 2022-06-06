require('dotenv').config();
//thêm rate-limit
const express = require('express');
const bodyParser = require('body-parser');
const db = require('./db');
const expressSession = require('express-session');
const passport = require('passport');
const flash = require('connect-flash');
const LocalStrategy = require('passport-local').Strategy;
const Account = require('./models/AccountModel');
const checkLoggedIn = require('./middlewares/CheckLoggedIn');
const checkIsAdmin = require('./middlewares/CheckAdminRole');
const checkIsCustomer = require('./middlewares/CheckCustomerRole');


const app = express();


app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({extended: false}));
app.use(expressSession({secret: 'daohien'}))
app.use(express.static(__dirname + "/publics"));
app.use(express.static(__dirname + "/uploads"));
app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

const AdminRouter = require('./routers/AdminRouter');
const UserRouter = require('./routers/UserRouter');
const ErrorRouter = require('./routers/ErrorRouter');


app.use('/Admin', checkLoggedIn, checkIsAdmin, AdminRouter);
app.use('/User', checkLoggedIn, checkIsCustomer, UserRouter);
app.use('/Error', ErrorRouter);

/*
//sửa ở trên xuống đây
app.use('/Admin',  AdminRouter);
app.use('/User', UserRouter);
app.use('/Error', ErrorRouter);
*/

//Lưu user vào session
passport.serializeUser( (user, done) => {
    done(null, user);
})

passport.deserializeUser( async (user, done) => {
    user = await Account.getAccountByID(user.id);
    done(null, user);
})

passport.use('local-login', new LocalStrategy({
    usernameField : 'email',
    passwordField : 'password',

    passReqToCallback: true //truyền lại req để callback
}, async function (req, email, password, done) {

    if(!email || !password ) {
        return done(null, false, req.flash('message', 'Chưa điền đầy đủ thông tin')); 
    }

    user = await Account.getAccountByEmail(email);

    if(!user){
        return done(null, false, req.flash('message', 'Email hoặc mật khẩu sai'));
    }

    if(user.password != password){
        return done(null, false, req.flash('message', 'Email hoặc mật khẩu sai')); 
    }

    return done(null, user);
}))


app.get('/login', (req, res) => {
    return res.render('login');
})

app.post('/login', passport.authenticate('local-login', {
    failureFlash : true
}), (req, res) => {
    if (req.user.remember) {
      req.session.cookie.maxAge = 1000 * 60 * 3;
    }
    else {
      req.session.cookie.expires = false;
    }

    return res.redirect('/');
})

app.get('/register', (req, res) => {
    return res.render('register');
})

app.post('/register', async (req, res) => {

    if(!req.body.fullname || !req.body.email || !req.body.phone || !req.body.address || !req.body.birthday || !req.body.password || !req.body.repassword){
        return res.redirect('/error/not-found');
    }

    var fullname = req.body.fullname;
    var email = req.body.email;
    var phone = req.body.phone;
    var address = req.body.address;
    var birthday = req.body.birthday;
    var password = req.body.password;
    var repassword = req.body.repassword;
    var role = 'Customer';

    if (req.body.gender == true){
        var gender = 'Female';
    }
    else{
        var gender = 'Male';
    }

    if(password != repassword){
        return res.redirect('/register');
    }

    var result = await Account.addNewAccount(email, password, phone, fullname, role, gender, birthday, address);
    if(result){
        return res.redirect('/login');
    }
    return res.redirect('/error/internal-server-error');
})


app.get('/logout', (req, res) => {
    req.session.destroy();
    req.logout();
    res.redirect('/');
})

app.get('/', checkLoggedIn, (req, res) => {
    if(req.user.role == 'Admin'){
        return res.redirect('Admin/');
    }
    else if(req.user.role == 'Customer'){
        return res.redirect('User/');
    }
})

const port = process.env.PORT || 8080;
app.listen(port, () => console.log(`http://localhost:${port}`));