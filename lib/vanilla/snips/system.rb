{:name => "system",
 :content => "You're in the system snip now. You probably want to {edit_link system,edit} it though.",
 :main_template => %^
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
  <title>{title}</title>
  <script language="javascript" src="/javascripts/jquery.js"></script>
  <script language="javascript" src="/javascripts/jquery.autogrow-textarea.js"></script>
  <script language="javascript" src="/javascripts/vanilla.js"></script>
  <link rel="stylesheet" type="text/css" media="screen"  href="<%= url_to("system", "css.css") %>" />
</head>
<body>
  <div id="content">
    <div id="controls">
      <strong><a href="/">home</a></strong>, 
      <%= new_link %> ::
      <strong>{link_to_current_snip}</strong> &rarr; 
      {edit_link}
    </div>
    {current_snip}
  </div>
</body>
</html>^,
 :login_template => %^
<html>
  <head><link rel="stylesheet" type="text/css" media="screen" href="/system/css.css" /></head>
  <body id="login">
    <form action='' method='post'>
      <h1>Login</h1><p class="message">MESSAGE</p>
      <label>Name: <input type="text" name="login[username]"></input></label>
      <label>Password: <input type="password" name="login[password]"></input></label>
      <button>login</button>
    </form>
  </body>
</html>^,
 :css => %^
body {
  font-family: Helvetica;
  background-color: #666;
  margin: 0;
  padding: 0;
}

div#content {
  width: 800px;
  margin: 0 auto;
  background-color: #fff;
  padding: 1em;
}

div#controls {
font-size: 80%;
padding-bottom: 1em;
margin-bottom: 1em;
border-bottom: 1px solid #999;
}

textarea {
  width: 100%;
}

textarea.content {
  min-height: 10em;
}

pre {
  background-color: #f6f6f6;
  border: 1px solid #ccc;
  padding: 1em;
}

a.new {
  background-color: #f0f0f0;
  text-decoration: none;
  color: #999;
  padding: 0.2em;
}

a.new:hover {
  text-decoration: underline;
}^
}