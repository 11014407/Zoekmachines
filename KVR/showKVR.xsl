<?xml version="1.0" encoding="ISO-8859-1"?>
 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<!-- ik heb niet de variabelen zo netjes van te voren gedefinieerd als Marx, excuus daarvoor -->

<!-- verder geeft het commentaar aan welke onderdelen bepaalde functies vervullen-->

<xsl:template match="/">




 <xsl:variable name="Document-id" select="//item[@attribuut='Document-id']"/>
 <xsl:variable name="perma" select="//item[@attribuut='Permalink']"/>
<xsl:variable name="bibomschrijving" select="//item[@attribuut='Bibliografische_omschrijving']"/>
<xsl:variable name="vetnummer">
 <xsl:choose>
        <xsl:when test="string-length(//footer/@vetnummer) &gt; 0">
                 <xsl:value-of select="//footer/@vetnummer"/>
        </xsl:when>
	<xsl:otherwise>
	        <xsl:choose>
                        <xsl:when test="string-length(//vraagdata/@vraagnummer) &gt; 9">
                        <xsl:value-of select="//vraagdata/@vraagnummer"/>
                        </xsl:when>
                        <xsl:otherwise>
			onbekend
		        </xsl:otherwise>
                </xsl:choose>
        </xsl:otherwise>
	</xsl:choose>
</xsl:variable>


<html>

  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>

  <xsl:value-of select="$bibomschrijving"/>

</title>
<link rel="stylesheet" type="text/css" href="fulldoc.css" />

</head>

<body>
<center>
<!-- alles in 1 table zetten werkt averechs dankzij die hr -->
<!--<table width="800px">
<tr>
<td>-->

<!-- het kamernummer linksboven -->	
<!--
<h1 align="right"><b><xsl:value-of select="//header/@kamer"/></b></h1>

<h2><xsl:value-of select="$bibomschrijving"/></h2>
-->

<table class="titeltabel">
<tr><td>
<span class="titel"><xsl:text>Kamervragen </xsl:text></span><br/>
<span class="datum"><xsl:value-of select="//header/@kamer"/></span><br/>

<span class="ondertitel">


<!-- de titel -->
	<xsl:choose>
<!-- HIER DE ANTWOORDEN -->
                <xsl:when test="//antwoord">
			
			Vragen van
			<xsl:choose>
				<xsl:when test="count(//persoon) = 1">
					<xsl:value-of select="//vrager[1]"/>
				</xsl:when>
				<xsl:otherwise>	
				 	<xsl:value-of select="//vrager[1]"/> et. al.
				</xsl:otherwise>
			</xsl:choose>
				<xsl:if test="string-length(//vraagdata/@onderwerp) &gt; 0">
					over <xsl:value-of select="//vraagdata/@onderwerp"/>
				</xsl:if>
			 met gegeven antwoord van
			<xsl:choose>
				<xsl:when test="string-length(//mede-antwoorder) &gt; 0">
					o.a. <xsl:value-of select="//antwoorder/@functie"/><xsl:text> </xsl:text><xsl:value-of select="//antwoorder"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="//antwoorder/@functie"/><xsl:text> </xsl:text><xsl:value-of select="//antwoorder"/>
				</xsl:otherwise> 
			</xsl:choose>
				
               </xsl:when>
<!-- HIER DE MEDEDELINGEN -->
		<xsl:otherwise>
                        <xsl:choose>
                                <xsl:when test="//mededeling">
                                       
                        		Gestelde vragen van
                        		<xsl:choose>
                                		<xsl:when test="count(//persoon) = 1">
                                        		<xsl:value-of select="//vrager[1]"/> 
                                		</xsl:when>
                                		<xsl:otherwise>
                                        		<xsl:value-of select="//vrager[1]"/> et. al.
                                		</xsl:otherwise>
                        		</xsl:choose>
			        	
					<xsl:if test="string-length(//vraagdata/@onderwerp) &gt; 0">
						over <xsl:value-of select="//vraagdata/@onderwerp"/>
					</xsl:if>
                         		
					met een mededeling van
                        		
					<xsl:value-of select="//mededeling/@functie"/><xsl:text> </xsl:text><xsl:value-of select="//mededeling/@mededeler"/>
                                	
				</xsl:when>

                                <xsl:otherwise>
	                                
		                        Gestelde vragen van
                		        <xsl:choose>
                                		<xsl:when test="count(//persoon) = 1">
                                        		<xsl:value-of select="//vrager[1]"/> 
                                		</xsl:when>
                                		<xsl:otherwise>
                                        		<xsl:value-of select="//vrager[1]"/> et. al.
                                		</xsl:otherwise>
                        		</xsl:choose>
			       
					 <xsl:if test="string-length(//vraagdata/@onderwerp) &gt; 0">
						over <xsl:value-of select="//vraagdata/@onderwerp"/>
					</xsl:if>
                         		zonder reactie.
				
	                		
				</xsl:otherwise>
			</xsl:choose>
                </xsl:otherwise>
	</xsl:choose>
        
