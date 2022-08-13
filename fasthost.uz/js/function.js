// Вставка текста
function AddTXT(selector, bb) {
    $(document).ready(function() {
        var text = $(selector).val();
        $(selector).val(text+bb);
    });
}