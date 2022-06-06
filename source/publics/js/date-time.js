function displayOrderDatetime(datetimeData) {
    const datetime = new Date(datetimeData);
    let datetimeList = datetime.toLocaleString().split(',');
    document.write(`Ngày${datetimeList[1]}, ${datetimeList[0]}`);
}

function displayCommentDatetime(datetimeData){
    const daysOfWeek = ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7', 'Chủ nhật'];
    const datetime = new Date(datetimeData);

    let datetimeList = datetime.toLocaleString().split(',');
    document.write(`${daysOfWeek[datetime.getDay()]}, ngày${datetimeList[1]}, ${datetimeList[0]}`);
}

function displayChangeStatusDateTime(datetimeData){
    const datetime = new Date(datetimeData);
    let datetimeList = datetime.toLocaleString().split(',');
    document.write(`${datetimeList[1]} lúc ${datetimeList[0]}`);
}

function displayBirthday(datetimeData){
    const datetime = new Date(datetimeData);
    let datetimeList = datetime.toLocaleString().split(',');
    document.write(`${datetimeList[1]}`);
}

function displayAddProductDatetime(datetimeData) {
    const datetime = new Date(datetimeData);
    let datetimeList = datetime.toLocaleString().split(',');
    document.write(`Ngày${datetimeList[1]}, ${datetimeList[0]}`);
}

function displayAddPostDatetime(datetimeData) {
    const datetime = new Date(datetimeData);
    let datetimeList = datetime.toLocaleString().split(',');
    document.write(`Ngày ${datetimeList[1]} lúc ${datetimeList[0]}`);
}

function displayAddPostDatetime2(datetimeData) {
    const datetime = new Date(datetimeData);
    let datetimeList = datetime.toLocaleString().split(',');
    document.write(`${datetimeList[0]}, ${datetimeList[1]}`);
}


function displayJoinDatetime(datetimeData){
    const datetime = new Date(datetimeData);
    let datetimeList = datetime.toLocaleString().split(',');
    document.write(`Ngày${datetimeList[1]}, ${datetimeList[0]}`);
}

function displayHistoryDatetime(datetimeData) {
    const datetime = new Date(datetimeData);
    let datetimeList = datetime.toLocaleString().split(',');
    document.write(`ngày ${datetimeList[1]} lúc ${datetimeList[0]}`);
}

function displayHistoryDate(datetimeData) {
    const datetime = new Date(datetimeData);
    let datetimeList = datetime.toLocaleString().split(',');
    document.write(`ngày ${datetimeList[1]}`);
}