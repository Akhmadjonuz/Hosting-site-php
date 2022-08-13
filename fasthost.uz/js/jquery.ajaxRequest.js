(function ($) {
    function fnAjaxRequest(selector, container, options) {
        options = optionsFor(container, options);
        return this.on("click.ajaxRequest", selector, function (event) {
            var opts = options;
            if (!opts.container) {
                opts = $.extend({}, options);
                opts.container = "body";
            }
            handleClick(event, opts);
        });
    }

    function handleClick(event, container, options) {
        options = optionsFor(container, options);
        var link = event.currentTarget;
        var $link = $(link);
        if (link.tagName.toUpperCase() !== "A") {
            throw "$.fn.ajaxRequest or $.ajaxRequest.click requires an anchor element";
        }
        if (event.which > 1 || event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) {
            return;
        }
        if (/\.(?:jp(?:e?g|e|2)|gif|png|tiff?|bmp|ico|mp3)$/i.test(link.href) === true) {
            return;
        }
        if ($link.attr('target') !== undefined || $link.attr('download') !== undefined) {
            return;
        }
        if (location.protocol !== link.protocol || location.hostname !== link.hostname) {
            return;
        }
        if (link.href.indexOf("#") > -1 && stripHash(link) === stripHash(location)) {
            return;
        }
        if (event.isDefaultPrevented()) {
            return;
        }
        var defaults = {url: link.href, container: "a", target: link};
        var opts = $.extend({}, defaults, options);
        var clickEvent = $.Event("ajaxRequest:click");
        $link.trigger(clickEvent, [opts]);
        if (!clickEvent.isDefaultPrevented()) {
            ajaxRequest(opts);
            event.preventDefault();
            $link.trigger("ajaxRequest:clicked", [opts]);
        }
    }

    var pressingButton = [];

    function handlePressingButton(event) {
        pressingButton = $(event.currentTarget);
        pressingButton.attr("value", "\u041f\u043e\u0434\u043e\u0436\u0434\u0438\u0442\u0435...");
    }

    function handleSubmit(event, container, options) {
        options = optionsFor(container, options);
        var form = event.currentTarget;
        var $form = $(form);
        if (form.tagName.toUpperCase() !== "FORM") {
            throw "$.ajaxRequest.submit requires a form element";
        }
        var defaults = {
            type: ($form.attr("method") || "GET").toUpperCase(),
            url: $form.attr("action"),
            container: "form",
            target: form
        };

        if (defaults.type !== "GET" && window.FormData !== undefined) {

            defaults.data = new FormData(form);
            defaults.processData = false;
            defaults.contentType = false;
        } else {
            if ($form.find(":file").length) {
                return;
            }
            defaults.data = $form.serializeArray();
        }
        if (pressingButton.length > 0 && pressingButton.attr("name") !== undefined) {
            if (defaults.data instanceof FormData)
                defaults.data.append(pressingButton.attr("name"), pressingButton.attr("value"));
            else
                defaults.data.push({name: pressingButton.attr("name"), value: pressingButton.attr("value")});
        }
        ajaxRequest($.extend({}, defaults, options));
        event.preventDefault();
    }

    function ajaxRequest(options) {
        options = $.extend(true, {}, $.ajaxSettings, ajaxRequest.defaults, options);
        if ($.isFunction(options.url)) {
            options.url = options.url();
        }
        var hash = options.url.hash;
        var containerType = $.type(options.container);
        if (containerType !== "string") {
            throw "expected string value for 'container' option; got " + containerType;
        }
        var context = options.context = $(options.container);
        if (!context.length) {
            throw "the container selector '" + options.container + "' did not match anything";
        }
        if (!options.data) {
            options.data = {};
        }
        function fire(type, args, props) {
            if (!props) {
                props = {};
            }
            props.relatedTarget = options.target;
            var event = $.Event(type, props);
            context.trigger(event, args);
            return !event.isDefaultPrevented();
        }

        var timeoutTimer;
        options.beforeSend = function (xhr, settings) {
            if (settings.type !== "GET") {
                settings.timeout = 0;
            }

            if (!fire("ajaxRequest:beforeSend", [xhr, settings])) {
                return false;
            }
            if (settings.timeout > 0) {
                timeoutTimer = setTimeout(function () {
                    if (fire("ajaxRequest:timeout", [xhr, options])) {
                        xhr.abort("timeout");
                    }
                }, settings.timeout);
                settings.timeout = 0;
            }
            var url = settings.url;
            if (hash) {
                url.hash = hash;
            }
            options.requestUrl = url;
        };
        options.complete = function (xhr, textStatus) {
            if (timeoutTimer) {
                clearTimeout(timeoutTimer);
            }
            fire("ajaxRequest:complete", [xhr, textStatus, options]);
            fire("ajaxRequest:end", [xhr, options]);
        };
        options.error = function (xhr, textStatus, errorThrown) {
            var container = extractContainer("", xhr, options);
            var allowed = fire("ajaxRequest:error", [xhr, textStatus, errorThrown, options]);
            if (options.type === "GET" && textStatus !== "abort" && allowed) {
                locationReplace(container.url);
            }
        };
        options.success = function (data, status, xhr) {

            var previousState = ajaxRequest.state;
            var container = extractContainer(data, xhr, options);
            var url = container.url;
            if (hash) {
                url.hash = hash;
                container.url = url.href;
            }
            if (!container.contents) {
                locationReplace(container.url);
                return;
            }
            ajaxRequest.state = {
                id: options.id || uniqueId(),
                url: container.url,
                title: container.title,
                container: options.container,
                timeout: options.timeout
            };
            if (options.push || options.replace) {
                window.history.replaceState(ajaxRequest.state, container.title, container.url);
            }
            var blurFocus = $.contains(context, document.activeElement);
            if (blurFocus) {
                try {
                    document.activeElement.blur();
                } catch (e) {
                }
            }
            if (container.title) {
                document.title = container.title;
            }
            fire("ajaxRequest:beforeReplace", [container.contents, options], {
                state: ajaxRequest.state,
                previousState: previousState
            });
            context.html(container.contents);
            var autofocusEl = context.find("input[autofocus], textarea[autofocus]").last()[0];
            if (autofocusEl && document.activeElement !== autofocusEl) {
                autofocusEl.focus();
            }
            executeScriptTags(container.scripts);
            var scrollTo = options.scrollTo;
            if (hash) {
                var name = decodeURIComponent(hash.slice(1));
                var target = document.getElementById(name) || document.getElementsByName(name)[0];
                if (target) {
                    scrollTo = $(target).offset().top;
                }
            }
            if (typeof scrollTo === "number") {
                $(window).scrollTop(scrollTo);
            }
            fire("ajaxRequest:success", [data, status, xhr, options]);
        };

        if (!ajaxRequest.state) {
            ajaxRequest.state = {
                id: uniqueId(),
                url: window.location.href,
                title: document.title,
                container: options.container,
                timeout: options.timeout
            };
            window.history.replaceState(ajaxRequest.state, document.title);
        }
        abortXHR(ajaxRequest.xhr);
        ajaxRequest.options = options;
        var xhr = ajaxRequest.xhr = $.ajax(options);
        if (xhr.readyState > 0) {
            if (options.push && !options.replace) {
                cachePush(ajaxRequest.state.id, [options.container, cloneContents(context)]);
                window.history.pushState(null, "", options.requestUrl);
            }
            fire("ajaxRequest:start", [xhr, options]);
            fire("ajaxRequest:send", [xhr, options]);
        }
        return ajaxRequest.xhr;
    }

    function ajaxRequestReload(container, options) {
        var defaults = {url: window.location.href, push: false, replace: true, scrollTo: false};
        return ajaxRequest($.extend(defaults, optionsFor(container, options)));
    }

    function locationReplace(url) {
        window.history.replaceState(null, "", ajaxRequest.state.url);
        window.location.replace(url);
    }

    var initialPop = true;
    var initialURL = window.location.href;
    var initialState = window.history.state;
    if (initialState && initialState.container) {
        ajaxRequest.state = initialState;
    }
    if ("state" in window.history) {
        initialPop = false;
    }
    function onAjaxRequestPopstate(event) {
        if (!initialPop) {
            abortXHR(ajaxRequest.xhr);
        }
        var previousState = ajaxRequest.state;
        var state = event.state;
        var direction;
        if (state && state.container) {
            if (initialPop && initialURL === state.url) {
                return;
            }
            if (previousState) {
                if (previousState.id === state.id) {
                    return;
                }
                direction = previousState.id < state.id ? "forward" : "back";
            }
            var cache = cacheMapping[state.id] || [];
            var containerSelector = cache[0] || state.container;
            var container = $(containerSelector), contents = cache[1];
            if (container.length) {
                if (previousState) {
                    cachePop(direction, previousState.id, [containerSelector, cloneContents(container)]);
                }
                var popstateEvent = $.Event("ajaxRequest:popstate", {state: state, direction: direction});
                container.trigger(popstateEvent);
                var options = {
                    id: state.id,
                    url: state.url,
                    container: containerSelector,
                    push: false,
                    timeout: state.timeout,
                    scrollTo: false
                };
                if (contents) {
                    container.trigger("ajaxRequest:start", [null, options]);
                    ajaxRequest.state = state;
                    if (state.title) {
                        document.title = state.title;
                    }
                    var beforeReplaceEvent = $.Event("ajaxRequest:beforeReplace", {
                        state: state,
                        previousState: previousState
                    });
                    container.trigger(beforeReplaceEvent, [contents, options]);
                    container.html(contents);
                    container.trigger("ajaxRequest:end", [null, options]);
                } else {
                    ajaxRequest(options);
                }
                container[0].offsetHeight;
            } else {
                locationReplace(location.href);
            }
        }
        initialPop = false;
    }

    function abortXHR(xhr) {
        if (xhr && xhr.readyState < 4) {
            xhr.onreadystatechange = $.noop;
            xhr.abort();
        }
    }

    function uniqueId() {
        return (new Date).getTime();
    }

    function cloneContents(container) {
        var cloned = container.clone();
        cloned.find("script").each(function () {
            if (!this.src) {
                $._data(this, "globalEval", false);
            }
        });
        return cloned.contents();
    }

    function stripHash(location) {
        return location.href.replace(/#.*/, "");
    }

    function optionsFor(container, options) {
        if (container && options) {
            options = $.extend({}, options);
            options.container = container;
            return options;
        } else {
            if ($.isPlainObject(container)) {
                return container;
            } else {
                return {container: container};
            }
        }
    }

    function findAll(elems, selector) {
        return elems.filter(selector).add(elems.find(selector));
    }

    function parseHTML(html) {
        return $.parseHTML(html, document, true);
    }

    function extractContainer(data, xhr, options) {
        var obj = {}, fullDocument = /<html/i.test(data);
        var serverUrl = xhr.getResponseHeader("X-AJAX-REQUEST-URL");
        obj.url = serverUrl ? serverUrl : options.requestUrl;
        var $head, $body;
        if (fullDocument) {
            $body = $(parseHTML(data.match(/<body[^>]*>([\s\S.]*)<\/body>/i)[0]));
            var head = data.match(/<head[^>]*>([\s\S.]*)<\/head>/i);
            $head = head !== null ? $(parseHTML(head[0])) : $body;
        } else {
            $head = $body = $(parseHTML(data));
        }
        if ($body.length === 0) {
            return obj;
        }
        obj.title = findAll($head, "title").last().text();
        if (options.container) {
            if (options.container !== "body") {
                $body = findAll($body, options.container).first();
            }
            if ($body.length) {
                obj.contents = options.container === "body" ? $body : $body.contents();
                if (!obj.title) {
                    obj.title = $body.attr("title") || $body.data("title");
                }
            }
        } else {
            if (!fullDocument) {
                obj.contents = $body;
            }
        }
        if (obj.contents) {
            obj.contents = obj.contents.not(function () {
                return $(this).is("title");
            });
            obj.contents.find("title").remove();
            obj.scripts = findAll(obj.contents, "script[src]:not([data-noajax])").remove();
            obj.contents = obj.contents.not(obj.scripts);
        }
        if (obj.title) {
            obj.title = $.trim(obj.title);
        }
        return obj;
    }

    function executeScriptTags(scripts) {
        if (!scripts) {
            return;
        }
        var existingScripts = $("script[src]:not([data-noajax])");
        scripts.each(function () {
            var src = this.src;
            var matchedScripts = existingScripts.filter(function () {
                return this.src === src;
            });
            if (matchedScripts.length) {
                return;
            }
            var script = document.createElement("script");
            var type = $(this).attr("type");
            if (type) {
                script.type = type;
            }
            script.src = $(this).attr("src");
            document.head.appendChild(script);
        });
    }

    var cacheMapping = {};
    var cacheForwardStack = [];
    var cacheBackStack = [];

    function cachePush(id, value) {
        cacheMapping[id] = value;
        cacheBackStack.push(id);
        trimCacheStack(cacheForwardStack, 0);
        trimCacheStack(cacheBackStack, ajaxRequest.defaults.maxCacheLength);
    }

    function cachePop(direction, id, value) {
        var pushStack, popStack;
        cacheMapping[id] = value;
        if (direction === "forward") {
            pushStack = cacheBackStack;
            popStack = cacheForwardStack;
        } else {
            pushStack = cacheForwardStack;
            popStack = cacheBackStack;
        }
        pushStack.push(id);
        id = popStack.pop();
        if (id) {
            delete cacheMapping[id];
        }
        trimCacheStack(pushStack, ajaxRequest.defaults.maxCacheLength);
    }

    function trimCacheStack(stack, length) {
        while (stack.length > length) {
            delete cacheMapping[stack.shift()];
        }
    }

    function enable() {
        $.fn.ajaxRequest = fnAjaxRequest;
        $.ajaxRequest = ajaxRequest;
        $.ajaxRequest.enable = $.noop;
        $.ajaxRequest.disable = disable;
        $.ajaxRequest.click = handleClick;
        $.ajaxRequest.submit = handleSubmit;
        $.ajaxRequest.pressingButton = handlePressingButton;
        $.ajaxRequest.reload = ajaxRequestReload;
        $.ajaxRequest.defaults = {
            timeout: 650,
            push: true,
            replace: false,
            type: "GET",
            dataType: "html",
            scrollTo: 0,
            maxCacheLength: 20
        };
        $(window).on("popstate.ajaxRequest", onAjaxRequestPopstate);
    }

    function disable() {
        $.fn.ajaxRequest = function () {
            return this;
        };
    }

    if ($.event.props && $.inArray("state", $.event.props) < 0) {
        $.event.props.push("state");
    } else {
        if (!("state" in $.Event.prototype)) {
            $.event.addProp("state");
        }
    }
    $.support.ajaxRequest = window.history && window.history.pushState && window.history.replaceState && !navigator.userAgent.match(/((iPod|iPhone|iPad).+\bOS\s+[1-4]\D|WebApps\/.+CFNetwork)/);
    if ($.support.ajaxRequest) {
        enable();
    } else {
        disable();
    }
})(jQuery);