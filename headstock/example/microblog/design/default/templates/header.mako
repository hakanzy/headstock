<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="en" lang="en" xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Language" content="en" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

    <title>Microblogging with CherryPy, Kamaelia, headstock and amplee</title>

    <link rel="stylesheet" type="text/css" href="/css/reset-fonts-grids.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/themes/flora/flora.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/themes/flora/flora.tabs.css" media="screen" />

    <script type="application/javascript" src="/js/jquery-1.2.6.js"></script>        
    <script type="application/javascript" src="/js/ui/ui.core.js"></script>      
    <script type="application/javascript" src="/js/ui/ui.tabs.js"></script>      
    <script type="application/javascript" src="/js/microblog.js"></script>      
    <script type="application/javascript">
      $(document).ready(function() {
        $('#container-1 > ul').tabs();
        $("#container-1 > ul").tabs("select", '${selectedview}');

      });
    </script>
  </head>