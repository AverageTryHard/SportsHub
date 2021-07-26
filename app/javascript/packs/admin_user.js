$(document).ready(function(){
    let table_rows = $('#users_table').children('tbody').children('tr.clickable-row')
    if (table_rows.length > 0) {
        let selected_row = table_rows.first()
        selected_row.addClass('active')
        update_user_profile_block(selected_row[0].id)
    }
    $('#users_table').on('click', '.clickable-row', function(event) {
        $(this).addClass('active').siblings().removeClass('active');
        $(this)
    });
});

function update_user_profile_block(user_id){
    $.get("/admin/users/" + user_id)
        .then( function(user) {
            let created_at = new Date(user.html['created_at'])
            $('#user_registered')[0].innerText = created_at.getDay() + '/' + created_at.getMonth()
                + '/' + created_at.getFullYear()
        } )
}