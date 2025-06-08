<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">

  <xsl:output method="xml" indent="yes"/>
  
  <xsl:template match="/">
    <ultimaVersion>
      <xsl:apply-templates select="software-libre/distribuciones/distribucion"/> <!-- esto es para llamar a la plantilla, call es cuando se llama a una plantilla pero en este caso tiene que ir asi xa q no de error -->
    </ultimaVersion>  
    
  </xsl:template>

  <xsl:template match="software-libre/distribuciones/distribucion" mode="#all">
    <xsl:variable name="maxVersion" select="max(//lanzamiento[@distribucion=current()/@id]/@version)"/>
    <xsl:for-each select="//lanzamiento[@distribucion=current()/@id and @version=$maxVersion]">
      <!-- PISTA PARA QUE DEVUELVA 1 VALOR:
           hay una funcion que se llama position() y devuelve un numero de donde nos encontramos 
        <xsl:for-each select="//lanzamiento[@distribucion=current()/@id and @version=$maxVersion]">Add commentMore actions
          <xsl:if test="position()=1">
            <xsl:copy-of select="." />
          </xsl:if>
      
      -->
      <xsl:apply-templates select="nodo[1]"/>
      <xsl:copy-of select="."/> <!-- con esto se copia lo actual, tmbn se podria usar current -->
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>