</span>
<br/>
<span style="font-family:Verdana, Arial, Helvetica, sans-serif;font-size:11px;text-decoration:underline;cursor:pointer;cursor:hand;" onMouseOver="style.backgroundColor='#f99797';" onMouseOut="font-family:Verdana, Arial, Helvetica, sans-serif;font-size:11px;text-decoration:underline;" onClick="javascript: history.go(-1)">Terug</span>

</td></tr>
</table>



<!-- het kopje: bibliografische beschrijving van het xml bestand -->



<!-- metadata tabel -->

<table class="metadatatabel"  width="800px"><caption>Over dit onderwerp: </caption>

  <!-- <tr>

	<td class="metadatabold">

		Betreft:

	</td>

	<td>

		<xsl:value-of select="$bibomschrijving"/> 

	</td>



 cel voor de tijdslijn.. dit zal moeten met een link naar de database (misschien in een frame met php?)  

	<td rowspan="4" width="40%">Timeline hier?</td>

</tr>

-->
<tr>
	<td class="metadatabold">
		Bibliografische omschrijving:
	</td>
	<td>
		<xsl:value-of select="$bibomschrijving"/>
	</td>
</tr>
<tr>
	<td class="metadatabold">
		Rubriek:
	</td>
	<td>
		<xsl:value-of select="//item[@attribuut='Rubriek']"/>
	</td>
</tr>
<tr>
	<td class="metadatabold">
		Gepubliceerd op:
	</td>
	<td>
		<xsl:choose>
		<xsl:when test="//item[@attribuut='Permalink'][contains(.,'commentaar')]">
			<a href="http://parlando.sdu.nl/cgi/login/anonymous">Parlando</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="http://www.statengeneraaldigitaal.nl">Staten-Generaal Digitaal</a> (SGD)
		</xsl:otherwise>
		</xsl:choose> 
	</td>
</tr>
<tr>

        <td class="metadatabold">

                Bron:

        </td>

        <td>

          <a title="de Kamervragen in PDF">
        <xsl:attribute name="href">
                <xsl:value-of select="//item[@attribuut = 'Permalink']"/>
        </xsl:attribute>
                <xsl:value-of select="//item[@attribuut = 'Vindplaats']"/>

                </a>
<xsl:text> (</xsl:text><xsl:value-of select="//item[@attribuut = 'Bestand']"/><xsl:text>)</xsl:text>
</td>

</tr>

<!--<tr>
	<td class="metadatabold">
		Vindplaats:
	</td>
	<td>
		<xsl:value-of select="//item[@attribuut='Vindplaats']"/>
	</td>
</tr>-->	
<tr>
	<td class="metadatabold">
		Dossiernummer:
	</td>
	<td>
	<xsl:value-of select="$vetnummer"/> 
	</td>
</tr>
<tr>
<td colspan="2">
<xsl:choose>
	<xsl:when test="contains($vetnummer, 'onbekend')">
		<iframe frameborder="no">
		<xsl:attribute name="height">
			<xsl:text>110</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="width">
         <xsl:text>350px</xsl:text>
</xsl:attribute>

<xsl:attribute name="style">
                <xsl:text>margin:0px;</xsl:text>
</xsl:attribute>

<xsl:attribute name="scrolling">
         <xsl:text>no</xsl:text>
</xsl:attribute>

</iframe>
</xsl:when>
<xsl:otherwise>		
<iframe frameborder="no">
<xsl:attribute name="src">
<xsl:text>../../KVRmeta.php?docid=</xsl:text>
<xsl:value-of select="$Document-id"/>
<xsl:text><![CDATA[&docvet=]]></xsl:text>
<xsl:value-of select="$vetnummer"/>
</xsl:attribute>

<xsl:attribute name="height">
         <xsl:text>110</xsl:text>
</xsl:attribute>

<xsl:attribute name="width">
         <xsl:text>350px</xsl:text>
</xsl:attribute>

<xsl:attribute name="style">
		<xsl:text>margin:0px;</xsl:text>
</xsl:attribute>

<xsl:attribute name="scrolling">
	 <xsl:text>no</xsl:text>
</xsl:attribute>

</iframe>
</xsl:otherwise>
</xsl:choose>

