<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" indent="no"/>
<xsl:strip-space elements="*"/>
	<!--MENU-->
	<xsl:template match="MENU" mode="top">
		<xsl:apply-templates select="MENU-ITEM"  mode="top"/>
	</xsl:template>  


	<!--MENU-ITEM-->
	<xsl:template match="MENU-ITEM"  mode="top">
		<xsl:variable name="position"><xsl:value-of select="position()"/></xsl:variable>
   		<xsl:choose>
           <!-- active menu with link-->
           	<xsl:when test="MENU-ITEM[@ID=/LAYOUT/@ID] or @ID=/LAYOUT/@ID">
				<td VALIGN="bottom">
					<img align="middle" src="images/sep_com_l.gif" alt=""/>
				</td>
				<td align="center" style="padding-bottom: 0px; width:84px; background-image: url('images/menu-top-bgr.gif'); background-repeat: repeat-x; background-position: bottom; " class="menu">
					<div style="width:84px;"><span></span></div>
					<a href="{@HREF}" class="theme"><xsl:value-of select="@TITLE" disable-output-escaping="yes"/></a>
				</td>
				<td VALIGN="bottom">
					<img align="middle" src="images/sep_com_r.gif" alt=""/>
				</td>
            </xsl:when>
            
            
            <xsl:otherwise>
				<xsl:if test="$position=1"><td style="width: 37px;"><span></span></td></xsl:if>
				<td style="padding-bottom: 0px; padding: 0 10px; text-align: center;"> 
					<div style="width:84px;"><span></span></div>
					<a href="{@HREF}" class="menu"><xsl:value-of select="@TITLE" disable-output-escaping="yes"/></a></td>
	                <xsl:if test="not(../MENU-ITEM[$position+1]/MENU-ITEM[@ID=/LAYOUT/@ID] or ../MENU-ITEM[$position+1][@ID=/LAYOUT/@ID]) and $position != last()">
						<td VALIGN="bottom">
							<img align="middle" src="images/sep_com.gif" alt=""/>
						</td>
					</xsl:if>
            </xsl:otherwise>
	    </xsl:choose>
	</xsl:template>

</xsl:stylesheet>
