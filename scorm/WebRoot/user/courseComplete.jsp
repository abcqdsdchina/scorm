<%
/*******************************************************************************
**
** Filename:  courseComplete.jsp
**
** File Description:     
**
** This file displays a Course Complete message when a user completes
** a course or when a user selects a course which they have already completed.
**
**
**
** Author: ADL Technical Team
**
** Contract Number:
** Company Name: CTC
**
** Module/Package Name:
** Module/Package Description:
**
** Design Issues:
**
** Implementation Issues:
** Known Problems:
** Side Effects:
**
** References: ADL SCORM
**
/*******************************************************************************
**
** Concurrent Technologies Corporation (CTC) grants you ("Licensee") a non-
** exclusive, royalty free, license to use, modify and redistribute this
** software in source and binary code form, provided that i) this copyright
** notice and license appear on all copies of the software; and ii) Licensee
** does not utilize the software in a manner which is disparaging to CTC.
**
** This software is provided "AS IS," without a warranty of any kind.  ALL
** EXPRESS OR IMPLIED CONDITIONS, REPRESENTATIONS AND WARRANTIES, INCLUDING ANY
** IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NON-
** INFRINGEMENT, ARE HEREBY EXCLUDED.  CTC AND ITS LICENSORS SHALL NOT BE LIABLE
** FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR
** DISTRIBUTING THE SOFTWARE OR ITS DERIVATIVES.  IN NO EVENT WILL CTC  OR ITS
** LICENSORS BE LIABLE FOR ANY LOST REVENUE, PROFIT OR DATA, OR FOR DIRECT,
** INDIRECT, SPECIAL, CONSEQUENTIAL, INCIDENTAL OR PUNITIVE DAMAGES, HOWEVER
** CAUSED AND REGARDLESS OF THE THEORY OF LIABILITY, ARISING OUT OF THE USE OF
** OR INABILITY TO USE SOFTWARE, EVEN IF CTC HAS BEEN ADVISED OF THE POSSIBILITY
** OF SUCH DAMAGES.
**
*******************************************************************************/%>

<html>
<head>
   <title>Sample Run-Time Environment - Course Complete</title>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <script language="JavaScript">
     
   function handleAuto()
   {
      window.opener.top.frames[2].location.href = "LMSMenu.jsp";
      window.close();
   }
    

   /****************************************************************************
   **
   ** Function:  MM_reloadPage()
   ** Input:   init - boolean
   ** Output:  boolean
   **
   ** Description:  This function reloads the window if Nav4 is resized
   **
   ** Issues:  This method is not in use in Version 1.2.2 due to the lack of
   **          Netscape support.
   **
   ***************************************************************************/
   function MM_reloadPage(init)
   { //reloads the window if Nav4 resized
      if (init==true) with (navigator)
      {
         if ((appName=="Netscape")&&(parseInt(appVersion)==4))
         {
            document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage;
         }
      }
      else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
   }
   MM_reloadPage(true);

   // -->
   </script>
</head>

<body bgcolor="#FFFFFF">

<%

String userid = (String)session.getAttribute( "USERID" );

String admin = (String)session.getAttribute( "RTEADMIN" );
String contrl = (String)session.getAttribute( "CONTROL" );
 

%>
<script language="JavaScript">
var scoWinType = typeof(window.opener)

if ( scoWinType != "undefined" && scoWinType != "unknown" ) 
{  
   ctrl = window.opener.top.frames[0].document.forms[0].control.value;
}
else
{
   ctrl = window.top.frames[0].document.forms[0].control.value;
}

if (ctrl == "auto")
{
   document.writeln("<p><a href='javascript:handleAuto();'>Go Back To Main Menu</a></p>");
}
else
{
   document.writeln("<p><a href='LMSMenu.jsp'>Go Back To Main Menu</a></p>");
}

window.top.frames[0].document.forms[0].next.style.visibility = "hidden";
window.top.frames[0].document.forms[0].previous.style.visibility = "hidden";
window.top.frames[0].document.forms[0].logout.disabled = false;
window.parent.frames[1].document.location.href = "code.jsp";
window.top.frames[0].document.forms[0].quit.style.visibility = "hidden";


</script>



    
<DIV id=step_1>
   <p><font size="4">You Have Completed This Course</font></p>
</DIV>
<p>
&nbsp;
</p>
</body>
</html>
