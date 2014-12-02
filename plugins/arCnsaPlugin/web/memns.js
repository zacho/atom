jQuery( document ).ready(function( $ ){
  $( "#repository-html-snippet" ).next().insertBefore( "#repository-html-snippet" );
  $( "#repository-html-snippet" ).css( "margin-top", "10px" );
  $( ".read-more" ).each( function( index ) {
    $( this ).css( "display", "none" );
    $( this ).next( ".details" ).css( "display", "inline" );
    $( this ).parent( "p" ).parent( ".summary" ).css( "display", "none" );
    $( this ).parent( "p" ).parent( ".summary" ).next( ".details" ).css( "display", "inline" );
  });
  $( ".term.index" ).find( ".actions > ul" ).append( "<li><a class=\"c-btn\" href=\""+window.location.href+"/term/browseTerm\" title=\"Browse\">Browse</a></li>" )
});
