<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns2="http://www.w3.org/1999/xlink" xmlns:local="http://www.yoursite.org/namespace" xmlns:ead="urn:isbn:1-931666-22-9" version="2.0">
    <!--
        *******************************************************************
        *                                                                 *
        * VERSION:          1.0                                           *
        *                                                                 *
        * AUTHOR:           Winona Salesky                                *
        *                   wsalesky@gmail.com                            *
        *                                                                 *
        * DATE:             2013-08-14                                    *
        *                                                                 *
        * ABOUT:            This file has been created for use with       *
        *                   EAD xml files exported from the               *
        *                   ArchivesSpace web application.                *
        *                                                                 *
        *******************************************************************
    -->
    <xsl:strip-space elements="*"/>
    <xsl:output encoding="utf-8" indent="yes"/>
    <!-- A local function to check for element ids and generate an id if no id exists -->
    <xsl:function name="local:buildID">
        <xsl:param name="element"/>
        <xsl:choose>
            <xsl:when test="$element/@id">
                <xsl:value-of select="$element/@id"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="generate-id($element)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- 
        Add tag names for <odd> where type="types of notes"
    -->
    <xsl:function name="local:oddType">
        <xsl:param name="oddNode"/>
        <xsl:choose>
            <xsl:when test="$oddNode[@type] = 'publicationStatus'">Publication status</xsl:when>
        </xsl:choose>
    </xsl:function>

    <!-- 
        A local function to name all child elements with no head tag. 
        Tag names addapted from EAD tag library (http://www.loc.gov/ead/tglib/element_index.html)
    -->
    <xsl:function name="local:tagName">
        <!-- element node as parameter -->
        <xsl:param name="elementNode"/>
        <!-- Name of element -->
        <xsl:variable name="tag" select="name($elementNode)"/>
        <!-- Find element name -->
        <xsl:choose>
            <xsl:when test="$elementNode/ead:head"><xsl:value-of select="$elementNode/ead:head"/></xsl:when>
            <xsl:when test="$tag = 'did'">Summary information</xsl:when>
            <xsl:when test="$tag = 'abstract'">Abstract</xsl:when>
            <xsl:when test="$tag = 'accruals'">Accruals</xsl:when>  
            <xsl:when test="$tag = 'acqinfo'">Immediate source of acquisition</xsl:when>
            <xsl:when test="$tag = 'address'">Address</xsl:when>  
            <xsl:when test="$tag = 'altformavail'">Alternative form available</xsl:when>
            <xsl:when test="$tag = 'appraisal'">Appraisal information</xsl:when>   
            <xsl:when test="$tag = 'arc'">Arc</xsl:when>
            <xsl:when test="$tag = 'archref'">Archival reference</xsl:when>   
            <xsl:when test="$tag = 'arrangement'">Arrangement</xsl:when>
            <xsl:when test="$tag = 'author'">Author</xsl:when>   
            <xsl:when test="$tag = 'bibref'">Bibliographic reference</xsl:when>
            <xsl:when test="$tag = 'bibseries'">Bibliographic series</xsl:when>   
            <xsl:when test="$tag = 'bibliography'">Bibliography</xsl:when>

            <!-- AtoM: Test if the bioghist is from a person/family/corp, set heading accordingly -->
            <xsl:when test="$tag = 'bioghist'">
                Administrative history / Biographical sketch
            </xsl:when>    

            <xsl:when test="$tag = 'change'">Change</xsl:when>
            <xsl:when test="$tag = 'chronlist'">Chronology list</xsl:when>    
            <xsl:when test="$tag = 'accessrestrict'">Restrictions on access</xsl:when>
            <xsl:when test="$tag = 'userestrict'">Conditions governing use</xsl:when>   
            <xsl:when test="$tag = 'controlaccess'">Access points</xsl:when>
            <xsl:when test="$tag = 'corpname'">Corporate name</xsl:when>   
            <xsl:when test="$tag = 'creation'">Creation</xsl:when>
            <xsl:when test="$tag = 'custodhist'">Custodial history</xsl:when>   
            <xsl:when test="$tag = 'date'">Date</xsl:when>    
            <xsl:when test="$tag = 'descgrp'">Description group</xsl:when>
            <xsl:when test="$tag = 'dsc'">Series descriptions</xsl:when>   
            <xsl:when test="$tag = 'descrules'">Descriptive rules</xsl:when>     
            <xsl:when test="$tag = 'dao'">Digital object</xsl:when>
            <xsl:when test="$tag = 'daodesc'">Digital object description</xsl:when>
            <xsl:when test="$tag = 'daogrp'">Digital object group</xsl:when>     
            <xsl:when test="$tag = 'daoloc'">Digital object location</xsl:when> 
            <xsl:when test="$tag = 'dimensions'">Dimensions</xsl:when>
            <xsl:when test="$tag = 'edition'">Edition</xsl:when>     
            <xsl:when test="$tag = 'editionstmt'">Edition statement</xsl:when>
            <xsl:when test="$tag = 'event'">Event</xsl:when>     
            <xsl:when test="$tag = 'eventgrp'">Event group</xsl:when>
            <xsl:when test="$tag = 'expan'">Expansion</xsl:when> 
            <xsl:when test="$tag = 'extptr'">Extended pointer</xsl:when>
            <xsl:when test="$tag = 'extptrloc'">Extended pointer location</xsl:when>
            <xsl:when test="$tag = 'extref'">Extended reference</xsl:when>
            <xsl:when test="$tag = 'extrefloc'">Extended reference location</xsl:when>
            <xsl:when test="$tag = 'extent'">Extent</xsl:when>
            <xsl:when test="$tag = 'famname'">Family name</xsl:when>
            <xsl:when test="$tag = 'filedesc'">File description</xsl:when>
            <xsl:when test="$tag = 'fileplan'">File plan</xsl:when>
            <xsl:when test="$tag = 'frontmatter'">Front matter</xsl:when>
            <xsl:when test="$tag = 'function'">Function</xsl:when>
            <xsl:when test="$tag = 'genreform'">Genre/Physical characteristic</xsl:when>
            <xsl:when test="$tag = 'geogname'">Geographic name</xsl:when>
            <xsl:when test="$tag = 'imprint'">Imprint</xsl:when>
            <xsl:when test="$tag = 'index'">Index</xsl:when>
            <xsl:when test="$tag = 'indexentry'">Index entry</xsl:when>
            <xsl:when test="$tag = 'item'">Item</xsl:when>
            <xsl:when test="$tag = 'language'">Language</xsl:when>
            <xsl:when test="$tag = 'langmaterial'">Language of the material</xsl:when>
            <xsl:when test="$tag = 'langusage'">Language usage</xsl:when>
            <xsl:when test="$tag = 'legalstatus'">Legal status</xsl:when>
            <xsl:when test="$tag = 'linkgrp'">Linking group</xsl:when>
            <xsl:when test="$tag = 'originalsloc'">Location of originals</xsl:when>
            <xsl:when test="$tag = 'materialspec'">Material specific details</xsl:when>
            <xsl:when test="$tag = 'name'">Name</xsl:when>
            <xsl:when test="$tag = 'namegrp'">Name group</xsl:when>
            <xsl:when test="$tag = 'note'">Note</xsl:when>
            <xsl:when test="$tag = 'notestmt'">Note statement</xsl:when>
            <xsl:when test="$tag = 'occupation'">Occupation</xsl:when>
            <xsl:when test="$tag = 'origination'">Creator</xsl:when>
            <xsl:when test="$tag = 'odd'">
                <!-- Atom: Choose prefix to note: -->
                <xsl:choose>
                    <xsl:when test="$elementNode[@type='publicationStatus']">
                        Publication status
                    </xsl:when>
                    <xsl:otherwise>
                        Other descriptive data
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$tag = 'otherfindaid'">Finding aids</xsl:when>
            <xsl:when test="$tag = 'persname'">Personal name</xsl:when>
            <xsl:when test="$tag = 'phystech'">Physical characteristics and technical requirements</xsl:when>
            <xsl:when test="$tag = 'physdesc'">Physical description</xsl:when>
            <xsl:when test="$tag = 'physfacet'">Physical facet</xsl:when>
            <xsl:when test="$tag = 'physloc'">Physical location</xsl:when>
            <xsl:when test="$tag = 'ptr'">Pointer</xsl:when>
            <xsl:when test="$tag = 'ptrgrp'">Pointer group</xsl:when>
            <xsl:when test="$tag = 'ptrloc'">Pointer location</xsl:when>
            <xsl:when test="$tag = 'prefercite'">Preferred citation</xsl:when>
            <xsl:when test="$tag = 'processinfo'">Processing information</xsl:when>
            <xsl:when test="$tag = 'profiledesc'">Profile description</xsl:when>
            <xsl:when test="$tag = 'publicationstmt'">Publication statement</xsl:when>
            <xsl:when test="$tag = 'publisher'">Publisher</xsl:when> 
            <xsl:when test="$tag = 'ref'">Reference</xsl:when>
            <xsl:when test="$tag = 'refloc'">Reference location</xsl:when>
            <xsl:when test="$tag = 'relatedmaterial'">Related material</xsl:when>
            <xsl:when test="$tag = 'repository'">Repository</xsl:when>
            <xsl:when test="$tag = 'resource'">Resource</xsl:when>
            <xsl:when test="$tag = 'revisiondesc'">Revision description</xsl:when>
            <xsl:when test="$tag = 'runner'">Runner</xsl:when>
            <xsl:when test="$tag = 'scopecontent'">Scope and content</xsl:when>
            <xsl:when test="$tag = 'separatedmaterial'">Separated material</xsl:when>
            <xsl:when test="$tag = 'seriesstmt'">Series statement</xsl:when>
            <xsl:when test="$tag = 'sponsor'">Sponsor</xsl:when>
            <xsl:when test="$tag = 'subject'">Subject</xsl:when>
            <xsl:when test="$tag = 'subarea'">Subordinate area</xsl:when>
            <xsl:when test="$tag = 'subtitle'">Subtitle</xsl:when>
            <xsl:when test="$tag = 'div'">Text division</xsl:when>
            <xsl:when test="$tag = 'title'">Title</xsl:when>
            <xsl:when test="$tag = 'unittitle'">Title</xsl:when>
            <xsl:when test="$tag = 'unitdate'">Date</xsl:when>
            <xsl:when test="$tag = 'unitid'">ID</xsl:when>
            <xsl:when test="$tag = 'titlepage'">Title page</xsl:when>
            <xsl:when test="$tag = 'titleproper'">Title proper of the finding aid</xsl:when>
            <xsl:when test="$tag = 'titlestmt'">Title statement</xsl:when>   
            <!-- eac-cpf fields -->
            <xsl:when test="$tag = 'identity'">Name(s)</xsl:when>
            <xsl:when test="$tag = 'description'">Description</xsl:when>
            <xsl:when test="$tag = 'relations'">Relations</xsl:when>
            <xsl:when test="$tag = 'structureOrGenealogy'">Structure or genealogy</xsl:when>
            <xsl:when test="$tag = 'localDescription'">Local description</xsl:when>
            <xsl:when test="$tag= 'generalContext'">General context</xsl:when>
            <xsl:when test="$tag= 'alternativeSet'">Alternative set</xsl:when>
            <xsl:when test="$tag= 'functions'">Functions</xsl:when>
            <xsl:when test="$tag= 'biogHist'">Biography or history</xsl:when>
            
        </xsl:choose>
    </xsl:function>
   
    <!-- 
        A local function to parse ISO dates into more readable dates.
        Takes a date formatted like this: 2009-11-18T10:16-0500
        Returns: November 18, 2009
    -->
    <xsl:function name="local:parseDate">
        <xsl:param name="dateString"/>
        <xsl:variable name="month">
            <xsl:choose>
                <xsl:when test="substring($dateString,6,2) = '01'">January</xsl:when>
                <xsl:when test="substring($dateString,6,2) = '02'">February</xsl:when>
                <xsl:when test="substring($dateString,6,2) = '03'">March</xsl:when>
                <xsl:when test="substring($dateString,6,2) = '04'">April</xsl:when>
                <xsl:when test="substring($dateString,6,2) = '05'">May</xsl:when>
                <xsl:when test="substring($dateString,6,2) = '06'">June</xsl:when>
                <xsl:when test="substring($dateString,6,2) = '07'">July</xsl:when>
                <xsl:when test="substring($dateString,6,2) = '08'">August</xsl:when>
                <xsl:when test="substring($dateString,6,2) = '09'">September</xsl:when>
                <xsl:when test="substring($dateString,6,2) = '10'">October</xsl:when>
                <xsl:when test="substring($dateString,6,2) = '11'">November</xsl:when>
                <xsl:when test="substring($dateString,6,2) = '12'">December</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="concat($month,' ',substring($dateString,9,2),', ',substring($dateString,1,4))"/>
    </xsl:function>
    
    <!-- 
        Prints out full language name from abbreviation. 
        List based on the ISO 639-2b three-letter language codes (http://www.loc.gov/standards/iso639-2/php/code_list.php). 
    -->
    <xsl:template match="ead:language">
        <xsl:variable name="lod" select="'Language of description: '"/>
        <xsl:choose>
            <xsl:when test="@langcode = 'No_linguistic_content'">No linguistic content</xsl:when>
                <xsl:when test="@langcode = 'und'"><xsl:value-of select="concat($lod, 'Undetermined')"/></xsl:when>
                <xsl:when test="@langcode = 'abk'"><xsl:value-of select="concat($lod, 'Abkhaz')"/></xsl:when>
                <xsl:when test="@langcode = 'ace'"><xsl:value-of select="concat($lod, 'Achinese')"/></xsl:when>
                <xsl:when test="@langcode = 'ach'"><xsl:value-of select="concat($lod, 'Acoli')"/></xsl:when>
                <xsl:when test="@langcode = 'ada'"><xsl:value-of select="concat($lod, 'Adangme')"/></xsl:when>
                <xsl:when test="@langcode = 'ady'"><xsl:value-of select="concat($lod, 'Adygei')"/></xsl:when>
                <xsl:when test="@langcode = 'aar'"><xsl:value-of select="concat($lod, 'Afar')"/></xsl:when>
                <xsl:when test="@langcode = 'afh'"><xsl:value-of select="concat($lod, 'Afrihili')"/></xsl:when>
                <xsl:when test="@langcode = 'afr'"><xsl:value-of select="concat($lod, 'Afrikaans')"/></xsl:when>
                <xsl:when test="@langcode = 'afa'"><xsl:value-of select="concat($lod, 'Afroasiatic (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'aka'"><xsl:value-of select="concat($lod, 'Akan')"/></xsl:when>
                <xsl:when test="@langcode = 'akk'"><xsl:value-of select="concat($lod, 'Akkadian')"/></xsl:when>
                <xsl:when test="@langcode = 'alb'"><xsl:value-of select="concat($lod, 'Albanian')"/></xsl:when>
                <xsl:when test="@langcode = 'ale'"><xsl:value-of select="concat($lod, 'Aleut')"/></xsl:when>
                <xsl:when test="@langcode = 'alg'"><xsl:value-of select="concat($lod, 'Algonquian (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'tut'"><xsl:value-of select="concat($lod, 'Altaic (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'amh'"><xsl:value-of select="concat($lod, 'Amharic')"/></xsl:when>
                <xsl:when test="@langcode = 'apa'"><xsl:value-of select="concat($lod, 'Apache languages')"/></xsl:when>
                <xsl:when test="@langcode = 'ara'"><xsl:value-of select="concat($lod, 'Arabic')"/></xsl:when>
                <xsl:when test="@langcode = 'arg'"><xsl:value-of select="concat($lod, 'Aragonese Spanish')"/></xsl:when>
                <xsl:when test="@langcode = 'arc'"><xsl:value-of select="concat($lod, 'Aramaic')"/></xsl:when>
                <xsl:when test="@langcode = 'arp'"><xsl:value-of select="concat($lod, 'Arapaho')"/></xsl:when>
                <xsl:when test="@langcode = 'arw'"><xsl:value-of select="concat($lod, 'Arawak')"/></xsl:when>
                <xsl:when test="@langcode = 'arm'"><xsl:value-of select="concat($lod, 'Armenian')"/></xsl:when>
                <xsl:when test="@langcode = 'art'"><xsl:value-of select="concat($lod, 'Artificial (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'asm'"><xsl:value-of select="concat($lod, 'Assamese')"/></xsl:when>
                <xsl:when test="@langcode = 'ath'"><xsl:value-of select="concat($lod, 'Athapascan (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'aus'"><xsl:value-of select="concat($lod, 'Australian languages')"/></xsl:when>
                <xsl:when test="@langcode = 'map'"><xsl:value-of select="concat($lod, 'Austronesian (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'ava'"><xsl:value-of select="concat($lod, 'Avaric')"/></xsl:when>
                <xsl:when test="@langcode = 'ave'"><xsl:value-of select="concat($lod, 'Avestan')"/></xsl:when>
                <xsl:when test="@langcode = 'awa'"><xsl:value-of select="concat($lod, 'Awadhi')"/></xsl:when>
                <xsl:when test="@langcode = 'aym'"><xsl:value-of select="concat($lod, 'Aymara')"/></xsl:when>
                <xsl:when test="@langcode = 'aze'"><xsl:value-of select="concat($lod, 'Azerbaijani')"/></xsl:when>
                <xsl:when test="@langcode = 'ast'"><xsl:value-of select="concat($lod, 'Bable')"/></xsl:when>
                <xsl:when test="@langcode = 'ban'"><xsl:value-of select="concat($lod, 'Balinese')"/></xsl:when>
                <xsl:when test="@langcode = 'bat'"><xsl:value-of select="concat($lod, 'Baltic (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'bal'"><xsl:value-of select="concat($lod, 'Baluchi')"/></xsl:when>
                <xsl:when test="@langcode = 'bam'"><xsl:value-of select="concat($lod, 'Bambara')"/></xsl:when>
                <xsl:when test="@langcode = 'bai'"><xsl:value-of select="concat($lod, 'Bamileke languages')"/></xsl:when>
                <xsl:when test="@langcode = 'bad'"><xsl:value-of select="concat($lod, 'Banda')"/></xsl:when>
                <xsl:when test="@langcode = 'bnt'"><xsl:value-of select="concat($lod, 'Bantu (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'bas'"><xsl:value-of select="concat($lod, 'Basa')"/></xsl:when>
                <xsl:when test="@langcode = 'bak'"><xsl:value-of select="concat($lod, 'Bashkir')"/></xsl:when>
                <xsl:when test="@langcode = 'baq'"><xsl:value-of select="concat($lod, 'Basque')"/></xsl:when>
                <xsl:when test="@langcode = 'btk'"><xsl:value-of select="concat($lod, 'Batak')"/></xsl:when>
                <xsl:when test="@langcode = 'bej'"><xsl:value-of select="concat($lod, 'Beja')"/></xsl:when>
                <xsl:when test="@langcode = 'bel'"><xsl:value-of select="concat($lod, 'Belarusian')"/></xsl:when>
                <xsl:when test="@langcode = 'bem'"><xsl:value-of select="concat($lod, 'Bemba')"/></xsl:when>
                <xsl:when test="@langcode = 'ben'"><xsl:value-of select="concat($lod, 'Bengali')"/></xsl:when>
                <xsl:when test="@langcode = 'ber'"><xsl:value-of select="concat($lod, 'Berber (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'bho'"><xsl:value-of select="concat($lod, 'Bhojpuri')"/></xsl:when>
                <xsl:when test="@langcode = 'bih'"><xsl:value-of select="concat($lod, 'Bihari')"/></xsl:when>
                <xsl:when test="@langcode = 'bik'"><xsl:value-of select="concat($lod, 'Bikol')"/></xsl:when>
                <xsl:when test="@langcode = 'bis'"><xsl:value-of select="concat($lod, 'Bislama')"/></xsl:when>
                <xsl:when test="@langcode = 'bos'"><xsl:value-of select="concat($lod, 'Bosnian')"/></xsl:when>
                <xsl:when test="@langcode = 'bra'"><xsl:value-of select="concat($lod, 'Braj')"/></xsl:when>
                <xsl:when test="@langcode = 'bre'"><xsl:value-of select="concat($lod, 'Breton')"/></xsl:when>
                <xsl:when test="@langcode = 'bug'"><xsl:value-of select="concat($lod, 'Bugis')"/></xsl:when>
                <xsl:when test="@langcode = 'bul'"><xsl:value-of select="concat($lod, 'Bulgarian')"/></xsl:when>
                <xsl:when test="@langcode = 'bua'"><xsl:value-of select="concat($lod, 'Buriat')"/></xsl:when>
                <xsl:when test="@langcode = 'bur'"><xsl:value-of select="concat($lod, 'Burmese')"/></xsl:when>
                <xsl:when test="@langcode = 'cad'"><xsl:value-of select="concat($lod, 'Caddo')"/></xsl:when>
                <xsl:when test="@langcode = 'car'"><xsl:value-of select="concat($lod, 'Carib')"/></xsl:when>
                <xsl:when test="@langcode = 'cat'"><xsl:value-of select="concat($lod, 'Catalan')"/></xsl:when>
                <xsl:when test="@langcode = 'cau'"><xsl:value-of select="concat($lod, 'Caucasian (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'ceb'"><xsl:value-of select="concat($lod, 'Cebuano')"/></xsl:when>
                <xsl:when test="@langcode = 'cel'"><xsl:value-of select="concat($lod, 'Celtic (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'cai'"><xsl:value-of select="concat($lod, 'Central American Indian (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'chg'"><xsl:value-of select="concat($lod, 'Chagatai')"/></xsl:when>
                <xsl:when test="@langcode = 'cmc'"><xsl:value-of select="concat($lod, 'Chamic languages')"/></xsl:when>
                <xsl:when test="@langcode = 'cha'"><xsl:value-of select="concat($lod, 'Chamorro')"/></xsl:when>
                <xsl:when test="@langcode = 'che'"><xsl:value-of select="concat($lod, 'Chechen')"/></xsl:when>
                <xsl:when test="@langcode = 'chr'"><xsl:value-of select="concat($lod, 'Cherokee')"/></xsl:when>
                <xsl:when test="@langcode = 'chy'"><xsl:value-of select="concat($lod, 'Cheyenne')"/></xsl:when>
                <xsl:when test="@langcode = 'chb'"><xsl:value-of select="concat($lod, 'Chibcha')"/></xsl:when>
                <xsl:when test="@langcode = 'chi'"><xsl:value-of select="concat($lod, 'Chinese')"/></xsl:when>
                <xsl:when test="@langcode = 'chn'"><xsl:value-of select="concat($lod, 'Chinook jargon')"/></xsl:when>
                <xsl:when test="@langcode = 'chp'"><xsl:value-of select="concat($lod, 'Chipewyan')"/></xsl:when>
                <xsl:when test="@langcode = 'cho'"><xsl:value-of select="concat($lod, 'Choctaw')"/></xsl:when>
                <xsl:when test="@langcode = 'chu'"><xsl:value-of select="concat($lod, 'Church Slavic')"/></xsl:when>
                <xsl:when test="@langcode = 'chv'"><xsl:value-of select="concat($lod, 'Chuvash')"/></xsl:when>
                <xsl:when test="@langcode = 'cop'"><xsl:value-of select="concat($lod, 'Coptic')"/></xsl:when>
                <xsl:when test="@langcode = 'cor'"><xsl:value-of select="concat($lod, 'Cornish')"/></xsl:when>
                <xsl:when test="@langcode = 'cos'"><xsl:value-of select="concat($lod, 'Corsican')"/></xsl:when>
                <xsl:when test="@langcode = 'cre'"><xsl:value-of select="concat($lod, 'Cree')"/></xsl:when>
                <xsl:when test="@langcode = 'mus'"><xsl:value-of select="concat($lod, 'Creek')"/></xsl:when>
                <xsl:when test="@langcode = 'crp'"><xsl:value-of select="concat($lod, 'Creoles and Pidgins(Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'cpe'"><xsl:value-of select="concat($lod, 'Creoles and Pidgins, English-based (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'cpf'"><xsl:value-of select="concat($lod, 'Creoles and Pidgins, French-based (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'cpp'"><xsl:value-of select="concat($lod, 'Creoles and Pidgins, Portuguese-based (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'crh'"><xsl:value-of select="concat($lod, 'Crimean Tatar')"/></xsl:when>
                <xsl:when test="@langcode = 'scr'"><xsl:value-of select="concat($lod, 'Croatian')"/></xsl:when>
                <xsl:when test="@langcode = 'cus'"><xsl:value-of select="concat($lod, 'Cushitic (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'cze'"><xsl:value-of select="concat($lod, 'Czech')"/></xsl:when>
                <xsl:when test="@langcode = 'dak'"><xsl:value-of select="concat($lod, 'Dakota')"/></xsl:when>
                <xsl:when test="@langcode = 'dan'"><xsl:value-of select="concat($lod, 'Danish')"/></xsl:when>
                <xsl:when test="@langcode = 'dar'"><xsl:value-of select="concat($lod, 'Dargwa')"/></xsl:when>
                <xsl:when test="@langcode = 'day'"><xsl:value-of select="concat($lod, 'Dayak')"/></xsl:when>
                <xsl:when test="@langcode = 'del'"><xsl:value-of select="concat($lod, 'Delaware')"/></xsl:when>
                <xsl:when test="@langcode = 'din'"><xsl:value-of select="concat($lod, 'Dinka')"/></xsl:when>
                <xsl:when test="@langcode = 'div'"><xsl:value-of select="concat($lod, 'Divehi')"/></xsl:when>
                <xsl:when test="@langcode = 'doi'"><xsl:value-of select="concat($lod, 'Dogri')"/></xsl:when>
                <xsl:when test="@langcode = 'dgr'"><xsl:value-of select="concat($lod, 'Dogrib')"/></xsl:when>
                <xsl:when test="@langcode = 'dra'"><xsl:value-of select="concat($lod, 'Dravidian (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'dua'"><xsl:value-of select="concat($lod, 'Duala')"/></xsl:when>
                <xsl:when test="@langcode = 'dut'"><xsl:value-of select="concat($lod, 'Dutch')"/></xsl:when>
                <xsl:when test="@langcode = 'dum'"><xsl:value-of select="concat($lod, 'Dutch, Middle (ca. 1050-1350)')"/></xsl:when>
                <xsl:when test="@langcode = 'dyu'"><xsl:value-of select="concat($lod, 'Dyula')"/></xsl:when>
                <xsl:when test="@langcode = 'dzo'"><xsl:value-of select="concat($lod, 'Dzongkha')"/></xsl:when>
                <xsl:when test="@langcode = 'bin'"><xsl:value-of select="concat($lod, 'Edo')"/></xsl:when>
                <xsl:when test="@langcode = 'efi'"><xsl:value-of select="concat($lod, 'Efik')"/></xsl:when>
                <xsl:when test="@langcode = 'egy'"><xsl:value-of select="concat($lod, 'Egyptian (Ancient)')"/></xsl:when>
                <xsl:when test="@langcode = 'eka'"><xsl:value-of select="concat($lod, 'Ekajuk')"/></xsl:when>
                <xsl:when test="@langcode = 'elx'"><xsl:value-of select="concat($lod, 'Elamite')"/></xsl:when>
                <xsl:when test="@langcode = 'eng'"><xsl:value-of select="concat($lod, 'English')"/></xsl:when>
                <xsl:when test="@langcode = 'enm'"><xsl:value-of select="concat($lod, 'English, Middle (1100-1500)')"/></xsl:when>
                <xsl:when test="@langcode = 'ang'"><xsl:value-of select="concat($lod, 'English, Old (ca.450-1100)')"/></xsl:when>
                <xsl:when test="@langcode = 'epo'"><xsl:value-of select="concat($lod, 'Esperanto')"/></xsl:when>
                <xsl:when test="@langcode = 'est'"><xsl:value-of select="concat($lod, 'Estonian')"/></xsl:when>
                <xsl:when test="@langcode = 'gez'"><xsl:value-of select="concat($lod, 'Ethiopic')"/></xsl:when>
                <xsl:when test="@langcode = 'ewe'"><xsl:value-of select="concat($lod, 'Ewe')"/></xsl:when>
                <xsl:when test="@langcode = 'ewo'"><xsl:value-of select="concat($lod, 'Ewondo')"/></xsl:when>
                <xsl:when test="@langcode = 'fan'"><xsl:value-of select="concat($lod, 'Fang')"/></xsl:when>
                <xsl:when test="@langcode = 'fat'"><xsl:value-of select="concat($lod, 'Fanti')"/></xsl:when>
                <xsl:when test="@langcode = 'fao'"><xsl:value-of select="concat($lod, 'Faroese')"/></xsl:when>
                <xsl:when test="@langcode = 'fij'"><xsl:value-of select="concat($lod, 'Fijian')"/></xsl:when>
                <xsl:when test="@langcode = 'fin'"><xsl:value-of select="concat($lod, 'Finnish')"/></xsl:when>
                <xsl:when test="@langcode = 'fiu'"><xsl:value-of select="concat($lod, 'Finno-Ugrian (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'fon'"><xsl:value-of select="concat($lod, 'Fon')"/></xsl:when>
                <xsl:when test="@langcode = 'fre'"><xsl:value-of select="concat($lod, 'French')"/></xsl:when>
                <xsl:when test="@langcode = 'frm'"><xsl:value-of select="concat($lod, 'French, Middle (ca.1400-1600)')"/></xsl:when>
                <xsl:when test="@langcode = 'fro'"><xsl:value-of select="concat($lod, 'French, Old (ca.842-1400)')"/></xsl:when>
                <xsl:when test="@langcode = 'fry'"><xsl:value-of select="concat($lod, 'Frisian')"/></xsl:when>
                <xsl:when test="@langcode = 'fur'"><xsl:value-of select="concat($lod, 'Friulian')"/></xsl:when>
                <xsl:when test="@langcode = 'ful'"><xsl:value-of select="concat($lod, 'Fula')"/></xsl:when>
                <xsl:when test="@langcode = 'gaa'"><xsl:value-of select="concat($lod, 'Gã')"/></xsl:when>
                <xsl:when test="@langcode = 'glg'"><xsl:value-of select="concat($lod, 'Galician')"/></xsl:when>
                <xsl:when test="@langcode = 'lug'"><xsl:value-of select="concat($lod, 'Ganda')"/></xsl:when>
                <xsl:when test="@langcode = 'gay'"><xsl:value-of select="concat($lod, 'Gayo')"/></xsl:when>
                <xsl:when test="@langcode = 'gba'"><xsl:value-of select="concat($lod, 'Gbaya')"/></xsl:when>
                <xsl:when test="@langcode = 'geo'"><xsl:value-of select="concat($lod, 'Georgian')"/></xsl:when>
                <xsl:when test="@langcode = 'ger'"><xsl:value-of select="concat($lod, 'German')"/></xsl:when>
                <xsl:when test="@langcode = 'gmh'"><xsl:value-of select="concat($lod, 'German, Middle High (ca.1050-1500)')"/></xsl:when>
                <xsl:when test="@langcode = 'goh'"><xsl:value-of select="concat($lod, 'German, Old High (ca.750-1050)')"/></xsl:when>
                <xsl:when test="@langcode = 'gem'"><xsl:value-of select="concat($lod, 'Germanic (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'gil'"><xsl:value-of select="concat($lod, 'Gilbertese')"/></xsl:when>
                <xsl:when test="@langcode = 'gon'"><xsl:value-of select="concat($lod, 'Gondi')"/></xsl:when>
                <xsl:when test="@langcode = 'gor'"><xsl:value-of select="concat($lod, 'Gorontalo')"/></xsl:when>
                <xsl:when test="@langcode = 'got'"><xsl:value-of select="concat($lod, 'Gothic')"/></xsl:when>
                <xsl:when test="@langcode = 'grb'"><xsl:value-of select="concat($lod, 'Grebo')"/></xsl:when>
                <xsl:when test="@langcode = 'grc'"><xsl:value-of select="concat($lod, 'Greek, Ancient (to 1453)')"/></xsl:when>
                <xsl:when test="@langcode = 'gre'"><xsl:value-of select="concat($lod, 'Greek, Modern (1453-)')"/></xsl:when>
                <xsl:when test="@langcode = 'grn'"><xsl:value-of select="concat($lod, 'Guarani')"/></xsl:when>
                <xsl:when test="@langcode = 'guj'"><xsl:value-of select="concat($lod, 'Gujarati')"/></xsl:when>
                <xsl:when test="@langcode = 'gwi'"><xsl:value-of select="concat($lod, 'Gwichin')"/></xsl:when>
                <xsl:when test="@langcode = 'hai'"><xsl:value-of select="concat($lod, 'Haida')"/></xsl:when>
                <xsl:when test="@langcode = 'hat'"><xsl:value-of select="concat($lod, 'Haitian French Creole')"/></xsl:when>
                <xsl:when test="@langcode = 'hau'"><xsl:value-of select="concat($lod, 'Hausa')"/></xsl:when>
                <xsl:when test="@langcode = 'haw'"><xsl:value-of select="concat($lod, 'Hawaiian')"/></xsl:when>
                <xsl:when test="@langcode = 'heb'"><xsl:value-of select="concat($lod, 'Hebrew')"/></xsl:when>
                <xsl:when test="@langcode = 'her'"><xsl:value-of select="concat($lod, 'Herero')"/></xsl:when>
                <xsl:when test="@langcode = 'hil'"><xsl:value-of select="concat($lod, 'Hiligaynon')"/></xsl:when>
                <xsl:when test="@langcode = 'him'"><xsl:value-of select="concat($lod, 'Himachali')"/></xsl:when>
                <xsl:when test="@langcode = 'hin'"><xsl:value-of select="concat($lod, 'Hindi')"/></xsl:when>
                <xsl:when test="@langcode = 'hmo'"><xsl:value-of select="concat($lod, 'Hiri Motu')"/></xsl:when>
                <xsl:when test="@langcode = 'hit'"><xsl:value-of select="concat($lod, 'Hittite')"/></xsl:when>
                <xsl:when test="@langcode = 'hmn'"><xsl:value-of select="concat($lod, 'Hmong')"/></xsl:when>
                <xsl:when test="@langcode = 'hun'"><xsl:value-of select="concat($lod, 'Hungarian')"/></xsl:when>
                <xsl:when test="@langcode = 'hup'"><xsl:value-of select="concat($lod, 'Hupa')"/></xsl:when>
                <xsl:when test="@langcode = 'iba'"><xsl:value-of select="concat($lod, 'Iban')"/></xsl:when>
                <xsl:when test="@langcode = 'ice'"><xsl:value-of select="concat($lod, 'Icelandic')"/></xsl:when>
                <xsl:when test="@langcode = 'ido'"><xsl:value-of select="concat($lod, 'Ido')"/></xsl:when>
                <xsl:when test="@langcode = 'ibo'"><xsl:value-of select="concat($lod, 'Igbo')"/></xsl:when>
                <xsl:when test="@langcode = 'ijo'"><xsl:value-of select="concat($lod, 'Ijo')"/></xsl:when>
                <xsl:when test="@langcode = 'ilo'"><xsl:value-of select="concat($lod, 'Iloko')"/></xsl:when>
                <xsl:when test="@langcode = 'smn'"><xsl:value-of select="concat($lod, 'Inari Sami')"/></xsl:when>
                <xsl:when test="@langcode = 'inc'"><xsl:value-of select="concat($lod, 'Indic (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'ine'"><xsl:value-of select="concat($lod, 'Indo-European (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'ind'"><xsl:value-of select="concat($lod, 'Indonesian')"/></xsl:when>
                <xsl:when test="@langcode = 'inh'"><xsl:value-of select="concat($lod, 'Ingush')"/></xsl:when>
                <xsl:when test="@langcode = 'ina'"><xsl:value-of select="concat($lod, 'Interlingua (International Auxiliary Language Association)')"/></xsl:when>
                <xsl:when test="@langcode = 'ile'"><xsl:value-of select="concat($lod, 'Interlingue')"/></xsl:when>
                <xsl:when test="@langcode = 'iku'"><xsl:value-of select="concat($lod, 'Inuktitut')"/></xsl:when>
                <xsl:when test="@langcode = 'ipk'"><xsl:value-of select="concat($lod, 'Inupiaq')"/></xsl:when>
                <xsl:when test="@langcode = 'ira'"><xsl:value-of select="concat($lod, 'Iranian (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'gle'"><xsl:value-of select="concat($lod, 'Irish')"/></xsl:when>
                <xsl:when test="@langcode = 'mga'"><xsl:value-of select="concat($lod, 'Irish, Middle (ca.1110-1550)')"/></xsl:when>
                <xsl:when test="@langcode = 'sga'"><xsl:value-of select="concat($lod, 'Irish, Old (to 1100)')"/></xsl:when>
                <xsl:when test="@langcode = 'iro'"><xsl:value-of select="concat($lod, 'Iroquoian (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'ita'"><xsl:value-of select="concat($lod, 'Italian')"/></xsl:when>
                <xsl:when test="@langcode = 'jpn'"><xsl:value-of select="concat($lod, 'Japanese')"/></xsl:when>
                <xsl:when test="@langcode = 'jav'"><xsl:value-of select="concat($lod, 'Javanese')"/></xsl:when>
                <xsl:when test="@langcode = 'jrb'"><xsl:value-of select="concat($lod, 'Judeo-Arabic')"/></xsl:when>
                <xsl:when test="@langcode = 'jpr'"><xsl:value-of select="concat($lod, 'Judeo-Persian')"/></xsl:when>
                <xsl:when test="@langcode = 'kbd'"><xsl:value-of select="concat($lod, 'Kabardian')"/></xsl:when>
                <xsl:when test="@langcode = 'kab'"><xsl:value-of select="concat($lod, 'Kabyle')"/></xsl:when>
                <xsl:when test="@langcode = 'kac'"><xsl:value-of select="concat($lod, 'Kachin')"/></xsl:when>
                <xsl:when test="@langcode = 'kal'"><xsl:value-of select="concat($lod, 'Kalâtdlisut')"/></xsl:when>
                <xsl:when test="@langcode = 'xal'"><xsl:value-of select="concat($lod, 'Kalmyk')"/></xsl:when>
                <xsl:when test="@langcode = 'kam'"><xsl:value-of select="concat($lod, 'Kamba')"/></xsl:when>
                <xsl:when test="@langcode = 'kan'"><xsl:value-of select="concat($lod, 'Kannada')"/></xsl:when>
                <xsl:when test="@langcode = 'kau'"><xsl:value-of select="concat($lod, 'Kanuri')"/></xsl:when>
                <xsl:when test="@langcode = 'kaa'"><xsl:value-of select="concat($lod, 'Kara-Kalpak')"/></xsl:when>
                <xsl:when test="@langcode = 'kar'"><xsl:value-of select="concat($lod, 'Karen')"/></xsl:when>
                <xsl:when test="@langcode = 'kas'"><xsl:value-of select="concat($lod, 'Kashmiri')"/></xsl:when>
                <xsl:when test="@langcode = 'kaw'"><xsl:value-of select="concat($lod, 'Kawi')"/></xsl:when>
                <xsl:when test="@langcode = 'kaz'"><xsl:value-of select="concat($lod, 'Kazakh')"/></xsl:when>
                <xsl:when test="@langcode = 'kha'"><xsl:value-of select="concat($lod, 'Khasi')"/></xsl:when>
                <xsl:when test="@langcode = 'khm'"><xsl:value-of select="concat($lod, 'Khmer')"/></xsl:when>
                <xsl:when test="@langcode = 'khi'"><xsl:value-of select="concat($lod, 'Khoisan (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'kho'"><xsl:value-of select="concat($lod, 'Khotanese')"/></xsl:when>
                <xsl:when test="@langcode = 'kik'"><xsl:value-of select="concat($lod, 'Kikuyu')"/></xsl:when>
                <xsl:when test="@langcode = 'kmb'"><xsl:value-of select="concat($lod, 'Kimbundu')"/></xsl:when>
                <xsl:when test="@langcode = 'kin'"><xsl:value-of select="concat($lod, 'Kinyarwanda')"/></xsl:when>
                <xsl:when test="@langcode = 'kom'"><xsl:value-of select="concat($lod, 'Komi')"/></xsl:when>
                <xsl:when test="@langcode = 'kon'"><xsl:value-of select="concat($lod, 'Kongo')"/></xsl:when>
                <xsl:when test="@langcode = 'kok'"><xsl:value-of select="concat($lod, 'Konkani')"/></xsl:when>
                <xsl:when test="@langcode = 'kor'"><xsl:value-of select="concat($lod, 'Korean')"/></xsl:when>
                <xsl:when test="@langcode = 'kpe'"><xsl:value-of select="concat($lod, 'Kpelle')"/></xsl:when>
                <xsl:when test="@langcode = 'kro'"><xsl:value-of select="concat($lod, 'Kru (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'kua'"><xsl:value-of select="concat($lod, 'Kuanyama')"/></xsl:when>
                <xsl:when test="@langcode = 'kum'"><xsl:value-of select="concat($lod, 'Kumyk')"/></xsl:when>
                <xsl:when test="@langcode = 'kur'"><xsl:value-of select="concat($lod, 'Kurdish')"/></xsl:when>
                <xsl:when test="@langcode = 'kru'"><xsl:value-of select="concat($lod, 'Kurukh')"/></xsl:when>
                <xsl:when test="@langcode = 'kos'"><xsl:value-of select="concat($lod, 'Kusaie')"/></xsl:when>
                <xsl:when test="@langcode = 'kut'"><xsl:value-of select="concat($lod, 'Kutenai')"/></xsl:when>
                <xsl:when test="@langcode = 'kir'"><xsl:value-of select="concat($lod, 'Kyrgyz')"/></xsl:when>
                <xsl:when test="@langcode = 'lad'"><xsl:value-of select="concat($lod, 'Ladino')"/></xsl:when>
                <xsl:when test="@langcode = 'lah'"><xsl:value-of select="concat($lod, 'Lahnda')"/></xsl:when>
                <xsl:when test="@langcode = 'lam'"><xsl:value-of select="concat($lod, 'Lamba')"/></xsl:when>
                <xsl:when test="@langcode = 'lao'"><xsl:value-of select="concat($lod, 'Lao')"/></xsl:when>
                <xsl:when test="@langcode = 'lat'"><xsl:value-of select="concat($lod, 'Latin')"/></xsl:when>
                <xsl:when test="@langcode = 'lav'"><xsl:value-of select="concat($lod, 'Latvian')"/></xsl:when>
                <xsl:when test="@langcode = 'ltz'"><xsl:value-of select="concat($lod, 'Letzeburgesch')"/></xsl:when>
                <xsl:when test="@langcode = 'lez'"><xsl:value-of select="concat($lod, 'Lezgian')"/></xsl:when>
                <xsl:when test="@langcode = 'lim'"><xsl:value-of select="concat($lod, 'Limburgish')"/></xsl:when>
                <xsl:when test="@langcode = 'lin'"><xsl:value-of select="concat($lod, 'Lingala')"/></xsl:when>
                <xsl:when test="@langcode = 'lit'"><xsl:value-of select="concat($lod, 'Lithuanian')"/></xsl:when>
                <xsl:when test="@langcode = 'nds'"><xsl:value-of select="concat($lod, 'Low German')"/></xsl:when>
                <xsl:when test="@langcode = 'loz'"><xsl:value-of select="concat($lod, 'Lozi')"/></xsl:when>
                <xsl:when test="@langcode = 'lub'"><xsl:value-of select="concat($lod, 'Luba-Katanga')"/></xsl:when>
                <xsl:when test="@langcode = 'lua'"><xsl:value-of select="concat($lod, 'Luba-Lulua')"/></xsl:when>
                <xsl:when test="@langcode = 'lui'"><xsl:value-of select="concat($lod, 'Luiseño')"/></xsl:when>
                <xsl:when test="@langcode = 'smj'"><xsl:value-of select="concat($lod, 'Lule Sami')"/></xsl:when>
                <xsl:when test="@langcode = 'lun'"><xsl:value-of select="concat($lod, 'Lunda')"/></xsl:when>
                <xsl:when test="@langcode = 'luo'"><xsl:value-of select="concat($lod, 'Luo (Kenya and Tanzania)')"/></xsl:when>
                <xsl:when test="@langcode = 'lus'"><xsl:value-of select="concat($lod, 'Lushai')"/></xsl:when>
                <xsl:when test="@langcode = 'mac'"><xsl:value-of select="concat($lod, 'Macedonian')"/></xsl:when>
                <xsl:when test="@langcode = 'mad'"><xsl:value-of select="concat($lod, 'Madurese')"/></xsl:when>
                <xsl:when test="@langcode = 'mag'"><xsl:value-of select="concat($lod, 'Magahi')"/></xsl:when>
                <xsl:when test="@langcode = 'mai'"><xsl:value-of select="concat($lod, 'Maithili')"/></xsl:when>
                <xsl:when test="@langcode = 'mak'"><xsl:value-of select="concat($lod, 'Makasar')"/></xsl:when>
                <xsl:when test="@langcode = 'mlg'"><xsl:value-of select="concat($lod, 'Malagasy')"/></xsl:when>
                <xsl:when test="@langcode = 'may'"><xsl:value-of select="concat($lod, 'Malay')"/></xsl:when>
                <xsl:when test="@langcode = 'mal'"><xsl:value-of select="concat($lod, 'Malayalam')"/></xsl:when>
                <xsl:when test="@langcode = 'mlt'"><xsl:value-of select="concat($lod, 'Maltese')"/></xsl:when>
                <xsl:when test="@langcode = 'mnc'"><xsl:value-of select="concat($lod, 'Manchu')"/></xsl:when>
                <xsl:when test="@langcode = 'mdr'"><xsl:value-of select="concat($lod, 'Mandar')"/></xsl:when>
                <xsl:when test="@langcode = 'man'"><xsl:value-of select="concat($lod, 'Mandingo')"/></xsl:when>
                <xsl:when test="@langcode = 'mni'"><xsl:value-of select="concat($lod, 'Manipuri')"/></xsl:when>
                <xsl:when test="@langcode = 'mno'"><xsl:value-of select="concat($lod, 'Manobo languages')"/></xsl:when>
                <xsl:when test="@langcode = 'glv'"><xsl:value-of select="concat($lod, 'Manx')"/></xsl:when>
                <xsl:when test="@langcode = 'mao'"><xsl:value-of select="concat($lod, 'Maori')"/></xsl:when>
                <xsl:when test="@langcode = 'arn'"><xsl:value-of select="concat($lod, 'Mapuche')"/></xsl:when>
                <xsl:when test="@langcode = 'mar'"><xsl:value-of select="concat($lod, 'Marathi')"/></xsl:when>
                <xsl:when test="@langcode = 'chm'"><xsl:value-of select="concat($lod, 'Mari')"/></xsl:when>
                <xsl:when test="@langcode = 'mah'"><xsl:value-of select="concat($lod, 'Marshallese')"/></xsl:when>
                <xsl:when test="@langcode = 'mwr'"><xsl:value-of select="concat($lod, 'Marwari')"/></xsl:when>
                <xsl:when test="@langcode = 'mas'"><xsl:value-of select="concat($lod, 'Masai')"/></xsl:when>
                <xsl:when test="@langcode = 'myn'"><xsl:value-of select="concat($lod, 'Mayan languages')"/></xsl:when>
                <xsl:when test="@langcode = 'men'"><xsl:value-of select="concat($lod, 'Mende')"/></xsl:when>
                <xsl:when test="@langcode = 'mic'"><xsl:value-of select="concat($lod, 'Micmac')"/></xsl:when>
                <xsl:when test="@langcode = 'min'"><xsl:value-of select="concat($lod, 'Minangkabau')"/></xsl:when>
                <xsl:when test="@langcode = 'mis'"><xsl:value-of select="concat($lod, 'Miscellaneous languages')"/></xsl:when>
                <xsl:when test="@langcode = 'moh'"><xsl:value-of select="concat($lod, 'Mohawk')"/></xsl:when>
                <xsl:when test="@langcode = 'mol'"><xsl:value-of select="concat($lod, 'Moldavian')"/></xsl:when>
                <xsl:when test="@langcode = 'mkh'"><xsl:value-of select="concat($lod, 'Mon-Khmer (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'lol'"><xsl:value-of select="concat($lod, 'Mongo-Nkundu')"/></xsl:when>
                <xsl:when test="@langcode = 'mon'"><xsl:value-of select="concat($lod, 'Mongolian')"/></xsl:when>
                <xsl:when test="@langcode = 'mos'"><xsl:value-of select="concat($lod, 'Mooré')"/></xsl:when>
                <xsl:when test="@langcode = 'mul'"><xsl:value-of select="concat($lod, 'Multiple languages')"/></xsl:when>
                <xsl:when test="@langcode = 'mun'"><xsl:value-of select="concat($lod, 'Munda (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'nah'"><xsl:value-of select="concat($lod, 'Nahuatl')"/></xsl:when>
                <xsl:when test="@langcode = 'nau'"><xsl:value-of select="concat($lod, 'Nauru')"/></xsl:when>
                <xsl:when test="@langcode = 'nav'"><xsl:value-of select="concat($lod, 'Navajo')"/></xsl:when>
                <xsl:when test="@langcode = 'nbl'"><xsl:value-of select="concat($lod, 'Ndebele (South Africa)')"/></xsl:when>
                <xsl:when test="@langcode = 'nde'"><xsl:value-of select="concat($lod, 'Ndebele (Zimbabwe)')"/></xsl:when>
                <xsl:when test="@langcode = 'ndo'"><xsl:value-of select="concat($lod, 'Ndonga')"/></xsl:when>
                <xsl:when test="@langcode = 'nap'"><xsl:value-of select="concat($lod, 'Neapolitan Italian')"/></xsl:when>
                <xsl:when test="@langcode = 'nep'"><xsl:value-of select="concat($lod, 'Nepali')"/></xsl:when>
                <xsl:when test="@langcode = 'new'"><xsl:value-of select="concat($lod, 'Newari')"/></xsl:when>
                <xsl:when test="@langcode = 'nia'"><xsl:value-of select="concat($lod, 'Nias')"/></xsl:when>
                <xsl:when test="@langcode = 'nic'"><xsl:value-of select="concat($lod, 'Niger-Kordofanian (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'ssa'"><xsl:value-of select="concat($lod, 'Nilo-Saharan (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'niu'"><xsl:value-of select="concat($lod, 'Niuean')"/></xsl:when>
                <xsl:when test="@langcode = 'nog'"><xsl:value-of select="concat($lod, 'Nogai')"/></xsl:when>
                <xsl:when test="@langcode = 'nai'"><xsl:value-of select="concat($lod, 'North American Indian (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'sme'"><xsl:value-of select="concat($lod, 'Northern Sami')"/></xsl:when>
                <xsl:when test="@langcode = 'nso'"><xsl:value-of select="concat($lod, 'Northern Sotho')"/></xsl:when>
                <xsl:when test="@langcode = 'nor'"><xsl:value-of select="concat($lod, 'Norwegian')"/></xsl:when>
                <xsl:when test="@langcode = 'nob'"><xsl:value-of select="concat($lod, 'Norwegian Bokmål')"/></xsl:when>
                <xsl:when test="@langcode = 'nno'"><xsl:value-of select="concat($lod, 'Norwegian Nynorsk')"/></xsl:when>
                <xsl:when test="@langcode = 'nub'"><xsl:value-of select="concat($lod, 'Nubian languages')"/></xsl:when>
                <xsl:when test="@langcode = 'nym'"><xsl:value-of select="concat($lod, 'Nyamwezi')"/></xsl:when>
                <xsl:when test="@langcode = 'nya'"><xsl:value-of select="concat($lod, 'Nyanja')"/></xsl:when>
                <xsl:when test="@langcode = 'nyn'"><xsl:value-of select="concat($lod, 'Nyankole')"/></xsl:when>
                <xsl:when test="@langcode = 'nyo'"><xsl:value-of select="concat($lod, 'Nyoro')"/></xsl:when>
                <xsl:when test="@langcode = 'nzi'"><xsl:value-of select="concat($lod, 'Nzima')"/></xsl:when>
                <xsl:when test="@langcode = 'oci'"><xsl:value-of select="concat($lod, 'Occitan (post-1500)')"/></xsl:when>
                <xsl:when test="@langcode = 'oji'"><xsl:value-of select="concat($lod, 'Ojibwa')"/></xsl:when>
                <xsl:when test="@langcode = 'non'"><xsl:value-of select="concat($lod, 'Old Norse')"/></xsl:when>
                <xsl:when test="@langcode = 'peo'"><xsl:value-of select="concat($lod, 'Old Persian (ca.600-400 B.C.)')"/></xsl:when>
                <xsl:when test="@langcode = 'ori'"><xsl:value-of select="concat($lod, 'Oriya')"/></xsl:when>
                <xsl:when test="@langcode = 'orm'"><xsl:value-of select="concat($lod, 'Oromo')"/></xsl:when>
                <xsl:when test="@langcode = 'osa'"><xsl:value-of select="concat($lod, 'Osage')"/></xsl:when>
                <xsl:when test="@langcode = 'oss'"><xsl:value-of select="concat($lod, 'Ossetic')"/></xsl:when>
                <xsl:when test="@langcode = 'oto'"><xsl:value-of select="concat($lod, 'Otomian languages')"/></xsl:when>
                <xsl:when test="@langcode = 'pal'"><xsl:value-of select="concat($lod, 'Pahlavi')"/></xsl:when>
                <xsl:when test="@langcode = 'pau'"><xsl:value-of select="concat($lod, 'Palauan')"/></xsl:when>
                <xsl:when test="@langcode = 'pli'"><xsl:value-of select="concat($lod, 'Pali')"/></xsl:when>
                <xsl:when test="@langcode = 'pam'"><xsl:value-of select="concat($lod, 'Pampanga')"/></xsl:when>
                <xsl:when test="@langcode = 'pag'"><xsl:value-of select="concat($lod, 'Pangasinan')"/></xsl:when>
                <xsl:when test="@langcode = 'pan'"><xsl:value-of select="concat($lod, 'Panjabi')"/></xsl:when>
                <xsl:when test="@langcode = 'pap'"><xsl:value-of select="concat($lod, 'Papiamento')"/></xsl:when>
                <xsl:when test="@langcode = 'paa'"><xsl:value-of select="concat($lod, 'Papuan (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'per'"><xsl:value-of select="concat($lod, 'Persian')"/></xsl:when>
                <xsl:when test="@langcode = 'phi'"><xsl:value-of select="concat($lod, 'Philippine (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'phn'"><xsl:value-of select="concat($lod, 'Phoenician')"/></xsl:when>
                <xsl:when test="@langcode = 'pol'"><xsl:value-of select="concat($lod, 'Polish')"/></xsl:when>
                <xsl:when test="@langcode = 'pon'"><xsl:value-of select="concat($lod, 'Ponape')"/></xsl:when>
                <xsl:when test="@langcode = 'por'"><xsl:value-of select="concat($lod, 'Portuguese')"/></xsl:when>
                <xsl:when test="@langcode = 'pra'"><xsl:value-of select="concat($lod, 'Prakrit languages')"/></xsl:when>
                <xsl:when test="@langcode = 'pro'"><xsl:value-of select="concat($lod, 'Provençal (to 1500)')"/></xsl:when>
                <xsl:when test="@langcode = 'pus'"><xsl:value-of select="concat($lod, 'Pushto')"/></xsl:when>
                <xsl:when test="@langcode = 'que'"><xsl:value-of select="concat($lod, 'Quechua')"/></xsl:when>
                <xsl:when test="@langcode = 'roh'"><xsl:value-of select="concat($lod, 'Raeto-Romance')"/></xsl:when>
                <xsl:when test="@langcode = 'raj'"><xsl:value-of select="concat($lod, 'Rajasthani')"/></xsl:when>
                <xsl:when test="@langcode = 'rap'"><xsl:value-of select="concat($lod, 'Rapanui')"/></xsl:when>
                <xsl:when test="@langcode = 'rar'"><xsl:value-of select="concat($lod, 'Rarotongan')"/></xsl:when>
                <xsl:when test="@langcode = 'qaa-qtz'"><xsl:value-of select="concat($lod, 'Reserved for local user')"/></xsl:when>
                <xsl:when test="@langcode = 'roa'"><xsl:value-of select="concat($lod, 'Romance (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'rom'"><xsl:value-of select="concat($lod, 'Romani')"/></xsl:when>
                <xsl:when test="@langcode = 'rum'"><xsl:value-of select="concat($lod, 'Romanian')"/></xsl:when>
                <xsl:when test="@langcode = 'run'"><xsl:value-of select="concat($lod, 'Rundi')"/></xsl:when>
                <xsl:when test="@langcode = 'rus'"><xsl:value-of select="concat($lod, 'Russian')"/></xsl:when>
                <xsl:when test="@langcode = 'sal'"><xsl:value-of select="concat($lod, 'Salishan languages')"/></xsl:when>
                <xsl:when test="@langcode = 'sam'"><xsl:value-of select="concat($lod, 'Samaritan Aramaic')"/></xsl:when>
                <xsl:when test="@langcode = 'smi'"><xsl:value-of select="concat($lod, 'Sami')"/></xsl:when>
                <xsl:when test="@langcode = 'smo'"><xsl:value-of select="concat($lod, 'Samoan')"/></xsl:when>
                <xsl:when test="@langcode = 'sad'"><xsl:value-of select="concat($lod, 'Sandawe')"/></xsl:when>
                <xsl:when test="@langcode = 'sag'"><xsl:value-of select="concat($lod, 'Sango (Ubangi Creole)')"/></xsl:when>
                <xsl:when test="@langcode = 'san'"><xsl:value-of select="concat($lod, 'Sanskrit')"/></xsl:when>
                <xsl:when test="@langcode = 'sat'"><xsl:value-of select="concat($lod, 'Santali')"/></xsl:when>
                <xsl:when test="@langcode = 'srd'"><xsl:value-of select="concat($lod, 'Sardinian')"/></xsl:when>
                <xsl:when test="@langcode = 'sas'"><xsl:value-of select="concat($lod, 'Sasak')"/></xsl:when>
                <xsl:when test="@langcode = 'sco'"><xsl:value-of select="concat($lod, 'Scots')"/></xsl:when>
                <xsl:when test="@langcode = 'gla'"><xsl:value-of select="concat($lod, 'Scottish Gaelic')"/></xsl:when>
                <xsl:when test="@langcode = 'sel'"><xsl:value-of select="concat($lod, 'Selkup')"/></xsl:when>
                <xsl:when test="@langcode = 'sem'"><xsl:value-of select="concat($lod, 'Semitic (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'scc'"><xsl:value-of select="concat($lod, 'Serbian')"/></xsl:when>
                <xsl:when test="@langcode = 'srr'"><xsl:value-of select="concat($lod, 'Serer')"/></xsl:when>
                <xsl:when test="@langcode = 'shn'"><xsl:value-of select="concat($lod, 'Shan')"/></xsl:when>
                <xsl:when test="@langcode = 'sna'"><xsl:value-of select="concat($lod, 'Shona')"/></xsl:when>
                <xsl:when test="@langcode = 'iii'"><xsl:value-of select="concat($lod, 'Sichuan Yi')"/></xsl:when>
                <xsl:when test="@langcode = 'sid'"><xsl:value-of select="concat($lod, 'Sidamo')"/></xsl:when>
                <xsl:when test="@langcode = 'sgn'"><xsl:value-of select="concat($lod, 'Sign languages')"/></xsl:when>
                <xsl:when test="@langcode = 'bla'"><xsl:value-of select="concat($lod, 'Siksika')"/></xsl:when>
                <xsl:when test="@langcode = 'snd'"><xsl:value-of select="concat($lod, 'Sindhi')"/></xsl:when>
                <xsl:when test="@langcode = 'sin'"><xsl:value-of select="concat($lod, 'Sinhalese')"/></xsl:when>
                <xsl:when test="@langcode = 'sit'"><xsl:value-of select="concat($lod, 'Sino-Tibetan (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'sio'"><xsl:value-of select="concat($lod, 'Siouan (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'sms'"><xsl:value-of select="concat($lod, 'Skolt Sami')"/></xsl:when>
                <xsl:when test="@langcode = 'den'"><xsl:value-of select="concat($lod, 'Slave')"/></xsl:when>
                <xsl:when test="@langcode = 'sla'"><xsl:value-of select="concat($lod, 'Slavic (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'slo'"><xsl:value-of select="concat($lod, 'Slovak')"/></xsl:when>
                <xsl:when test="@langcode = 'slv'"><xsl:value-of select="concat($lod, 'Slovenian')"/></xsl:when>
                <xsl:when test="@langcode = 'sog'"><xsl:value-of select="concat($lod, 'Sogdian')"/></xsl:when>
                <xsl:when test="@langcode = 'som'"><xsl:value-of select="concat($lod, 'Somali')"/></xsl:when>
                <xsl:when test="@langcode = 'son'"><xsl:value-of select="concat($lod, 'Songhai')"/></xsl:when>
                <xsl:when test="@langcode = 'snk'"><xsl:value-of select="concat($lod, 'Soninke')"/></xsl:when>
                <xsl:when test="@langcode = 'wen'"><xsl:value-of select="concat($lod, 'Sorbian languages')"/></xsl:when>
                <xsl:when test="@langcode = 'sot'"><xsl:value-of select="concat($lod, 'Sotho')"/></xsl:when>
                <xsl:when test="@langcode = 'sai'"><xsl:value-of select="concat($lod, 'South American Indian (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'sma'"><xsl:value-of select="concat($lod, 'Southern Sami')"/></xsl:when>
                <xsl:when test="@langcode = 'spa'"><xsl:value-of select="concat($lod, 'Spanish')"/></xsl:when>
                <xsl:when test="@langcode = 'suk'"><xsl:value-of select="concat($lod, 'Sukuma')"/></xsl:when>
                <xsl:when test="@langcode = 'sux'"><xsl:value-of select="concat($lod, 'Sumerian')"/></xsl:when>
                <xsl:when test="@langcode = 'sun'"><xsl:value-of select="concat($lod, 'Sundanese')"/></xsl:when>
                <xsl:when test="@langcode = 'sus'"><xsl:value-of select="concat($lod, 'Susu')"/></xsl:when>
                <xsl:when test="@langcode = 'swa'"><xsl:value-of select="concat($lod, 'Swahili')"/></xsl:when>
                <xsl:when test="@langcode = 'ssw'"><xsl:value-of select="concat($lod, 'Swazi')"/></xsl:when>
                <xsl:when test="@langcode = 'swe'"><xsl:value-of select="concat($lod, 'Swedish')"/></xsl:when>
                <xsl:when test="@langcode = 'syr'"><xsl:value-of select="concat($lod, 'Syriac')"/></xsl:when>
                <xsl:when test="@langcode = 'tgl'"><xsl:value-of select="concat($lod, 'Tagalog')"/></xsl:when>
                <xsl:when test="@langcode = 'tah'"><xsl:value-of select="concat($lod, 'Tahitian')"/></xsl:when>
                <xsl:when test="@langcode = 'tai'"><xsl:value-of select="concat($lod, 'Tai (Other)')"/></xsl:when>
                <xsl:when test="@langcode = 'tgk'"><xsl:value-of select="concat($lod, 'Tajik')"/></xsl:when>
                <xsl:when test="@langcode = 'tmh'"><xsl:value-of select="concat($lod, 'Tamashek')"/></xsl:when>
                <xsl:when test="@langcode = 'tam'"><xsl:value-of select="concat($lod, 'Tamil')"/></xsl:when>
                <xsl:when test="@langcode = 'tat'"><xsl:value-of select="concat($lod, 'Tatar')"/></xsl:when>
                <xsl:when test="@langcode = 'tel'"><xsl:value-of select="concat($lod, 'Telugu')"/></xsl:when>
                <xsl:when test="@langcode = 'tem'"><xsl:value-of select="concat($lod, 'Temne')"/></xsl:when>
                <xsl:when test="@langcode = 'ter'"><xsl:value-of select="concat($lod, 'Terena')"/></xsl:when>
                <xsl:when test="@langcode = 'tet'"><xsl:value-of select="concat($lod, 'Tetum')"/></xsl:when>
                <xsl:when test="@langcode = 'tha'"><xsl:value-of select="concat($lod, 'Thai')"/></xsl:when>
                <xsl:when test="@langcode = 'tib'"><xsl:value-of select="concat($lod, 'Tibetan')"/></xsl:when>
                <xsl:when test="@langcode = 'tig'"><xsl:value-of select="concat($lod, 'Tigré')"/></xsl:when>
                <xsl:when test="@langcode = 'tir'"><xsl:value-of select="concat($lod, 'Tigrinya')"/></xsl:when>
                <xsl:when test="@langcode = 'tiv'"><xsl:value-of select="concat($lod, 'Tiv')"/></xsl:when>
                <xsl:when test="@langcode = 'tli'"><xsl:value-of select="concat($lod, 'Tlingit')"/></xsl:when>
                <xsl:when test="@langcode = 'tpi'"><xsl:value-of select="concat($lod, 'Tok Pisin')"/></xsl:when>
                <xsl:when test="@langcode = 'tkl'"><xsl:value-of select="concat($lod, 'Tokelauan')"/></xsl:when>
                <xsl:when test="@langcode = 'tog'"><xsl:value-of select="concat($lod, 'Tonga (Nyasa)')"/></xsl:when>
                <xsl:when test="@langcode = 'ton'"><xsl:value-of select="concat($lod, 'Tongan')"/></xsl:when>
                <xsl:when test="@langcode = 'chk'"><xsl:value-of select="concat($lod, 'Truk')"/></xsl:when>
                <xsl:when test="@langcode = 'tsi'"><xsl:value-of select="concat($lod, 'Tsimshian')"/></xsl:when>
                <xsl:when test="@langcode = 'tso'"><xsl:value-of select="concat($lod, 'Tsonga')"/></xsl:when>
                <xsl:when test="@langcode = 'tsn'"><xsl:value-of select="concat($lod, 'Tswana')"/></xsl:when>
                <xsl:when test="@langcode = 'tum'"><xsl:value-of select="concat($lod, 'Tumbuka')"/></xsl:when>
                <xsl:when test="@langcode = 'tup'"><xsl:value-of select="concat($lod, 'Tupi languages')"/></xsl:when>
                <xsl:when test="@langcode = 'tur'"><xsl:value-of select="concat($lod, 'Turkish')"/></xsl:when>
                <xsl:when test="@langcode = 'ota'"><xsl:value-of select="concat($lod, 'Turkish, Ottoman')"/></xsl:when>
                <xsl:when test="@langcode = 'tuk'"><xsl:value-of select="concat($lod, 'Turkmen')"/></xsl:when>
                <xsl:when test="@langcode = 'tvl'"><xsl:value-of select="concat($lod, 'Tuvaluan')"/></xsl:when>
                <xsl:when test="@langcode = 'tyv'"><xsl:value-of select="concat($lod, 'Tuvinian')"/></xsl:when>
                <xsl:when test="@langcode = 'twi'"><xsl:value-of select="concat($lod, 'Twi')"/></xsl:when>
                <xsl:when test="@langcode = 'udm'"><xsl:value-of select="concat($lod, 'Udmurt')"/></xsl:when>
                <xsl:when test="@langcode = 'uga'"><xsl:value-of select="concat($lod, 'Ugaritic')"/></xsl:when>
                <xsl:when test="@langcode = 'uig'"><xsl:value-of select="concat($lod, 'Uighur')"/></xsl:when>
                <xsl:when test="@langcode = 'ukr'"><xsl:value-of select="concat($lod, 'Ukrainian')"/></xsl:when>
                <xsl:when test="@langcode = 'umb'"><xsl:value-of select="concat($lod, 'Umbundu')"/></xsl:when>
                <xsl:when test="@langcode = 'und'"><xsl:value-of select="concat($lod, 'Undetermined')"/></xsl:when>
                <xsl:when test="@langcode = 'urd'"><xsl:value-of select="concat($lod, 'Urdu')"/></xsl:when>
                <xsl:when test="@langcode = 'uzb'"><xsl:value-of select="concat($lod, 'Uzbek')"/></xsl:when>
                <xsl:when test="@langcode = 'vai'"><xsl:value-of select="concat($lod, 'Vai')"/></xsl:when>
                <xsl:when test="@langcode = 'ven'"><xsl:value-of select="concat($lod, 'Venda')"/></xsl:when>
                <xsl:when test="@langcode = 'vie'"><xsl:value-of select="concat($lod, 'Vietnamese')"/></xsl:when>
                <xsl:when test="@langcode = 'vol'"><xsl:value-of select="concat($lod, 'Volapük')"/></xsl:when>
                <xsl:when test="@langcode = 'vot'"><xsl:value-of select="concat($lod, 'Votic')"/></xsl:when>
                <xsl:when test="@langcode = 'wak'"><xsl:value-of select="concat($lod, 'Wakashan languages')"/></xsl:when>
                <xsl:when test="@langcode = 'wal'"><xsl:value-of select="concat($lod, 'Walamo')"/></xsl:when>
                <xsl:when test="@langcode = 'wln'"><xsl:value-of select="concat($lod, 'Walloon')"/></xsl:when>
                <xsl:when test="@langcode = 'war'"><xsl:value-of select="concat($lod, 'Waray')"/></xsl:when>
                <xsl:when test="@langcode = 'was'"><xsl:value-of select="concat($lod, 'Washo')"/></xsl:when>
                <xsl:when test="@langcode = 'wel'"><xsl:value-of select="concat($lod, 'Welsh')"/></xsl:when>
                <xsl:when test="@langcode = 'wol'"><xsl:value-of select="concat($lod, 'Wolof')"/></xsl:when>
                <xsl:when test="@langcode = 'xho'"><xsl:value-of select="concat($lod, 'Xhosa')"/></xsl:when>
                <xsl:when test="@langcode = 'sah'"><xsl:value-of select="concat($lod, 'Yakut')"/></xsl:when>
                <xsl:when test="@langcode = 'yao'"><xsl:value-of select="concat($lod, 'Yao (Africa)')"/></xsl:when>
                <xsl:when test="@langcode = 'yap'"><xsl:value-of select="concat($lod, 'Yapese')"/></xsl:when>
                <xsl:when test="@langcode = 'yid'"><xsl:value-of select="concat($lod, 'Yiddish')"/></xsl:when>
                <xsl:when test="@langcode = 'yor'"><xsl:value-of select="concat($lod, 'Yoruba')"/></xsl:when>
                <xsl:when test="@langcode = 'ypk'"><xsl:value-of select="concat($lod, 'Yupik languages')"/></xsl:when>
                <xsl:when test="@langcode = 'znd'"><xsl:value-of select="concat($lod, 'Zande')"/></xsl:when>
                <xsl:when test="@langcode = 'zap'"><xsl:value-of select="concat($lod, 'Zapotec')"/></xsl:when>
                <xsl:when test="@langcode = 'zen'"><xsl:value-of select="concat($lod, 'Zenaga')"/></xsl:when>
                <xsl:when test="@langcode = 'zha'"><xsl:value-of select="concat($lod, 'Zhuang')"/></xsl:when>
                <xsl:when test="@langcode = 'zul'"><xsl:value-of select="concat($lod, 'Zulu')"/></xsl:when>
                <xsl:when test="@langcode = 'zun'"><xsl:value-of select="concat($lod, 'Zuni')"/></xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- Prnts full subject authority names -->
    <xsl:template name="subjectSource">
        <xsl:choose>
            <xsl:when test="@source = 'aat'"> [Source: Art &amp; Architecture Thesaurus]</xsl:when>
            <xsl:when test="@source = 'dot'"> [Source:Dictionary of Occupational Titles]</xsl:when>
            <xsl:when test="@source = 'rbgenr'"> [Source:Genre Terms: A Thesaurus for Use in Rare Book and Special Collections Cataloging]</xsl:when>
            <xsl:when test="@source = 'georeft'"> [Source:GeoRef Thesaurus]</xsl:when>
            <xsl:when test="@source = 'tgn'"> [Source:Getty Thesaurus of Geographic Names]</xsl:when>
            <xsl:when test="@source = 'lcsh'"> [Source:Library of Congress Subject Headings]</xsl:when>
            <xsl:when test="@source = 'local'"> [Source:Local sources]</xsl:when>
            <xsl:when test="@source = 'mesh'"> [Source:Medical Subject Headings]</xsl:when>
            <xsl:when test="@source = 'gmgpc'"> [Source:Thesaurus for Graphic Materials]</xsl:when>
            <xsl:when test="@source = 'ingest'"/>
            <xsl:otherwise> [Source:<xsl:value-of select="@source"/>]</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