<xsl:choose>
<xsl:when test="//noot/@datum">

	<iframe frameborder="no">
	<xsl:attribute name="src">
		<xsl:text>../../KVRhijgerig.php?docid=</xsl:text>
	<xsl:value-of select="$Document-id"/>

	</xsl:attribute>

	<xsl:attribute name="height">
         	<xsl:text>110</xsl:text>
	</xsl:attribute>

	<xsl:attribute name="width">
         	<xsl:text>350px</xsl:text>
	</xsl:attribute>

	<xsl:attribute name="style">
                <xsl:text>margin:0px;</xsl:text>
	</xsl:attribute>

	<xsl:attribute name="scrolling">
         	<xsl:text>no</xsl:text>
	</xsl:attribute>

	</iframe>
</xsl:when>
<xsl:otherwise>
	<iframe frameborder="no">

	<xsl:attribute name="height">
         	<xsl:text>110</xsl:text>
	</xsl:attribute>

	<xsl:attribute name="width">
         	<xsl:text>350px</xsl:text>
	</xsl:attribute>

	<xsl:attribute name="style">
                <xsl:text>margin:0px;</xsl:text>
	</xsl:attribute>

	<xsl:attribute name="scrolling">
         	<xsl:text>no</xsl:text>
	</xsl:attribute>
	</iframe>
</xsl:otherwise>
</xsl:choose>
</td>

</tr>



<tr><td colspan="2"><xsl:text> </xsl:text></td></tr>
<!-- ############ DEZE HR WIL NIET!!! ######## -->
<tr><td	colspan="2"><hr/></td></tr>
<tr><td	colspan="2"><xsl:text> </xsl:text></td></tr>


<!-- als er 1 persoon is, maak dan geen lijst-->

<xsl:choose>

	<xsl:when test="count(//persoon) = 1">

		<tr>

			<td class="metadatabold">

				Indiener:

			</td>

			<td>

				<xsl:for-each select="//vrager">

					<xsl:value-of select = "."/> (<xsl:value-of select="@partij"/>)

				</xsl:for-each>

			</td>

		</tr>

	</xsl:when>

<!-- als er twee of meer personen zijn, maak dan een ongesorteerde lijst -->

	<xsl:otherwise>

		<tr>

			<td class="metadatabold">

				Indieners:

			</td>

			<td>

				<xsl:for-each select="//vrager">

					<ul>

						<li><xsl:value-of select = "."/> (<xsl:value-of select="@partij"/>)</li>

					</ul>		

				</xsl:for-each>

			</td>

		</tr>

	</xsl:otherwise>

</xsl:choose>

<tr>

  <td class="metadatabold">

  Gevraagd aan: </td>

    <td>

      <xsl:value-of select="//vraagdata/vraagt-aan"/> <!-- doe dit net als bij indieners -->

</td>

</tr>

<tr>

	<td class="metadatabold">

		Indiendatum:

	</td>

	<td>

		<xsl:value-of select="//item[@attribuut = 'Datum_indiening']"/>

                <!-- als er  een tijdslijn is kan dit weg. -->

	</td>

</tr>
<xsl:if test="//noot">
<tr valign="top">

  <td class="metadatabold">

Gebruikte bronnen:

</td>

<td>

<xsl:for-each select="//noot">

  <!--<a href="zoekstringnaarbron" title="klik om de bron te vinden">-->
					<xsl:choose>
                                                <xsl:when test="@weblink">
                                                        <a>
                                                        <xsl:attribute name="href">
                                                                <xsl:value-of select="@weblink"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of select="."/>
                                                        </a>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                        <xsl:value-of select="."/><br/>
                                                </xsl:otherwise>
					</xsl:choose>


 <!-- </a>-->

  <br/>

 </xsl:for-each>

</td>

</tr>
</xsl:if>

</table>
<br/>

<table class="metadatatabel">
<caption>
	<xsl:choose>
	<xsl:when test="count(//persoon) = 1">
		De indiener:
	</xsl:when>
	<xsl:otherwise>
		De indieners:
	</xsl:otherwise>
	</xsl:choose>
</caption>
<tr>
<td>
<iframe>
<xsl:attribute name="src">
<xsl:text>../../Sprekers2.php?docid=</xsl:text>
<xsl:value-of select="$Document-id"/>
</xsl:attribute>

<xsl:attribute name="height">
         <xsl:text>190</xsl:text>
</xsl:attribute>

<xsl:attribute name="width">
         <xsl:text>785px</xsl:text>
</xsl:attribute>

<xsl:attribute name="style">
         <xsl:text>margin:0px;</xsl:text>
</xsl:attribute>

<xsl:attribute name="scrolling">
         <xsl:text>auto</xsl:text>
</xsl:attribute>

</iframe>

</td>
</tr>
</table>

<br/>


<!-- <h1>De vragen en de antwoorden daarop.</h1> -->

<!--begin van de vraag & antwoord tabel -->

