<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html
  PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   
      <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=iso-8859-1" />
      <title><% nvram_get("router_name"); %> - Wireless</title>
      <link type="text/css" rel="stylesheet" href="style.css" /><script type="text/JavaScript" src="common.js">{}</script><script language="JavaScript">
var EN_DIS = '<% nvram_else_match("wl_gmode","-1","0","1"); %>';
function SelWL(num,F) {
	if ( num == 0)
		I = '0';
	else
		I = '1';
	wl_enable_disable(F,I);
}
function wl_enable_disable(F,I) {
	EN_DIS = I;
	if (F.wl_ssid && F.wl_channel)
	{
	if( I == "0"){
		choose_disable(F.wl_ssid);
		choose_disable(F.wl_channel);
		<% nvram_match("wl_mode", "ap", "choose_disable(F.wl_closed[0]);"); %>
		<% nvram_match("wl_mode", "ap", "choose_disable(F.wl_closed[1]);"); %>
	} else {
		choose_enable(F.wl_ssid);
		choose_enable(F.wl_channel);
		<% nvram_match("wl_mode", "ap", "choose_enable(F.wl_closed[0]);"); %>
		<% nvram_match("wl_mode", "ap", "choose_enable(F.wl_closed[1]);"); %>
	}
	}
}

function vifs_add_submit(F,I) {
	F.interface.value = I;
	F.change_action.value = "gozila_cgi";
	F.submit_button.value = "Wireless_Basic";
	F.submit_type.value = "add_vifs";
 	F.action.value = "Apply";
	F.submit();
}
function vifs_remove_submit(F,I) {
	F.interface.value = I;
	F.change_action.value = "gozila_cgi";
	F.submit_button.value = "Wireless_Basic";
	F.submit_type.value = "remove_vifs";
 	F.action.value = "Apply";
	F.submit();
}

function to_submit(F) {
	if(F.wl_ssid)
	if(F.wl_ssid.value == ""){
		alert("You must input a SSID!");
		F.wl_ssid.focus();
		return false;
	}
	F.change_action.value = "gozila_cgi";
	F.submit_button.value = "Wireless_Basic";
	F.submit_type.value = "save";
	F.submit_button.value = "Saved";
	F.action.value = "Apply";
	F.submit();
}
function init() {
	wl_enable_disable(document.wireless,'<% nvram_else_match("wl_gmode","-1","0","1"); %>');
}
</script></head>
   <body class="gui" onload="init()"> <% showad(); %>
      <div id="wrapper">
         <div id="content">
            <div id="header">
               <div id="logo">
                  <h1><% show_control(); %></h1>
               </div>
               <div id="menu">
                  <div id="menuMain">
                     <ul id="menuMainList">
                        <li><a href="index.asp">Setup</a></li>
                        <li class="current"><span>Wireless</span><div id="menuSub">
                              <ul id="menuSubList">
                                 <li><span>Basic Settings</span></li>
                                 <li><a href="Wireless_radauth.asp">Radius</a></li>
                                 <li><a href="WL_WPATable.asp">Wireless Security</a></li>
                                 <li><a href="Wireless_MAC.asp">MAC Filter</a></li>
                                 <li><a href="Wireless_Advanced.asp">Advanced Settings</a></li>
                                 <li><a href="Wireless_WDS.asp">WDS</a></li>
                              </ul>
                           </div>
                        </li>
			<% nvram_invmatch("sipgate","1","<!--"); %>
			<li><a href="Sipath.asp">SIPatH</a></li>
                        <% nvram_invmatch("sipgate","1","-->"); %>
                        <li><a href="Firewall.asp">Security</a></li>
                        <li><a href='<% support_elsematch("PARENTAL_CONTROL_SUPPORT", "1", "Parental_Control.asp", "Filters.asp"); %>'>Access Restrictions</a></li>
                        <li><a href="Forward.asp">Applications&nbsp;&amp;&nbsp;Gaming</a></li>
                        <li><a href="Management.asp">Administration</a></li>
                        <li><a href="Status_Router.asp">Status</a></li>
                     </ul>
                  </div>
               </div>
            </div>
            <div id="main">
               <div id="contents">
                  <form name="wireless" action="apply.cgi" method="<% get_http_method(); %>">
		  <input type="hidden" name="submit_button" value="Wireless_Basic" />
		  <input type="hidden" name="submit_type" />
		  <input type="hidden" name="change_action" />
		  <input type="hidden" name="interface" />
		  <input type="hidden" name="action" value="Apply" />
		        <% show_wireless(); %>
		    <br /><div class="submitFooter"><input type="button" name="save_button" value="Save Settings" onClick="to_submit(this.form)" /><input type="reset" value="Cancel Changes" /></div>
                  </form>
               </div>
            </div>
            <div id="statusInfo">
               <div class="info">Firmware: <% get_firmware_version(); %></div>
               <div class="info">Time: <% get_uptime(); %></div>
               <div class="info">WAN IP: <% nvram_status_get("wan_ipaddr"); %></div>
	       <div class="info">Router Model: <% nvram_get("DD_ROUTER"); %></div>
            </div>
            <div id="helpContainer">
               <div id="help">
                  <div id="logo">
                     <h2>Help</h2>
                  </div>
                  <dl>
                     <dt class="term">Wireless Network Mode: </dt>
                     <dd class="definition">If you wish to exclude Wireless-G clients, choose <em>B-Only</em> mode. If you would like to disable wireless access, choose <em>Disable</em>.
                     </dd>
                  </dl><br /><a target="_blank" href="help/HWireless.asp">More...</a></div>
            </div>
         </div>
      </div>
   </body>
</html>