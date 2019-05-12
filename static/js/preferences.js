var currentData;
var currentGift;
var values;

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
        priceLevel: $('#form-preference').find('select[id="price"]').val()
    };

    console.log(formData.ageLevel);

    $.ajax({
        type: 'POST', url: '/api/preferences', data: formData,
        success: function (data) {
            var resultElement = document.getElementById('result');
            if (data.length === 0) {
                resultElement.innerHTML = null;
                alert('0 gifts found :(');
            } else {
                var array = data,
                    listItems = array.reduce((result, item) => {
                        result += `<li>${item.id} ${item.name}</li>`;
                        return result;
                    }, '');
                resultElement.innerHTML = listItems;
            }
        },
        error: function (error) {
            console.error(error);
        }
    });
}

function newSuggestion(key, value) {
    // Ajax post
    $.ajax({
        type: 'POST', url: '/api/modifications', data: {
            key: key,
            value: value,
            dishName: currentData[currentGift].name,
            dishId: currentData[currentGift].id,
        },
        success: function (data) {
        },
        error: function () {
        }
    });
}
