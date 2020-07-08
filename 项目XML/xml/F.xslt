<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    
    <div style="width:100%; height:100%; margin:0 auto;background: url(../img/1.jpg);background-size: cover;">
      <h3 style="text-align:center;font-size:25pt">我的英文词库</h3>
      <table border="1" style="font-size:18pt;width:100%;">

        <tr>
          <th>编号</th>
          <th>英文单词</th>
          <th>中文含义</th>
          <th>例句</th>
        </tr>

        
        <xsl:for-each select="Dictionaries/Dictionarie">
          <xsl:sort order="ascending" select="number"/>
          <tr>
            <td>
              <xsl:value-of select="number"/>
            </td>
            <td>
              <xsl:value-of select="Englishwords"/>
            </td>
            <td>
              <xsl:value-of select="Chinesemeaning"/>
            </td>
            <td>
              <xsl:value-of select="Examplesentence"/>
            </td>
          </tr>

        </xsl:for-each>
      
      </table>
      <a href="../html/Words.html" style="position: fixed;left: 10px;top: 0;">返回主页</a>
    </div>
  </xsl:template>
</xsl:stylesheet>