<table class="maintable" width="100%">
<caption>
<xsl:choose>
	        <xsl:when test="//antwoord">
			Gestelde vragen en gegeven antwoord
		</xsl:when>
		<xsl:otherwise>
	                <xsl:choose>
                                <xsl:when test="//mededeling">
	                                Gestelde vragen en een mededeling
				</xsl:when>
                                <xsl:otherwise>
                                        Gestelde vragen zonder reactie
		                </xsl:otherwise>
                        </xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
</caption>

	<tr>

	<!-- eerste rij: vrager en antwoorder -->

	<td colspan="2" align="right" bgcolor="#F99797">
		<b>Vragen</b>  
		<xsl:if test="//toelichting">
		<xsl:text> met toelichting</xsl:text>
		</xsl:if>
<xsl:text> (nummer </xsl:text><xsl:value-of select="//vraagdata/@vraagnummer"/><xsl:text>)</xsl:text>

	</td>
<td bgcolor="#F99797"><xsl:text> </xsl:text></td>

	<xsl:if test="//antwoord">
	<td bgcolor="#F99797">

		<b>

			Antwoord van 

			<xsl:value-of select="//antwoorder/@functie"/><xsl:text> </xsl:text>

			<xsl:value-of select="//antwoorder"/>

						

			<!-- ministerie tussen haakjes -->

			<xsl:text> (</xsl:text>

			<xsl:value-of select="//antwoorder/@ministerie"/>

			<xsl:text>)</xsl:text>



			<!-- indien van toepassing: mede antwoorder -->

			<xsl:if test="string-length(//mede-antwoorder) &gt; 0">

			<br/>mede namens  

				<xsl:value-of select="//mede-antwoorder"/>

			</xsl:if>

		</b>

	</td>
</xsl:if>

	</tr>

		<!-- vragen en antwoorden -->

		<xsl:for-each select="//vraag">

			<tr>

			<xsl:variable name="nummer" select="@nummer"/>

			<td><b><xsl:value-of select="@nummer"/></b></td>

			<td>

				<xsl:value-of select="."/>

				<xsl:if test="@voetnoot">
					<span class="ankerlink"> 
					<xsl:value-of select="@voetnoot"/>
					</span>
				</xsl:if>			

	

			</td>
			<td><xsl:text>  </xsl:text></td>
<xsl:if test="//antwoord">
			<td><i><xsl:value-of select="//antwoord[contains(@nummer,$nummer)]"/></i></td>
</xsl:if>
			</tr>
			<tr><td colspan="4"><xsl:text> </xsl:text></td></tr>
			<tr><td colspan="4"><xsl:text>	</xsl:text></td></tr>




					
		</xsl:for-each>


<xsl:if test="//toelichting">
        <tr><td colspan="3" align="right" class="onderwerpaanhef"><b>Toelichting</b></td></tr>
<tr><td colspan="3"><xsl:value-of select="//toelichting"/></td></tr>
</xsl:if>

<xsl:if test="//mededeling">
	<tr><td colspan="3" align="right" class="onderwerpaanhef"><b>Mededeling</b></td></tr>
<tr><td colspan="3"><xsl:value-of select="//mededeling"/></td></tr>
</xsl:if>


	<!-- alleen vraagnoten tonen als ze er zijn! -->

	<xsl:if test="//noot[ancestor::noten/@afkomstig='vraag']">

		<tr><td colspan="4" class="onderwerpaanhef">referenties van vragen</td></tr>

		<tr>

			<td colspan="4">

				<xsl:for-each select="//noot[ancestor::noten/@afkomstig='vraag']">

					<xsl:value-of select="@nummer"/><xsl:text>) </xsl:text>
					<xsl:choose>
						<xsl:when test="@weblink">
							<a>
							<xsl:attribute name="href">
								<xsl:value-of select="@weblink"/>
							</xsl:attribute>
							<xsl:value-of select="."/>
							</a>
						</xsl:when>
						<xsl:otherwise>	 
							<xsl:value-of select="."/><br/>
						</xsl:otherwise>
					</xsl:choose>	
				</xsl:for-each>

			</td>

		</tr>

	</xsl:if>

	<!-- alleen antwoordnoten tonen als ze er zijn!-->

	<xsl:if test="//noot[ancestor::noten/@afkomstig='antwoord']">	

		<tr><td colspan="4" class="onderwerpaanhef">referenties van antwoorden</td></tr>

		<tr>

			<td colspan="4">

				<xsl:for-each select="//noot[ancestor::noten/@afkomstig='antwoord']">

					<xsl:value-of select="@nummer"/><xsl:text>) </xsl:text>

					<xsl:value-of select="."/><br/>

				</xsl:for-each>

			</td>

		</tr>

	</xsl:if>	

</table>
<!--</td>
</tr>
</table>-->
</center>
</body>

</html>

</xsl:template>

</xsl:stylesheet>

