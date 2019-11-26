<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Facture</title>
            </head>
            <body>
                
                <table>
                   
                    
                <xsl:for-each select="/stock/commandes/commande">
                    <xsl:variable name="clientID" select="clientId"/>
                    <tr>
                        <th>Client</th>
                        <td><xsl:value-of select="$clientID"/></td>
                        <td><xsl:for-each select="../preceding-sibling::node()/client">
                            <xsl:if test="@clientId=$clientID">
                                <xsl:value-of select="./nom"/> 
                            </xsl:if>
                        </xsl:for-each></td>
                        <td><xsl:for-each select="../preceding-sibling::node()/client">
                            <xsl:if test="@clientId=$clientID">
                                <xsl:value-of select="./prenom"/>
                            </xsl:if>
                        </xsl:for-each></td>
                    </tr>
                    <tr>
                        <th>produit</th>
                        <th>prix</th>
                        <th>quantite</th>
                        <th>sous-total</th>
                    </tr>
                        <xsl:for-each select="referenceProduit">
                            <tr>
                                <xsl:variable name="reference" select="." />
                                
                                <td>
                                    <xsl:for-each select="../../preceding-sibling::node()/produit">
                                        <xsl:if test="$reference=@referenceProduit">
                                            <xsl:value-of select="designation"/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                                <xsl:variable name="prixProduit">
                                    <xsl:for-each select="../../preceding-sibling::node()/produit">
                                        <xsl:if test="$reference=@referenceProduit">
                                            <xsl:value-of select="prix"/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>
                                <td><xsl:value-of select="$prixProduit"/></td>
                                <xsl:variable name="quantiteProduit" select="./@quantite"/>
                                <td><xsl:value-of select="$quantiteProduit"/></td>
                                <td><xsl:value-of select="$quantiteProduit * $prixProduit"/></td>
                            </tr>
                        </xsl:for-each>
                
                </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>