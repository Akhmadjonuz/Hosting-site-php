(function($) {
    // Выполнить действие только, если есть элемент
    $.fn.actionThere = function(callback) {
        if (!this.length
         || !this.is(':visible'))
            return;
        if ($.isFunction(callback))
            callback();
    };
    // Вставка текста в место курсора
    $.fn.insertAtCaret = function(myValue) {
        if (!this.length)
            return;
        this.each(function() {
            var me = this;
            if (document.selection) { // IE
                me.focus();
                sel = document.selection.createRange();
                sel.text = myValue;
                me.focus();
            } else if (me.selectionStart || me.selectionStart == '0') { // Real browsers
                var startPos = me.selectionStart, endPos = me.selectionEnd, scrollTop = me.scrollTop;
                me.value = me.value.substring(0, startPos) + myValue + me.value.substring(endPos, me.value.length);
                me.focus();
                me.selectionStart = startPos + myValue.length;
                me.selectionEnd = startPos + myValue.length;
                me.scrollTop = scrollTop;
            } else {
                me.value += myValue;
                me.focus();
            }
        });
    };
    // Позиция курсора
    $.fn.getCursorPosition = function() {
        if (!this.length)
            return;
        var el = $(this).get(0);
        var pos = 0;
        if('selectionStart' in el) {
            pos = el.selectionStart;
        } else if('selection' in document) {
            el.focus();
            var Sel = document.selection.createRange();
            var SelLength = document.selection.createRange().text.length;
            Sel.moveStart('character', -el.value.length);
            pos = Sel.text.length - SelLength;
        }
        return pos;
    }
    // Установка курсора
    $.fn.selectRange = function(start, end) {
        if (!this.length)
            return;
        if(start === undefined) {
            start = $(this).val().length;
        }
        if(end === undefined) {
            end = start;
        }
        return this.each(function() {
            if('selectionStart' in this) {
                this.selectionStart = start;
                this.selectionEnd = end;
            } else if(this.setSelectionRange) {
                this.setSelectionRange(start, end);
            } else if(this.createTextRange) {
                var range = this.createTextRange();
                range.collapse(true);
                range.moveEnd('character', end);
                range.moveStart('character', start);
                range.select();
            }
        });
    };
    // Изменение содержимого элемента, если оно новое
    $.fn.htmlNew = function(content, callback) {
        if (!this.length)
            return;
        if (this.html() == content)
            return;
        if ($.isFunction(callback))
            callback(content);
        else
            this.html(content);
    };
    // Событие при клике вне элемента
    $.fn.clickNoThere = function(callback) {
        if (!this.length)
            return;
        var elem = this;
        $(document).click(function(event) {
            if ($(event.target).closest(elem).length)
                return;
            if ($.isFunction(callback))
                callback();
            event.stopPropagation();
        });
    };
    // Выравнивание элементов по одной ширине
    $.fn.alignToWidth = function(find) {
        if (!this.length)
            return;
        var element = this.find(find);
        element.css('width', (element.length / 6) + '%');
    };
    // Вставка BB-кода
    $.fn.bbCode = function(Open, Close) {
        if (!this.length)
            return;
        var cursor = this.getCursorPosition();
        this.insertAtCaret(Open + Close);
        this.focus(function() {
            $(this).selectRange(cursor + Open.length);
        });
        this.focus();
    };
})(jQuery);