//= require uploader/locales/en
//= require uploader/tmpl.min
//= require uploader/load-image.min
//= require uploader/jquery.iframe-transport
//= require uploader/jquery.fileupload
//= require uploader/jquery.fileupload-ui

$('.uploader-dnd-area input[type=file]').trigger("init.uploader");

$('.uploader-files').each(function() {
    var $t = $(this);
    $t.sortable({
        update: function(event, ui) {
            var sort = [];
            $t.children().each(function() {
                sort.push($(this).data('id'));
            });
            $.ajax({
                type: 'POST',
                url: $t.data('sortPath'),
                data: {sort: sort.join('|')}
            })
        }
    })
});