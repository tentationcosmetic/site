$(document).ready(function(){
if($('.ax_productscategory').length > 1) {$('.ax_productscategory').first().addClass('accessoires').insertBefore('.info-product');}
  
// if(Date.now() >= 1647730800000 && Date.now() <= 1648418399000) {
//  $('.logo').attr('src','https://raw.githubusercontent.com/evanxiia/tentation/main/tentation_spring.svg').attr('title', 'Printemps 2022');
// }
// if(Date.now() >= 1650146400000 && Date.now() <= 1650232799000) {
//   $('.logo').attr('src','https://raw.githubusercontent.com/evanxiia/tentation/main/tentation_easter.svg').attr('title', 'Joyeuse Pâques');
// }


// Ajout des bandeaux promotions sur les miniatures produits contenant le mot clé PROMO
if(isLogged != 0) {
  $('[title*="PROMO"]').parent('.product-container').addClass('promo');
  if($('#reduction_percent_display').length >= 1) {
  if($('#reduction_percent_display').html().length > 1) {
    $('.pb-left-column #image-block').append('<span class="sale-box no-print"> <span class="sale-label">Promo !</span> </span>');
  }
}
} 


// Ajout d'un bouton pour vider le panier
if($('#cart_summary').length >= 1) {
  $('#cart_summary').append('<button class="cart_empty btn btn-primary ">Vider le panier</button>');
}


$('.cart_empty').on('click', function() {
    if(window.confirm("Souhaitez-vous vider votre panier ?")) {
    $('.cart_quantity_delete').each(function() {
        $(this).click();
    });
  }
});
  
  $('#contact #id_contact').on('change',function() { 
    if($('#id_contact').val() == '3') {
    $("#fileUpload").prop("required", true);
} else {
        $("#fileUpload").prop("required", false)
    }

} );
  
  $('tr[id$="gift"] a').attr('href', '#'); 
  
  $("<div class='page-subheading' data-axseo-oldtag='h3'>Vous avez déjà commandé chez nous ? <br> <br>Votre compte existe déjà ! <br> <br><a class='cauth-btn btn btn-lg btn-block btn-blue' href='https://drive.google.com/file/d/1OfAPkjT0Lft38dbDRYpbQp_Ii9T39qp1/view?usp=sharing' target='_blank'>Découvrez comment vous connecter !</a></p>").insertBefore("#authentication .page-subheading:first-child");

});


