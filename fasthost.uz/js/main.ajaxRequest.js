/**
 * Author - koder_alex
 * ISQ - 669906617
 * VK - https://vk.com/koder_alex
 * It is forbidden to give, sell, modify.
 */
var timeOut = 30000;
var selector = '#loading-content';
function startLoadingBar() {
    $('#loading-bar').show();
    $('#loading-bar').width((50 + Math.random() * 30) + "%");
    $(document).oneTime(timeOut, stopLoadingBar);
}
function stopLoadingBar() {
    $('#loading-bar').width("101%").delay(200).fadeOut(400, function () {
        $(this).hide();
    });
}

$(document).ajaxRequest('a:not([data-noajax])', selector, {timeout: timeOut});

$(document).on('submit', 'form:not([data-noajax])', function (event) {
    $.ajaxRequest.submit(event, selector, {timeout: timeOut});
});
$(document).on('click', '[type=submit]:not([data-noajax])', function (event) {
    $.ajaxRequest.pressingButton(event); // ловим нажатие кнопки
});
$(document).on('ajaxRequest:start', function () { // старт перехода
    startLoadingBar();
    stopMainTimer();
    /**
     * здесь можно прописать остальные возможности
     * к примеру
     * если открыта боковая панелька
     * то здесь можно вызвать закрытие панельки
     * чтоб потом вовремя перехода нечего не висело лишнего
     */
});
$(document).on('ajaxRequest:end', function () { // завершение перехода
    stopLoadingBar();
    styleFunc();
    startMainTimer();
    mainFunc();
    /**
     * после заверешения перехода можно установить
     * новые события на элементы
     */
});