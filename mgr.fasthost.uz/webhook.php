<html>

<head>
<title>WebHook | Fasthost.Uz</title>
<link rel="stylesheet" href="/style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.6.0/css/bulma.min.css" />
  <link href="/bootstrap/css/bootstrap.css?20180126124902" rel="stylesheet">
  <link href="/inc/style/style.css?20190126144433" rel="stylesheet">
  <script src="https://unpkg.com/vue/dist/vue.js"></script>
</head>

  <table>
<div class="title">
<h1 id="logo"><b><a href="https://Fasthost.uz">Fasthost.Uz </a>- Sayt menejeri</b></h1>
</div> 
         </table>
<body>
  <div class="container">
    <div id="app" class="section">
      <form :action="set_webhook" method="post" enctype="multipart/form-data">
        <label class="label"><font color="aqua">Tokenni kiriting</font></label>
        <p class="control">
          <input class="input" type="text" v-model="token" />
        </p>
        <label class="label"><font color="aqua">Host URL ni kiriting</font> <font color="red">( "https://" kerak emas )</font></label>
        <p class="control">
          <input class="input" type="text" v-model="host" />
        </p>
        <br/>
        <p style="color:blue">{{ sayt_ishlamayapti }}</p>
        <br/>
        
        <div class="control is-grouped">
          <p class="control">
<center><button class="button" name="submit">Webhookni sozlash</button></center>
          </p>
          <br/>
          <p class="control">
          </p>
        </div>
    </div>
  </div>
  <script>
    new Vue({
      el: '#app',
      data: {
token: 'tokenni kiriting',
host: 'misol uchun admin.Fasthost.uz/index.php',
      },
      computed: {
        get_webhook_info: function () {
          return 'https://api.telegram.org/bot' + this.token + '/getwebhookinfo'
        },
        set_webhook: function () {
          return 'https://api.telegram.org/bot' + this.token + '/setwebhook?url=' + this.host
        },
      }
    }

    )
  </script>
</body>

<footer><span>&copy; <b><a href="https://Fasthost.Uz">Fasthost.Uz</a></b> - 2020</span>
      </footer>
</html>