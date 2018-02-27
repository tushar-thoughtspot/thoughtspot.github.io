---
title: [ODBC and JDBC configuration properties]
keywords: tbd
last_updated: tbd
summary: "Lists the properties you can set for ODBC or JDBC connections"
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
This section lists the properties you can set for ODBC or JDBC connections.

## Setting Properties for ODBC

Not all the parameters Simba accepts are supported by the ThoughtSpot ODBC
clients, and ThoughtSpot has added some properties, which are listed separately
here. All configuration properties use the type String (text).

You can set these properties on Windows by using the [ODBC Administrator]({{
site.baseurl }}/data-integrate/clients/change-odbc-windows.html#) client. For
Linux and Solaris, the properties are located in three files, depending on the
property  type:

|Property Type|Location|
|-------------|--------|
|DSN|`odbc.ini` file|
|Driver|`odbsinst.ini` file|
|SimbaSetting Reader|`simbaclient.ini` file|

## Setting Properties for JDBC

For JDBC, these properties are passed as key value pairs in the connect string.
For more information, see [Use the JDBC Driver]({{ site.baseurl
}}/data-integrate/clients/use-jdbc-driver.html#).

## Properties Reference

The following tables summarize the configuration properties.

<table cellpadding="4" cellspacing="0" summary="" id="reference_h2b_cwk_vw__table_ok1_434_vw" class="table" frame="border" border="1" rules="all">
   <colgroup>
      <col style="width:15%"/>
      <col style="width:15%"/>
      <col style="width:70%"/>
   </colgroup>
   <thead class="thead" style="text-align:left;">
      <tr>
         <th>Property</th>
         <th>Type</th>
         <th>Description</th>
      </tr>
   </thead>
   <tbody class="tbody">
      <tr>
         <td><code>DATABASE</code></td>
         <td>DSN or Driver</td>
         <td>The default database to connect to.</td>
      </tr>
      <tr>
         <td><code>SCHEMA</code></td>
         <td>DSN or Driver</td>
         <td>The default schema to connect to.</td>
      </tr>
      <tr>
         <td><code>Description</code></td>
         <td>DSN</td>
         <td>A brief, human-readable description of the DSN. This describes the DSN to users
            who are deciding which DSN to use.
         </td>
      </tr>
      <tr>
         <td><code>Driver</code></td>
         <td>DSN or Driver</td>
         <td>In the driver configuration location, Driver should contain the path to the
            driver binary. In the DSN configuration location, Driver could contain the path to
            the driver binary, or it could contain the driver entry in the registry.
         </td>
      </tr>
      <tr>
         <td><code>IdleTimeout</code></td>
         <td>DSN</td>
         <td>The time to wait for a response from the server, in seconds. This property is
            optional, but SimbaClient will wait indefinitely for SimbaServer to respond to a
            request made to the server unless you specify a timeout period. <code>IdleTimeout</code>
            specifies how many seconds that SimbaClient will wait before aborting the attempt
            and returning to the application with an error. This timeout corresponds to ODBC’s
            <code>CONNECTION_TIMEOUT</code> property and is only used when more specific timeouts, such as
            <code>QUERY_TIMEOUT</code> or <code>LOGIN_TIMEOUT</code> aren’t applicable.
         </td>
      </tr>
      <tr>
         <td><code>Locale</code></td>
         <td>DSN</td>
         <td>
            The connection locale. If this value is set, it overrides the driver-wide
            locale. For example, the driver-wide locale could be <code>en-US</code>. If the client would
            prefer <code>fr-CA</code>, it can set the connection locale to <code>fr-CA</code>.
            <p class="p">Values are composed of a
               2-letter language code (in lower case), and an optional 2-letter country code (in
               upper case). If the country code is specified, it must be separated from the
               language code by a hyphen (-).
            </p>
         </td>
      </tr>
      <tr>
         <td><code>LoginTimeout</code></td>
         <td>DSN</td>
         <td>The timeout, in seconds, to wait for a response from the server when attempting
            to log in. A value of 0 means no timeout. The default value is 60.
         </td>
      </tr>
      <tr>
         <td><code>QueryTimeout</code></td>
         <td>DSN</td>
         <td>The timeout, in seconds, to wait for a response from the server during Prepare,
            Execute, and ExecuteDirect. A value of 0 means no timeout. The default value is
            60.
         </td>
      </tr>
      <tr>
         <td><code>ServerList</code></td>
         <td>DSN</td>
         <td>A comma separated list of all servers (IP address and port number) to connect
            to. SimbaClient must be able to find SimbaServer on the network. This property
            enables server discovery. SimbaClient will try to make a network connection to the
            servers in the order specified until a connection is made.
         </td>
      </tr>
      <tr>
         <td><code>LogLevel</code></td>
         <td>SimbaSetting Reader</td>
         <td>
            Controls the granularity of the messages and events that are logged.
            <div class="p" id="reference_h2b_cwk_vw__p_gcc_gq4_vw">
               With this keyword, you can control the amount of log output by
               controlling the kinds of events that are logged. Possible values (case sensitive):
               <ul class="ul" id="reference_h2b_cwk_vw__ul_hlw_gq4_vw">
                  <li class="li">0 or <code>LOG_OFF</code>: no logging occurs</li>
                  <li class="li">1 or <code>LOG_FATAL</code>: only log fatal errors</li>
                  <li class="li">2 or <code>LOG_ERROR</code>: log all errors</li>
                  <li class="li">3 or <code>LOG_WARNING</code>: log all errors and warnings</li>
                  <li class="li">4 or <code>LOG_INFO</code>: log all errors, warnings, and informational messages</li>
                  <li class="li">5 or <code>LOG_DEBUG</code>: log method entry and exit points and parameter values for
                     debugging
                  </li>
                  <li class="li">6 or <code>LOG_TRACE</code>: log all method entry points</li>
               </ul>
            </div>
         </td>
      </tr>
      <tr>
         <td><code>LogPath</code></td>
         <td>SimbaSetting Reader</td>
         <td>
            Specifies the directory where the log files are created. For
            example:
            <pre class="pre codeblock"><code>LogPath=C:\Simba Technologies\Temp</code></pre>
            If this value is
            not set, the log files are written to the current working directory of the
            SimbaClient.
         </td>
      </tr>
      <tr>
         <td><code>LogFileSize</code></td>
         <td>SimbaSetting Reader</td>
         <td>The size of each log file, in bytes. The default values is 20971520 bytes. When
            the maximum size of the file is reached, a new file is created.
         </td>
      </tr>
      <tr>
         <td><code>LogFileCount</code></td>
         <td>SimbaSetting Reader</td>
         <td>The number of log files to create. When the maximum
            number of log files has been created, the oldest file will be deleted and a new one
            created. The default value is 50.
         </td>
      </tr>
      <tr>
         <td><code>UID</code></td>
         <td>Login Username</td>
         <td>The ODBC/JDBC login username.
         </td>
      </tr>
      <tr>
         <td><code>PWD</code></td>
         <td>Login Pasword</td>
         <td>The ODBC/JDBC login password.
         </td>
      </tr>
   </tbody>
</table>
