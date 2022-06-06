$(document).ready(function() {
    $('#orderCustomerDataTable').DataTable();

    $('#orderDataTable').DataTable({
        "order": [[ 4, "asc" ]]
    });

    $('#postDataTables').DataTable({
        "order": [[ 5, "desc" ]]
    });

    $('#allCustomerOrderDataTable').DataTable({
        "order": [[ 2, "asc" ]]
    });

});