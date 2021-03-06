var currentGiftID;
var currentGiftName;
var values;

$(document).ready(function () {
    console.log('working!');
});

$("#submit-button").on("click", function () {
    submitForm();
});

$("#suggestion-div").css({display: "none"});
$("#gifts-container").css({display: "none"});
$("#age-row").css({display: "none"});
$("#sex-row").css({display: "none"});
$("#price-row").css({display: "none"});
$("#categories").css({display: "none"});

$("#suggestion-submit-button").on("click", function () {
    var formData = {
        giftId: currentGiftID,
        giftName: currentGiftName,
        key: $("#suggestion-key").val(),
        value: $("#suggestion-value").val()
    };

    console.log(formData);
    $.ajax({
        type: 'POST', url: '/api/modifications', data: formData,
        success: function () {
            console.log('Suggestion sent')
        },
        error: function (error) {
            console.error(error);
        }
    });

});

function submitForm() {
    hide_suggestion();
    var formData = {
        ageLevel: $('#form-preference').find('select[id="age"]').val(),
        sex: $('#form-preference').find('select[id="sex"]').val(),
        priceLevel: $('#form-preference').find('select[id="price"]').val(),
        catFashion: $('#form-preference').find('select[id="fashion"]').val(),
        catMusic: $('#form-preference').find('select[id="music"]').val(),
        catBook: $('#form-preference').find('select[id="book"]').val(),
        catGames: $('#form-preference').find('select[id="games"]').val(),
        catMovies: $('#form-preference').find('select[id="movies"]').val(),
        catGadgets: $('#form-preference').find('select[id="gadgets"]').val(),
        catSport: $('#form-preference').find('select[id="sport"]').val(),
        catCosmetics: $('#form-preference').find('select[id="cosmetics"]').val(),
        catToy: $('#form-preference').find('select[id="toy"]').val(),
    };


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
                        result += `<li class="suggested-gift" onclick="show_suggestion(${item.id}, '${item.name}')">${item.name}</li>`;
                        return result;
                    }, '');
                resultElement.innerHTML = listItems;
            }
            $('#gifts-container').css({display: "block"});
        },
        error: function (error) {
            console.error(error);
        }
    });
}

function show_suggestion(id, name) {
    currentGiftID = id;
    currentGiftName = name;
    $("#giftName").text(name);
    $("#suggestion-div").css({display: "block"});
}

function hide_suggestion() {
    $("#suggestion-div").css({display: "none"});
}

function chooseSecondSelector() {
    ageSelectors =
        '<option value="kid">Dziecko</option>' +
        '<option value="teen">Nastolatek</option>' +
        '<option value="adult">Dorosły</option>' +
        '<option value="elder">Senior</option>';

    sexSelectors =
        '<option value="man">Mężczyzna</option>' +
        '<option value="woman">Kobieta</option>';

    priceSelectors =
        '<option value="cheap">Tani</option>' +
        '<option value="medium">Średni</option>' +
        '<option value="expensive">Drogi</option>';

    booleanSelectors =
        '<option value="YES">Tak</option>' +
        '<option value="NO">Nie</option>';

    var secondSelector = document.getElementById('suggestion-value');
    var firstSelector = $("#suggestion-key").val();
    var options;
    switch (firstSelector) {
        case 'sex':
            options = sexSelectors;
            break;
        case 'price-level':
            options = priceSelectors;
            break;
        case 'age-level':
            options = ageSelectors;
            break;
        default:
            options = booleanSelectors;
            break;
    }
    secondSelector.innerHTML = options;

}

function showAge() {
        $("#showAgeButton").css({display: "none"});
        $("#age-row").css({display: "block"});
}

function showSex() {
        $("#showSexButton").css({display: "none"});
        $("#sex-row").css({display: "block"});
}

function showPrice() {
        $("#showPriceButton").css({display: "none"});
        $("#price-row").css({display: "block"});
}

function showCategories() {
        $("#showCategoriesButton").css({display: "none"});
        $("#categories").css({display: "block"});
}