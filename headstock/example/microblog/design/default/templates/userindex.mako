<%!
    from microblog.utils import format_date
%>
<%include file="/header.mako"/>
  <body>
    <div id="doc" class="yui-t3">
      <div id="hd">
	<span id="headerlogo">speak up</span>
      </div>
      <div id="bd">
	<div id="yui-main">
	%if member is not UNDEFINED and member:
	  <div class="bubble">
	    <blockquote>
	      <p>${unicode(member.atom.entry.content)}</p>
	    </blockquote>
	    <cite><strong>${unicode(member.atom.entry.author.name)}</strong> 
	      on ${format_date(str(member.atom.entry.published))}</cite>
	  </div>
	%endif
	</div>
      </div>
      <div id="ft">
	<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">
	  <img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/80x15.png"/>
	</a>
	<br />
	2008 Sylvain Hellegouarch
      </div>
    </div>
  </body>
<%include file="/footer.mako"/>
