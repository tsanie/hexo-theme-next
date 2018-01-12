{% if theme.disqus.enable %}

  {% if theme.disqus.count  %}
    <!--<script id="dsq-count-scr" src="https://{{theme.disqus.shortname}}.disqus.com/count.js" async></script>-->
    <script type="text/javascript">
      $(function() {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '//disqus.com/next/config.json', true);
        xhr.timeout = 2500;
        xhr.onreadystatechange = function () {
          if (xhr.readyState === 4 && xhr.status === 200) {
            $('.post-meta .post-comments-count').show();
            var s = document.createElement('script');
            s.id = 'dsq-count-scr';
            s.src = 'https://{{theme.disqus.shortname}}.disqus.com/count.js';
            s.async = true;
            (document.head || document.body).appendChild(s);
          }
        };
        xhr.ontimeout = function () { xhr.abort(); };
        xhr.send(null);
      });
    </script>
  {% endif %}

  {% if page.comments %}
    <script type="text/javascript">
      var disqus_config = function () {
        this.page.url = '{{ page.permalink }}';
        this.page.identifier = '{{ page.path }}';
        this.page.title = '{{ page.title| addslashes }}';
      };

      function loadDisqus() {
        var d = document, s = d.createElement('script');
        s.src = 'https://{{theme.disqus.shortname}}.disqus.com/embed.js';
        s.setAttribute('data-timestamp', '' + +new Date());
        (d.head || d.body).appendChild(s);
      }

      $(function () {
        var contentVisibilityHeight = NexT.utils.getContentVisibilityHeight();

        if (contentVisibilityHeight <= $(document.body).height()) {
          loadDisqus();
        } else {
          $(window).on('scroll.disqus_scroll', function () {
            var scrollTop = $(window).scrollTop();
            if (scrollTop >= contentVisibilityHeight) {
              $(window).off('.disqus_scroll');
              loadDisqus();
            }
          });
        }
      });
    </script>
  {% endif %}

{% endif %}
