// Вставка текста
function AddTXT(selector, bb) {
    $(document).ready(function() {
        var text = $(selector).val();
        $(selector).val(text+bb);
    });
}

/* Функции */

// Upload
function AddFile() {
    var count = $('input#file').length;
    if (count >= 10) {
        alert('Нельзя загружать более 10 файлов одновременно!');
    } else {
        $('#inpContFile').append('<input type="file" name="filename[]" id="file"><br/>');
    }
}
// Варианты в голосованиях
function AddAnswer() {
    var count = $('input#ans').length;
    if (count >= 25) {
        alert('Максимальное количество вариантов - 25!');
    } else {
        $('#inpContText').append('<input type="text" name="ans[]" id="ans"><br/>');
    }
}
// Обновление капчи
function UpCaptcha() {
    $('#captcha').attr('src', '/img/code.php?' + Math.random() );
}
// Drop-menu
function DropMenu(callback) {
    // Для всех ссылок, открывающих .wa-drop-menu
    $('[wa-drop-menu]').each(function(index, element) {
        var dropLink = $(element);
        dropLink.click(function() {
            var dropMenu = $($(element).attr('wa-drop-menu'));
            // Показываем/скрываем
            if (dropMenu.is(':visible')) {
                dropMenu.hide();
            } else {
                $('.wa-drop-menu:visible').hide(); // закрываем лишнее
                dropMenu.fadeIn(500);
            }
            // Скрываем при клике вне элемента
            dropMenu.clickNoThere(function() {
                if (dropMenu.is(':visible')) {
                    dropMenu.hide();
                }
            });
            // callback
            if ($.isFunction(callback)) {
                callback();
            }
            return false;
        });
    });
}

/* AJAX */

// Серфинг
function ajaxSerf() {
    var serf = $('#ajaxSerf');
    serf.actionThere(function() {
        var elem = $(this);
        $.get(
            '/js/data.php',
            {did: 1},
            function(data) {
                serf.htmlNew(data);
            }
        );
    });
}
// Уведомления
function ajaxNotifs() {
    var notifs = $('#notifications');
    notifs.actionThere(function() {
        $.ajax({
            type: 'GET',
            url: '/js/data.php',
            data: {did: 2},
            beforeSend: function() {
                notifs.html('Загрузка...');
            },
            success: function(data) {
                notifs.html(data);
            }
        });
    });
}
// Таймер
function startMainTimer() {
    // start
    $(document).everyTime(5000, 'MainTimer', function() { // каждые 5 сек
        // Серфинг
        ajaxSerf();
        // Панель уведомлений
        $.getJSON(
            '/js/data.php',
            {did: 3},
            function(data) {
                // Админка
                $('#admNotif').htmlNew(data[0]);
                // Уведомления
                $('#notNotif').htmlNew(data[1]);
                // Заявки в друзья
                $('#reqNotif').htmlNew(data[2]);
                // Почта
                $('#mailNotif').htmlNew(data[3]);
                if (data[3])
                    $('title').htmlNew('Сообщения (' + data[3] + ')');
                // Чат
                $('#chatNotif').htmlNew(data[4]);
            }
        );
        // Почта
        var mail = $('#ajaxMail');
        mail.actionThere(function() {
            var elem = $(this);
            $.get(
                '/page/mail/data.php',
                {id: mail.attr('data-user'), page: mail.attr('data-page-num')},
                function(data) {
                    mail.htmlNew(data);
                }
            );
        });
    });
}
// Выключение таймера
function stopMainTimer() {
    $(document).stopTime('MainTimer');
}
// Основная функция
function mainFunc() {

    // Drop-menu
    DropMenu(function() {

        // Быстрые уведомления
        ajaxNotifs();

    });

    // Позиция курсора в поле ввода сообщения
    $('[data-select-range]').selectRange();

    // Отключаем аякс навигацию на все формы, где есть капча
    $('form').each(function(index, element) {
        var form = $(element);
        if (form.find('img#captcha').length) {
            form.attr('data-noajax', 1);
        }
    });

}
// Стили
function styleFunc() {

    // Для .wa-nav-link
    $('.wa-nav-link').alignToWidth('a');

    // Для .wa-nav-foot
    $('.wa-nav-foot').alignToWidth('a');

}

/* Во время выполнения */

$(document).ready(function() {
    styleFunc();
});

$(function() {
    startMainTimer();
    mainFunc();
});