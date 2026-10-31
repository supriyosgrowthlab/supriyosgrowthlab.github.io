<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:s="http://www.sitemaps.org/schemas/sitemap/0.9"
  xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="robots" content="noindex, follow"/>
        <title>XML Sitemap</title>
        <style>
          body { font-family: system-ui, sans-serif; color: #0f172a; background: #f7f8fa; margin: 0; padding: 32px 16px; }
          .wrap { max-width: 1000px; margin: 0 auto; }
          h1 { font-size: 26px; margin: 0 0 6px; }
          p { color: #475569; margin: 0 0 20px; }
          table { width: 100%; border-collapse: collapse; background: #fff; border: 1px solid #e2e8f0; border-radius: 12px; overflow: hidden; font-size: 14px; }
          th { text-align: left; background: #0f2a2e; color: #fff; padding: 10px 14px; }
          td { padding: 9px 14px; border-top: 1px solid #e2e8f0; word-break: break-all; }
          a { color: #3f6f0a; text-decoration: none; }
        </style>
      </head>
      <body>
        <div class="wrap">
          <h1>XML Sitemap</h1>
          <p>This sitemap helps search engines discover every page. It is generated automatically.</p>
          <xsl:choose>
            <xsl:when test="s:sitemapindex">
              <table>
                <tr><th>Sitemap</th><th>Last modified</th></tr>
                <xsl:for-each select="s:sitemapindex/s:sitemap">
                  <tr>
                    <td><a href="{s:loc}"><xsl:value-of select="s:loc"/></a></td>
                    <td><xsl:value-of select="substring(s:lastmod, 1, 10)"/></td>
                  </tr>
                </xsl:for-each>
              </table>
            </xsl:when>
            <xsl:otherwise>
              <p><xsl:value-of select="count(s:urlset/s:url)"/> URLs</p>
              <table>
                <tr><th>URL</th><th>Images</th><th>Last modified</th></tr>
                <xsl:for-each select="s:urlset/s:url">
                  <tr>
                    <td><a href="{s:loc}"><xsl:value-of select="s:loc"/></a></td>
                    <td><xsl:value-of select="count(image:image)"/></td>
                    <td><xsl:value-of select="substring(s:lastmod, 1, 10)"/></td>
                  </tr>
                </xsl:for-each>
              </table>
            </xsl:otherwise>
          </xsl:choose>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
