$(document).ready(function () {
    console.log('working!');
});

$("#submit-button").on("click", function () {
    submitForm();
});


function submitForm() {
    var formData = {
        ageLevel: $('#form-preference').find('select[id="age"]').val(),
        sex: $('#form-preference').find('select[id="sex"]').val(),
        priceLevel: $('#form-preference').find('select[id="price"]').val(),
    };

    console.log(formData.ageLevel);

    $.ajax({
        type: 'POST', url: '/api/preferences', data: formData,
        success: function (data) {
            if (data.length === 0) {
                alert('0 gifts found :(')
            } else {
                var array = data,
                    listItems = array.reduce((result, item) => {
                        result += `<li>${item.id} ${item.name}</li>`;
                        return result;
                    }, '');
                var resultElement = document.getElementById('result');
                resultElement.innerHTML = listItems;
            }
        },
        error: function (error) {
            console.error(error);
        }
    });
}