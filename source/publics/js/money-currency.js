function displayNumber2VND(number) {
    document.write( new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(number) );
}