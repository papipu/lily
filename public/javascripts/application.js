$(document).ready(function() {
    var config = {
        toolbar:
        [
        ['Source'],['Copy','Paste'],['Undo','Redo'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','RemoveFormat'],
        ['Link','Unlink'],['Image','Flash','Table'],
        '/',
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Font','FontSize'],['TextColor','BGColor'],
        ]
    };
    $('.ckeditor').ckeditor(config);
    $('a.image').lightBox({
        imageLoading: '/images/lightbox-ico-loading.gif',
	imageBtnClose:'/images/lightbox-btn-close.gif',
	imageBtnPrev: '/images/lightbox-btn-prev.gif',
	imageBtnNext: '/images/lightbox-btn-next.gif',
        imageBlank: '/images/lightbox-blank.gif'
    });
});